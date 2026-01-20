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
    constant SFD_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    constant DEST_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"ff_ff_ff_ff_ff_ff";
    constant SRC_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"10_82_86_18_ea_08";
    constant UPPER_LAYER_TYPE : STD_LOGIC_VECTOR(15 downto 0) := x"88b5"; -- or length if that is used instead
    signal PAYLOAD: STD_LOGIC_VECTOR(367 downto 0) := (others => '0'); -- Use minimal size of 46 bytes, i.e 367 bits

    signal FCS : STD_LOGIC_VECTOR(31 downto 0) := x"2934059A"; -- TODO calculate FCS in a separate process

    type TRANMISSION_STATE is (IDLE_s, NLP_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
    signal nextState : TRANMISSION_STATE := PREAMBLE_s; -- Can be changed Async
    signal transmissionState : TRANMISSION_STATE := nextState; -- Can be changed Sync only

end entity ethernet;

architecture behavioral of ethernet is
    constant DATA : STD_LOGIC_VECTOR(15 downto 0) := "1101010101001000";
    signal data_out: STD_LOGIC;
    signal clk_5hz: STD_LOGIC;
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
    signal preamble_tx : STD_LOGIC := '0';

    signal sfd_done : boolean := false;
    signal sfd_tx : STD_LOGIC := '0';

    signal dst_mac_done : boolean := false;
    signal dst_mac_tx : STD_LOGIC := '0';

    signal src_mac_done : boolean := false;
    signal src_mac_tx : STD_LOGIC := '0';

    signal type_done : boolean := false;
    signal type_tx : STD_LOGIC := '0';

    signal payload_done : boolean := false;
    signal payload_tx : STD_LOGIc := '0';

    signal process_clk : STD_LOGIC := clk; -- Using separate signal definition in order to easily change it with slower clock when needed for testing
begin
    process_clk  <= clk;

    SYNCRONOUS_STATE_CHANGE : process(clk)
    begin
        if rising_edge(clk) then
            transmissionState <= nextState;
        end if;
    end process;

    TRANSMIT_NLP :process(clk)
    variable nlp_counter : integer := 0;
    constant NLPs_goal : integer := 8;
    begin
        if rising_edge(clk) then
            if transmissionState = NLP_s then
                nlp_done <= false;
                if nlp_idle_counter = NLP_INBETWEEN_INTERVAL - 1 then
                    nlp_idle_counter <= (others => '0');
                    nlp_tx_transmit <= '1';
                    nlp_counter := nlp_counter + 1;
                else
                    nlp_idle_counter <= nlp_idle_counter + 1;
                    nlp_tx_transmit <= '0';
                end if;
                if nlp_counter = NLPs_goal then
                    nlp_done <= true;
                    nlp_counter := 0;
                end if;
            end if;
        end if;
    end process;

    TRANSMIT_PREAMBLE : process(clk)
        variable preambleBitIndex     : integer := 7;
        variable currentPreambleByte  : integer := 1;
    begin
        if rising_edge(clk) then
            -- default: done is a one-cycle pulse
            preamble_done <= false;

            if transmissionState = PREAMBLE_s then
                -- drive current bit
                preamble_tx <= PREAMBLE_PATTERN(preambleBitIndex);

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

    TRANSMIT_SFD : process(clk)
    variable sfdBitIndex     : integer := 7;
    begin
    if rising_edge(clk) then
        sfd_done <= false;
        if transmissionState = SFD_s then
            sfd_tx <= SFD_PATTERN(sfdBitIndex);
            if sfdBitIndex = 0 then
                sfdBitIndex := 7;
                sfd_done <= true;
            else
                sfdBitIndex := sfdBitIndex - 1;
            end if;
        end if;
    end if;
    end process;

    TRANSMIT_MAC : process(clk)
    variable byteIndex : integer := 0; -- MSByte
    variable bitIndex : integer := 0; -- start from LSB. Indexing current byte bits
    variable current_byte : std_logic_vector(7 downto 0);
    begin
        if rising_edge(clk) then
            src_mac_done <= false;
            dst_mac_done <= false;
            if transmissionState = DEST_MAC_s then
                current_byte := DEST_MAC(47 - (byteIndex * 8) downto 40 - (byteIndex * 8));
                dst_mac_tx <= current_byte(bitIndex);
                if bitIndex = 7 then
                    bitIndex := 0;
                    if byteIndex = 5 then
                        byteIndex := 0;
                        dst_mac_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    bitIndex := bitIndex + 1;
                end if;
           elsif transmissionState = SRC_MAC_s then
                current_byte := SRC_MAC(47 - (byteIndex * 8) downto 40 - (byteIndex * 8));
                src_mac_tx <= current_byte(bitIndex);
                if bitIndex = 7 then
                    bitIndex := 0;
                    if byteIndex = 5 then
                        byteIndex := 0;
                        src_mac_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    bitIndex := bitIndex + 1;
                end if;
            else
                -- reset state holders
                bitIndex := 0;
                byteIndex := 0;
                dst_mac_tx <= '0';
                src_mac_tx <= '0';
            end if;
        end if;
    end process;

    TRANSMIT_ETHER_TYPE : process(clk)
    variable bitIndex : integer := 0; -- LSB first
    variable byteIndex : integer := 0; -- MSB first
    variable currentByte : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if rising_edge(clk) then
            type_done <= false;
            if transmissionState = ETHER_TYPE_s then
                currentByte := UPPER_LAYER_TYPE(15 - (byteindex * 8) downto 8 - (byteIndex * 8));
                type_tx <= currentByte(bitIndex);
                if bitIndex = 7 then
                    bitIndex := 0;
                    if byteIndex = 1 then
                        byteIndex := 0;
                        type_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    bitIndex := bitIndex + 1;
                end if;
            else
                byteIndex := 0;
                bitIndex := 0;
                type_tx <= '0';
            end if;
        end if;
    end process;

    TRANSMIT_DATA : process(clk)
    variable byteIndex : integer := 0;
    variable bitIndex : integer := 0;
    constant DATA_BYTES : integer := 46;
    variable currentByte : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if rising_edge(clk) then
            payload_done <= false;
            if transmissionState = PAYLOAD_s then
                currentByte := PAYLOAD(367 - (byteIndex * 8) downto 360 - (byteIndex * 8));
                payload_tx <= currentByte(bitIndex);
                if bitIndex = 7 then
                    bitIndex := 0;
                    if byteIndex = DATA_BYTES - 1 then
                        byteIndex := 0;
                        payload_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    bitIndex := bitIndex + 1;
                end if;
            else
                bitIndex := 0;
                byteIndex := 0;
                payload_tx <= '0';
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
        end if;
    end process;

    STATE_CONTROL : process(transmissionState, nlp_done, idle_done, preamble_done, sfd_done, dst_mac_done, src_mac_done, type_done, payload_done)
    begin
        nextState <= transmissionState;
        case transmissionState is
            when IDLE_s =>
                if idle_done then
                    nextState <= NLP_s;
                end if;
            when NLP_s =>
                if nlp_done then
                    nextState <= PREAMBLE_s; -- TODO change to Preamble_s instead
                end if;
            when PREAMBLE_s =>
                if preamble_done then
                    nextState <= SFD_s;
                end if;
            when SFD_s =>
                if sfd_done then
                    nextState <= DEST_MAC_s;
                end if;
            when DEST_MAC_s =>
                if dst_mac_done then
                    nextState <= SRC_MAC_s;
                end if;
            when SRC_MAC_s =>
                if src_mac_done then
                    nextState <= ETHER_TYPE_s;
                end if;
            when ETHER_TYPE_s =>
                if type_done then
                    nextState <= PAYLOAD_s;
                end if;
            when PAYLOAD_s =>
                if payload_done  then
                    nextState <= NLP_s;
                end if;
            when others =>
                nextState <= NLP_s;
            end case;
    end process;

    TX_CONTROL : process(nlp_tx_transmit, nlp_tx_en_transmit, transmissionState, preamble_tx, sfd_tx, dst_mac_tx, src_mac_tx, type_tx, payload_tx)
    begin
        case transmissionState is
        when NLP_s =>
            --if nlp_idle_counter = 0 then
            tx <= nlp_tx_transmit;
            tx_en   <= nlp_tx_en_transmit;
        when PREAMBLE_s =>
            tx <= preamble_tx xor (not clk);
            tx_en <= '1';
        when SFD_s =>
            tx <= sfd_tx xor (not clk);
            tx_en <= '1';
        when DEST_MAC_s =>
            tx <= dst_mac_tx xor (not clk);
            tx_en <= '1';
        when SRC_MAC_s =>
            tx <= src_mac_tx xor (not clk);
            tx_en <= '1';
        when ETHER_TYPE_s =>
            tx <= type_tx xor (not clk);
            tx_en <= '1';
        when PAYLOAD_s =>
            tx <= payload_tx xor (not clk);
            tx_en <= '1';
        when others =>
            tx <= '0';
            tx_en <= '1';
        end case;
        clk_out <= clk;
    end process;
end architecture behavioral;
