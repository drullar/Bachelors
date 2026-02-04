library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity name requested by user
entity ethernet_copy is
    port (
        -- System Clock Input (10MHz)
        clk      : in  STD_LOGIC;                               -- FPGA 10MHz Reference Clock
        reset    : in STD_LOGIC;
        clk_out        : out STD_LOGIC;
        tx             : out STD_LOGIC;
        tx2            : out STD_LOGIC;
        tx_raw         : out STD_LOGIC;
        tx_en          : out STD_LOGIC; -- Enables the transmission of data via the SN75C1168N chip. '0' should be transmitted when the state is IDLE, in all other cases it should be '1';
        uart_tx        : out STD_LOGIC
    );

    -- Ethernet Specific Constants
    constant PREAMBLE_BYTES : integer := 7;
    constant PREAMBLE_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    constant SFD_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    constant DEST_MAC : STD_LOGIC_VECTOR(47 downto 0) :=  x"ff_ff_ff_ff_ff_ff";
    constant SRC_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"10_82_86_18_ea_08"; -- x"00_00_00_00_00_00"; --
    constant UPPER_LAYER_TYPE : STD_LOGIC_VECTOR(15 downto 0) := x"88b5"; -- x"0000"; -- x"88b5"; -- or length if that is used instead
    signal PAYLOAD: STD_LOGIC_VECTOR(367 downto 0) := (others => '0'); -- Use minimal size of 46 bytes, i.e 367 bits

    -- signal FCS : STD_LOGIC_VECTOR(31 downto 0) := x"2934059A"; -- TODO calculate FCS in a separate process

    type TRANMISSION_STATE is (IDLE_s, NLP_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
    signal nextState : TRANMISSION_STATE := SFD_S; -- Can be changed Async
    signal transmissionState : TRANMISSION_STATE := nextState; -- Can be changed Sync only

    ---- UART Signals
    signal uart_tx_line : std_logic := '1';
    signal uart_start   : std_logic := '0'; -- Trigger this when FCS_s is done
    type UART_STATE_TYPE is (UART_IDLE, UART_START_BIT, UART_DATA, UART_STOP_BIT);
    signal uart_state : UART_STATE_TYPE := UART_IDLE;
end entity ethernet_copy;

architecture behavioral of ethernet_copy is
    constant DATA : STD_LOGIC_VECTOR(15 downto 0) := "1101010101001000";
    signal data_out: STD_LOGIC;
    signal tx_tmp : STD_LOGIC;
    signal tx_raw_tmp : STD_LOGIC;
    -- NLP const and variables
    constant NLP_TO_SEND : integer := 3;
    constant NLP_POS_LEN : integer := 100; -- 100ns NLP positive pulse length. Should last rougly a 1 CLK period
    constant NLP_INBETWEEN_INTERVAL : integer := 160_000; -- 16 000ns =  16ms between each pulse

    -- Signals for state machine logic
    signal nlp_done : boolean := false;
    signal nlp_tx_transmit : STD_LOGIC := '0';
    signal nlp_tx_en_transmit : STD_LOGIC := '1';
    signal nlp_idle_counter : unsigned(17 downto 0) := (others => '0');
    signal nlp_pulses_counter : unsigned (2 downto 0) := (others => '0'); -- Up to decimal 5

    signal idle_done : boolean := false;
    signal idle_tx_transmit : STD_LOGIC := '0';
    signal idle_tx_en_transmit : STD_LOGIC := '1'; -- TODO verify whether 0 or 1 has to be sent

    signal preamble_done : boolean := false;
    signal transmit_preamble : boolean := false;
    signal preamble_tx : STD_LOGIC := '0';

    signal load_sfd : boolean := false;
    signal sfd_done : boolean := false;
    signal sfd_tx : STD_LOGIC := '0';

    signal dst_mac_done : boolean := false;
    signal dst_mac_tx : STD_LOGIC := '0';
    signal calculate_dst_fcs : boolean := false;
    signal dst_fcs_byte : std_logic_vector(7 downto 0) := (others => '0');

    signal src_mac_done : boolean := false;
    signal src_mac_tx : STD_LOGIC := '0';
    signal calculate_src_fcs : boolean := false;
    signal src_fcs_byte : std_logic_vector(7 downto 0) := (others => '0');

    signal type_done : boolean := false;
    signal type_tx : STD_LOGIC := '0';
    signal calculate_type_fcs : boolean := false;
    signal type_fcs_byte : std_logic_vector(7 downto 0) := (others => '0');

    signal payload_done : boolean := false;
    signal payload_tx : STD_LOGIC := '0';
    signal calculate_data_fcs : boolean := false;
    signal data_fcs_byte : std_logic_vector(7 downto 0) := (others => '0');

    signal running_fcs : std_logic_vector(31 downto 0) := (others => '1');
    signal fcs_done : boolean := false;
    signal fcs_tx : STD_LOGIC := '0';

    signal process_clk : STD_LOGIC := clk;
    signal idle_signal_next : STD_LOGIC := '1';
begin

    p_STATE_CONTROL : process(clk)
    begin
        if rising_edge(clk) then

        end if;
    end process;

    p_IDLE : process(clk)
    variable idleCounter : integer  := 0;
    constant INTERFRAME_GAP_CYCLE_CNT : integer := 96_000 - 1; --96;
    begin
        if rising_edge(clk) then
            idle_done <= false;

            -- Use transmissionState, NOT nextState
            if transmissionState = IDLE_s then
                if idleCounter = INTERFRAME_GAP_CYCLE_CNT - 1 then
                idle_signal_next <= '1';
                idleCounter := idleCounter + 1;
                elsif idleCounter >= INTERFRAME_GAP_CYCLE_CNT then
                    idleCounter := 0;
                else
                    idleCounter := idleCounter + 1;
                end if;
            else
                idleCounter := 0; -- Reset counter when not in IDLE
            end if;
        end if;
    end process;

    p_LOAD_SFD : process(clk)
    variable sfd_bit : integer := 7;
    begin
        if rising_edge(clk) then
            if idle_signal_next then
                sfd_tx <= SFD_PATTERN(sfd_bit);
            end if;
        end if;
    end process;

    p_TRANSMIT_PREAMBLE : process(clk)
        variable preambleBitIndex     : integer := 7;
        variable currentPreambleByte  : integer := 1;
    begin
        if rising_edge(clk) then
            -- default: done is a one-cycle pulse
            preamble_done <= false;
            transmit_preamble <= false;

            if nextState = PREAMBLE_s then
                -- drive current bit
                preamble_tx <= PREAMBLE_PATTERN(preambleBitIndex);
                transmit_preamble <= true;

                -- advance bit counter
                if preambleBitIndex = 0 then
                    preambleBitIndex := 7;

                    if currentPreambleByte = PREAMBLE_BYTES then
                        preamble_done <= true;  -- pulse for 1 cycle
                    else
                        currentPreambleByte := currentPreambleByte + 1;
                    end if;
                else
                    preambleBitIndex := preambleBitIndex - 1;
                end if;

            else
                -- reset when not in PREAMBLE state
                preambleBitIndex    := 0;
                currentPreambleByte := 1;
                preamble_tx         <= '0';
            end if;
        end if;
    end process;



    TX_CONTROL : process(
    clk
   -- nlp_tx_transmit, nlp_tx_en_transmit, transmissionState,
   -- preamble_tx, sfd_tx, dst_mac_tx, src_mac_tx, type_tx, payload_tx, fcs_tx
    )
    begin
        if rising_edge(clk) then
            case transmissionState is -- TODO was nextState
            when IDLE_s =>
                tx_tmp <= '0';
                tx_en <= '0';
                tx_raw_tmp <= '0';
            when NLP_s =>
                --if nlp_idle_counter = 0 then
                tx_tmp <= nlp_tx_transmit;
                tx_en   <= nlp_tx_en_transmit;
                tx_raw_tmp <= '0';
            when PREAMBLE_s =>
                tx_tmp <= preamble_tx xor (not clk);
                tx_raw_tmp <= preamble_tx;
                tx_en <= '1';
            when SFD_s =>
                tx_tmp <= sfd_tx xor (not clk);
                tx_raw_tmp <= sfd_tx;
                tx_en <= '1';
            when DEST_MAC_s =>
                tx_tmp <= dst_mac_tx xor (not clk);
                tx_en <= '1';
                tx_raw_tmp <= '0';
            when SRC_MAC_s =>
                tx_tmp <= src_mac_tx xor (not clk);
                tx_en <= '1';
                tx_raw_tmp <= '0';
            when ETHER_TYPE_s =>
                tx_tmp <= type_tx xor (not clk);
                tx_en <= '1';
                tx_raw_tmp <= '0';
            when PAYLOAD_s =>
                tx_tmp <= payload_tx xor (not clk);
                tx_en <= '1';
                tx_raw_tmp <= '0';
            when FCS_S =>
                tx_tmp <= fcs_tx xor (not clk);
                tx_en <= '1';
                tx_raw_tmp <= '0';
            when others =>
                tx_tmp <= '0';
                tx_en <= '1';
                tx_raw_tmp <= '0';
            end case;
        end if;
        clk_out <= clk;
        tx <= tx_tmp;
        tx2 <= tx_tmp;
        tx_raw <= tx_raw_tmp;
    end process;
end architecture behavioral;
