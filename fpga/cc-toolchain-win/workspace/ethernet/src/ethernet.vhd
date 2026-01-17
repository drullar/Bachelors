library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



-- Entity name requested by user
entity ethernet is
    port (
        -- System Clock Input (10MHz)
        clk      : in  STD_LOGIC;                               -- FPGA 10MHz Reference Clock
        reset    : in STD_LOGIC;
        clk_out        : out STD_LOGIC;
        tx             : out STD_LOGIC;
        tx_en          : out STD_LOGIC -- Enables the transmission of data via the SN75C1168N chip. '0' should be transmitted when the state is IDLE, in all other cases it should be '1';
    );

    -- Ethernet Specific Constants
    constant PREAMBLE_BYTES : integer := 7;
    constant PREAMBLE_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    constant SFD : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    constant DEST_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"ff_ff_ff_ff_ff_ff";
    constant SRC_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"10_82_86_18_ea_08";
    constant UPPER_LAYER_TYPE : STD_LOGIC_VECTOR(15 downto 0) := x"88b5"; -- or length if that is used instead
    signal PAYLOAD: STD_LOGIC_VECTOR(367 downto 0) := (others => '0'); -- Use minimal size of 46 bytes, i.e 367 bits
    signal FCS : STD_LOGIC_VECTOR(31 downto 0) := x"2934059A"; -- TODO calculate FCS in a separate process

    type TRANMISSION_STATE is (IDLE_s, NLP_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
    signal transmissionState : TRANMISSION_STATE := IDLE_s;
end entity ethernet;

architecture behavioral of ethernet is
    constant DATA : STD_LOGIC_VECTOR(15 downto 0) := "1101010101001000";
    signal data_out: STD_LOGIC;
    signal clk_5hz: STD_LOGIC;
    -- NLP const and variables
    constant NLP_TO_SEND : integer := 3;
    constant NLP_POS_LEN : integer := 100; -- 100ns NLP positive pulse length. Should last rougly a 1 CLK period
    constant NLP_INBETWEEN_INTERVAL : integer := 16_000_000; -- 16 000 000ns =  16ms between each pulse

    -- Signals for state machine logic
    signal nlp_done : boolean := false;
    signal nlp_tx_transmit : STD_LOGIC := '0';
    signal nlp_tx_en_transmit : STD_LOGIC := '1';

    signal idle_done : boolean := false;
    signal idle_tx_transmit : STD_LOGIC := '0';
    signal idle_tx_en_transmit : STD_LOGIC := '1'; -- TODO verify whether 0 or 1 has to be sent
begin

    TRANSMIT_NLP : process(clk, transmissionState)
    -- Interval between NLPs 16ms
    variable nlp_counter : integer := NLP_INBETWEEN_INTERVAL - 1;
    variable nlps_sent : integer := 0;
    begin
        if rising_edge(clk) then
            if transmissionState = NLP_s and nlps_sent < NLP_TO_SEND then
                if nlp_counter = NLP_INBETWEEN_INTERVAL - 1 then
                    -- transmit positive pulse
                    nlp_tx_transmit <= '1';
                    nlp_tx_en_transmit <= '1';
                    nlp_counter := nlp_counter - 1;
                    nlps_sent := nlps_sent + 1;
                else
                    nlp_tx_transmit <= '0';
                    nlp_tx_en_transmit <= '1';
                    nlp_counter := nlp_counter - 1;
                end if;
            elsif transmissionState = NLP_s then
                nlp_done <= true;
            else
                -- reset variables that keep track
                nlps_sent := 0;
                nlp_counter := 15_999_999;
                nlp_done <= false;
                nlp_tx_transmit <= '0';
                nlp_tx_en_transmit <= '1';
            end if;
        end if;
    end process;

    TRANSMIT_IDLE : process(clk)
    constant MAX_IDLE : integer := 10_000_000 / 2;
    variable idleCounter : integer  := 0;
    begin
        if rising_edge(clk) then
            if transmissionState = IDLE_S then
                idle_done <= true;
            else
                idle_done <= false;
            end if;
            --if transmissionState = IDLE_s and idleCounter < MAX_IDLE - 1 then
            --    idle_tx_transmit <= '0';
            --    idle_tx_en_transmit <= '1'; --TODO change if needed to 0
            --    idleCounter := idleCounter + 1;
            --elsif transmissionState = IDLE_s then
            --    idle_done <= true;
            --else
            --    -- keep variables reset
            --    idleCounter := 0;
            --    idle_tx_transmit <= '0';
            --    idle_tx_en_transmit <= '1';
            --end if;
        end if;
    end process;

    STATE_CONTROL : process(clk)
    begin
        case transmissionState is
            when IDLE_s =>
                if idle_done then
                    transmissionState <= NLP_s;
                    tx <= idle_tx_transmit;
                    tx_en <= idle_tx_en_transmit;
                end if;
            when NLP_s =>
                if nlp_done then
                    transmissionState <= IDLE_s; -- TODO change to Preamble_s instead
                    tx <= nlp_tx_transmit;
                    tx_en <= nlp_tx_en_transmit;
                end if;
            when others =>
                transmissionState <= IDLE_s;
                tx <= '0';
                tx_en <= '1';
            end case;
    end process;

    --process (clk, clk_5hz, reset)
    --variable dataIndex : integer range 0 to 15 := 15;
    --begin
    --    if rising_edge(clk_5hz) then
    --        if reset = '1' then
    --            dataIndex := 15;
    --            data_out <= '0';
    --        else
    --            data_out <= DATA(dataIndex);
    --            dataIndex := dataIndex - 1;
    --        end if;
    --    end if;
    --    --clk_out <= clk;
    --end process;
    --tx_raw <= data_out;
    --tx_encoded <= data_out xor (not clk_5hz);
    --clk_out <= clk_5hz;
    clk_out <= clk;
end architecture behavioral;
