library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity name requested by user
entity blink is
    port (
        -- System Clock Input (10MHz)
        CLK_10M_IN      : in  STD_LOGIC;                                -- FPGA 10MHz Reference Clock

        -- Serial Data Output (10 Mbps, Manchester Encoded)
        TX_DATA_OUT     : out STD_LOGIC := '0'
    );
end entity blink;

architecture behavioral of blink is
    -- ** VHDL CONSTANTS (Moved from Package) **
    -- Define constants for the Ethernet Frame Data
    -- The frame is structured as: PREAMBLE(7) + SFD(1) + DMAC(6) + SMAC(6) + ETYPE(2) + PAYLOAD(46) + FCS(4) = 72 Bytes
    
    -- 7 bytes Preamble (0x55) + 1 byte SFD (0xD5)
    constant FRAME_HEADER : STD_LOGIC_VECTOR(63 downto 0) := x"55555555555555D5";
    -- 6 bytes Destination MAC (ff:ff:ff:ff:ff:ff)
    constant DST_MAC      : STD_LOGIC_VECTOR(47 downto 0) := x"FFFFFFFFFFFF";
    -- 6 bytes Source MAC (00:11:22:33:44:55)
    constant SRC_MAC      : STD_LOGIC_VECTOR(47 downto 0) := x"001122334455";
    -- 2 bytes EtherType (0x0800 for IPv4)
    constant ETHER_TYPE   : STD_LOGIC_VECTOR(15 downto 0) := x"0800";
    -- 46 bytes Minimum Padding (all zeros, for empty payload)
    -- CORRECTION: Changed 45 * 8 to 46 * 8 to ensure the FRAME_DATA concatenation is exactly 512 bits.
    constant PAYLOAD_PAD  : STD_LOGIC_VECTOR(46 * 8 - 1 downto 0) := (others => '0'); 
    -- 4 bytes Frame Check Sequence (FCS/CRC32) - Placeholder
    constant FCS_PLACEHDR : STD_LOGIC_VECTOR(31 downto 0) := x"C0DEBA5E";

    -- Combined data payload (DMAC + SMAC + ETYPE + PAYLOAD + FCS)
    constant FRAME_DATA_LEN : integer := 6 + 6 + 2 + 46 + 4; -- 64 bytes (512 bits)
    constant FRAME_DATA : STD_LOGIC_VECTOR(FRAME_DATA_LEN * 8 - 1 downto 0) :=
        DST_MAC & SRC_MAC & ETHER_TYPE & PAYLOAD_PAD & FCS_PLACEHDR;

    constant TOTAL_BITS : integer := 72 * 8; -- 576 bits total (Preamble+SFD + FRAME_DATA)
    -- Total sequence: Preamble/SFD (64 bits) + FRAME_DATA (512 bits) = 576 bits
    constant TOTAL_FRAME_SEQUENCE : STD_LOGIC_VECTOR(TOTAL_BITS - 1 downto 0) := FRAME_HEADER & FRAME_DATA;
    -- ** END VHDL CONSTANTS **

    -- Define the custom PLL component provided by the vendor
    -- IMPORTANT: Component declarations MUST be inside the architecture before the 'begin' keyword.
    component CC_PLL is
        generic (
            REF_CLK         : string;  -- reference input in MHz
            OUT_CLK         : string;  -- pll output frequency in MHz
            PERF_MD         : string;  -- LOWPOWER, ECONOMY, SPEED
            LOW_JITTER      : integer; -- 0: disable, 1: enable low jitter mode
            CI_FILTER_CONST : integer; -- optional CI filter constant
            CP_FILTER_CONST : integer  -- optional CP filter constant
        );
        port (
            CLK_REF         : in  STD_LOGIC;
            USR_CLK_REF     : in  STD_LOGIC;
            CLK_FEEDBACK    : in  STD_LOGIC;
            USR_LOCKED_STDY_RST : in  STD_LOGIC;
            USR_PLL_LOCKED_STDY : out STD_LOGIC;
            USR_PLL_LOCKED  : out STD_LOGIC;
            CLK0            : out STD_LOGIC;
            CLK90           : out STD_LOGIC;
            CLK180          : out STD_LOGIC;
            CLK270          : out STD_LOGIC;
            CLK_REF_OUT     : out STD_LOGIC
        );
    end component CC_PLL;


    -- Internal PLL Output Clock (100MHz for state machine and Manchester encoding)
    signal CLK_100M         : STD_LOGIC;
    signal PLL_LOCKED_INT   : STD_LOGIC;
    
    -- State Machine for Frame Generation
    -- S_RESET: Initial power-on/PLL wait.
    -- S_IDLE: Ready to transmit.
    -- S_INTER_FRAME_GAP: 10ms delay between transmissions.
    type state_type is (S_RESET, S_IDLE, S_PREAMBLE_SFD, S_FRAME_DATA, S_INTER_FRAME_GAP);
    signal current_state    : state_type := S_RESET;

    -- Counters
    -- bit_counter counts from 0 to 575 (for 576 total bits)
    signal bit_counter      : unsigned(9 downto 0) := (others => '0'); 
    -- clk_half_counter counts 0 to 9 for 10 cycles (100ns) = 1 full data bit period @ 100MHz
    signal clk_half_counter : unsigned(3 downto 0) := (others => '0');
    
    -- Delay Timer for 10ms pause (10ms * 100MHz = 1,000,000 cycles)
    constant DELAY_MAX      : integer := 1_000_000;
    signal delay_timer      : unsigned(19 downto 0) := (others => '0'); 
    
    -- Data Registers
    -- The raw data bit being encoded in the current 100ns period
    signal current_data_bit : STD_LOGIC := '0';
    -- Internal TX_EN signal (tracks if a frame is currently being transmitted)
    signal tx_active        : STD_LOGIC := '0'; 

begin

    -- 1. Clock Generation using Vendor PLL
    -- Generates a 100MHz clock from the 10MHz reference.
    PLL_INST: CC_PLL
        generic map (
            REF_CLK         => "10.0",
            OUT_CLK         => "100.0",
            PERF_MD         => "ECONOMY", 
            LOW_JITTER      => 1,
            CI_FILTER_CONST => 2,         
            CP_FILTER_CONST => 4          
        )
        port map (
            CLK_REF             => CLK_10M_IN,
            USR_CLK_REF         => '0',
            CLK_FEEDBACK        => '0',
            USR_LOCKED_STDY_RST => '0',
            USR_PLL_LOCKED_STDY => open,
            USR_PLL_LOCKED      => PLL_LOCKED_INT,
            CLK0                => CLK_100M,
            CLK90               => open,
            CLK180              => open,
            CLK270              => open,
            CLK_REF_OUT         => open
        );

    -- 2. State Machine and Manchester Encoding Logic (Runs on 100MHz CLK_100M)
    process (CLK_100M)
    begin
        if rising_edge(CLK_100M) then

            -- The clock-divider counter for the 100ns data bit period always runs
            if clk_half_counter = 9 then -- 10 cycles = 100ns = 1 data bit
                clk_half_counter <= (others => '0');
            else
                clk_half_counter <= clk_half_counter + 1;
            end if;

            case current_state is
                when S_RESET =>
                    -- Stay in reset until PLL locks and a minimum reset time has passed (e.g., 100 cycles)
                    if PLL_LOCKED_INT = '1' and delay_timer >= 100 then
                        current_state <= S_IDLE;
                        delay_timer   <= (others => '0'); -- Reset delay timer
                        tx_active     <= '0';
                    else
                        delay_timer <= delay_timer + 1;
                    end if;

                when S_IDLE =>
                    tx_active <= '0';
                    TX_DATA_OUT <= '0'; -- Ensure output is low during idle
                    bit_counter <= (others => '0');
                    -- Start transmission immediately
                    current_state <= S_PREAMBLE_SFD;

                when S_PREAMBLE_SFD | S_FRAME_DATA =>
                    tx_active <= '1';

                    -- 3a. Read the next raw data bit at the start of a 100ns period (clk_half_counter = 0)
                    if clk_half_counter = 0 then
                        
                        -- The total frame length is 576 bits (72 bytes)
                        current_data_bit <= TOTAL_FRAME_SEQUENCE(TOTAL_BITS - 1 - to_integer(bit_counter));

                        -- Check for end of the entire frame sequence (576 bits total)
                        if bit_counter = TOTAL_BITS - 1 then
                            current_state <= S_INTER_FRAME_GAP;
                            delay_timer   <= (others => '0'); -- Start 10ms delay timer
                        end if;

                        -- Always increment the bit counter at the start of the 100ns period
                        bit_counter <= bit_counter + 1;
                    end if;

                    -- 3b. Manchester Encoding Logic (Output changes mid-period at clk_half_counter = 5)
                    -- IEEE 802.3 Standard: '0' = Low -> High, '1' = High -> Low
                    -- 

                    if clk_half_counter < 5 then -- First 50ns (cycles 0-4)
                        if current_data_bit = '0' then
                            TX_DATA_OUT <= '0'; -- First half of '0'
                        else
                            TX_DATA_OUT <= '1'; -- First half of '1'
                        end if;
                    else -- Second 50ns (cycles 5-9)
                        if current_data_bit = '0' then
                            TX_DATA_OUT <= '1'; -- Second half of '0' (Transition: 0 -> 1)
                        else
                            TX_DATA_OUT <= '0'; -- Second half of '1' (Transition: 1 -> 0)
                        end if;
                    end if;

                when S_INTER_FRAME_GAP =>
                    tx_active <= '0';
                    TX_DATA_OUT <= '0'; -- Ensure output is low during the gap (Inter-Frame Gap)

                    -- Wait for 10ms (1,000,000 cycles @ 100MHz)
                    if delay_timer = DELAY_MAX - 1 then
                        current_state <= S_IDLE; -- Transmission complete, loop back to IDLE
                    else
                        delay_timer <= delay_timer + 1;
                    end if;

                when others =>
                    current_state <= S_RESET; -- Safe fallback

            end case;
        end if;
    end process;

end architecture behavioral;