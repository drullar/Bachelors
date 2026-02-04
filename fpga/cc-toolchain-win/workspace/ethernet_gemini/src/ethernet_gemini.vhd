library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ethernet_gemini is
    port (
        clk           : in  std_logic;      -- 100MHz
        start_tx      : in  std_logic;
        tx_out        : out std_logic;
        tx_out2       : out std_logic;
        debug_raw_tx  : out std_logic
    );
end entity;

architecture rtl of ethernet_gemini is

    component CC_PLL is
        generic (
            REF_CLK : string; OUT_CLK : string; PERF_MD : string;
            LOW_JITTER : integer; CI_FILTER_CONST : integer; CP_FILTER_CONST : integer
        );
        port (
            CLK_REF : in std_logic; USR_CLK_REF : in std_logic; CLK_FEEDBACK : in std_logic;
            USR_LOCKED_STDY_RST : in std_logic; USR_PLL_LOCKED_STDY : out std_logic;
            USR_PLL_LOCKED : out std_logic; CLK0 : out std_logic; CLK90 : out std_logic;
            CLK180 : out std_logic; CLK270 : out std_logic; CLK_REF_OUT : out std_logic
        );
    end component;

    signal clk_20m : std_logic;

    -- Frame Constants
    constant DEST_MAC : std_logic_vector(47 downto 0) := x"FFFFFFFFFFFF";
    constant SRC_MAC  : std_logic_vector(47 downto 0) := x"10828618EA08";
    constant ETYPE    : std_logic_vector(15 downto 0) := x"0800";
    constant PAYLOAD  : std_logic_vector(367 downto 0) := (others => '0');

    type state_type is (IDLE_HEARTBEAT, PREAMBLE, SFD, DATA, SEND_CRC, IPG);
    signal state : state_type := IDLE_HEARTBEAT;

    signal bit_phase         : std_logic := '0';
    signal bit_enable_strobe : std_logic := '0';

    -- Heartbeat Timing: 16ms at 10Mbps = 160,000 bit times
    signal heartbeat_cnt : integer range 0 to 160000 := 0;

    signal tx_raw_bit  : std_logic := '0';
    signal bit_index   : integer range 0 to 7 := 0;
    signal byte_count  : integer range 0 to 127 := 0;
    signal crc_bit_cnt : integer range 0 to 31 := 0;
    signal crc_reg     : std_logic_vector(31 downto 0) := (others => '1');

begin

    socket_pll : CC_PLL
    generic map (
        REF_CLK => "100.0", OUT_CLK => "20.0", PERF_MD => "ECONOMY",
        LOW_JITTER => 1, CI_FILTER_CONST => 2, CP_FILTER_CONST => 4
    )
    port map (
        CLK_REF => clk, USR_CLK_REF => '0', CLK_FEEDBACK => clk_20m,
        USR_LOCKED_STDY_RST => '0', USR_PLL_LOCKED_STDY => open,
        USR_PLL_LOCKED => open, CLK0 => clk_20m, CLK90 => open,
        CLK180 => open, CLK270 => open, CLK_REF_OUT => open
    );

    process(clk_20m)
    begin
        if rising_edge(clk_20m) then
            bit_phase <= not bit_phase;
            bit_enable_strobe <= bit_phase; -- High for one 20MHz cycle every 100ns
        end if;
    end process;

    process(clk_20m)
        variable crc_feedback : std_logic;
    begin
        if rising_edge(clk_20m) then
            if bit_enable_strobe = '1' then
                case state is
                    when IDLE_HEARTBEAT =>
                        -- Send a 100ns pulse every 16ms to keep the link alive
                        if heartbeat_cnt = 0 then
                            tx_raw_bit <= '1'; -- The NLP Pulse
                        else
                            tx_raw_bit <= '0';
                        end if;

                        if start_tx = '1' and heartbeat_cnt > 10 then
                            state <= PREAMBLE;
                            heartbeat_cnt <= 0;
                        elsif heartbeat_cnt = 160000 then
                            heartbeat_cnt <= 0;
                        else
                            heartbeat_cnt <= heartbeat_cnt + 1;
                        end if;

                        byte_count <= 0;
                        bit_index  <= 0;
                        crc_reg    <= (others => '1');

                    when PREAMBLE =>
                        if (bit_index mod 2) = 0 then tx_raw_bit <= '1';
                        else tx_raw_bit <= '0'; end if;

                        if bit_index = 7 then
                            bit_index <= 0;
                            if byte_count = 6 then state <= SFD;
                            else byte_count <= byte_count + 1; end if;
                        else bit_index <= bit_index + 1; end if;

                    when SFD =>
                        if bit_index = 7 or (bit_index mod 2 = 0) then tx_raw_bit <= '1';
                        else tx_raw_bit <= '0'; end if;
                        if bit_index = 7 then
                            bit_index <= 0; byte_count <= 0; state <= DATA;
                        else bit_index <= bit_index + 1; end if;

                    when DATA =>
                        if byte_count < 6 then
                            tx_raw_bit <= DEST_MAC((byte_count * 8) + bit_index);
                        elsif byte_count < 12 then
                            tx_raw_bit <= SRC_MAC(((byte_count - 6) * 8) + bit_index);
                        elsif byte_count < 14 then
                            tx_raw_bit <= ETYPE(((byte_count - 12) * 8) + bit_index);
                        else
                            tx_raw_bit <= PAYLOAD(((byte_count - 14) * 8) + bit_index);
                        end if;

                        crc_feedback := tx_raw_bit xor crc_reg(31);
                        if crc_feedback = '1' then
                            crc_reg <= (crc_reg(30 downto 0) & '0') xor x"04C11DB7";
                        else
                            crc_reg <= (crc_reg(30 downto 0) & '0');
                        end if;

                        if bit_index = 7 then
                            bit_index <= 0;
                            if byte_count = 59 then state <= SEND_CRC; crc_bit_cnt <= 0;
                            else byte_count <= byte_count + 1; end if;
                        else bit_index <= bit_index + 1; end if;

                    when SEND_CRC =>
                        tx_raw_bit <= not crc_reg(31);
                        crc_reg <= crc_reg(30 downto 0) & '0';
                        if crc_bit_cnt = 31 then
                            state <= IPG; byte_count <= 0;
                        else crc_bit_cnt <= crc_bit_cnt + 1; end if;

                    when IPG =>
                        tx_raw_bit <= '0';
                        if byte_count = 120 then -- ~12us gap
                            state <= IDLE_HEARTBEAT;
                        else byte_count <= byte_count + 1; end if;
                end case;
            end if;
        end if;
    end process;

    process(clk_20m)
    begin
        if rising_edge(clk_20m) then
            debug_raw_tx <= tx_raw_bit;
            if state = IDLE_HEARTBEAT then
                tx_out <= tx_raw_bit; -- Raw pulse for NLP
                tx_out2 <= tx_raw_bit;
            else
                if tx_raw_bit = '1' then
                    tx_out <= bit_phase; tx_out2 <= bit_phase;
                else
                    tx_out <= not bit_phase; tx_out2 <= not bit_phase;
                end if;
            end if;
        end if;
    end process;

end architecture;
