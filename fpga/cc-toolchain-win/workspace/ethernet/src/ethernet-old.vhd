library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity name requested by user
entity ethernet_old is
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
end entity ethernet_old;

architecture behavioral of ethernet_old is
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

    function update_crc32(current_crc : std_logic_vector(31 downto 0);
                          data_byte   : std_logic_vector(7 downto 0))
                          return std_logic_vector is
        variable crc : std_logic_vector(31 downto 0) := current_crc;
    begin
        -- Ethernet standard: Process LSB of the byte first
        for i in 0 to 7 loop
            if (crc(0) xor data_byte(i)) = '1' then
                crc := ("0" & crc(31 downto 1)) xor x"EDB88320";
            else
                crc := ("0" & crc(31 downto 1));
            end if;
        end loop;
        return crc;
    end function;

begin
    SYNCRONOUS_STATE_CHANGE : process(clk)
    begin
        if rising_edge(clk) then
            transmissionState <= nextState;
        end if;
    end process;

    TRANSMIT_NLP :process(clk)
    variable nlp_counter : integer := 0;
    variable nlp_pause_counter : integer := 0;
    variable post_nlp_pause : boolean := false;
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
                    post_nlp_pause := true;
                end if;
                if post_nlp_pause then
                    if nlp_pause_counter = NLPs_goal then
                        nlp_done <= true;
                        post_nlp_pause := false;
                        nlp_counter := 0;
                        nlp_pause_counter := 0;
                    else
                        nlp_pause_counter := nlp_pause_counter + 1;
                    end if;
                end if;

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

    TRANSMIT_SFD : process(clk)
        variable sfdBitIndex : integer := 7;
    begin
        if rising_edge(clk) then
            sfd_done <= false;

            -- LOOK-AHEAD: Prepare the bit as soon as the state machine
            -- points to SFD_s (even if we are technically still in PREAMBLE_s)
            if nextState = SFD_s or transmissionState = SFD_s then
                sfd_tx <= SFD_PATTERN(sfdBitIndex);

                -- EXECUTION: Only move the index if we are currently
                -- inside the SFD state
                if transmissionState = SFD_s then
                    if sfdBitIndex = 1 then
                        sfd_done <= true; -- Signal preload of next field bit
                    elsif sfdBitIndex = 0 then
                        sfdBitIndex := 7; -- Reset for next packet
                        sfd_done <= true;
                    else
                        sfdBitIndex := sfdBitIndex - 1;
                    end if;
                end if;
            else
                -- Reset index while in Preamble or other states
                sfdBitIndex := 7;
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
                    calculate_dst_fcs <= true;
                    dst_fcs_byte <= current_byte;
                    --running_fcs <= update_crc32(running_fcs, current_byte);
                    bitIndex := 0;
                    if byteIndex = 5 then
                        byteIndex := 0;
                        dst_mac_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    calculate_dst_fcs <= false;
                    bitIndex := bitIndex + 1;
                end if;
           elsif transmissionState = SRC_MAC_s then
                current_byte := SRC_MAC(47 - (byteIndex * 8) downto 40 - (byteIndex * 8));
                src_mac_tx <= current_byte(bitIndex);
                if bitIndex = 7 then
                    calculate_src_fcs <= true;
                    src_fcs_byte <= current_byte;
                    --running_fcs <= update_crc32(running_fcs, current_byte);
                    bitIndex := 0;
                    if byteIndex = 5 then
                        byteIndex := 0;
                        src_mac_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    calculate_src_fcs <= false;
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
    variable current_byte : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if rising_edge(clk) then
            type_done <= false;
            if transmissionState = ETHER_TYPE_s then
                current_byte := UPPER_LAYER_TYPE(15 - (byteindex * 8) downto 8 - (byteIndex * 8));
                type_tx <= current_byte(bitIndex);
                if bitIndex = 7 then
                    calculate_type_fcs <= true;
                    type_fcs_byte <= current_byte;
                    --running_fcs <= update_crc32(running_fcs, currentByte);
                    bitIndex := 0;
                    if byteIndex = 1 then
                        byteIndex := 0;
                        type_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    calculate_type_fcs <= false;
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
    variable current_byte : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if rising_edge(clk) then
            payload_done <= false;
            if transmissionState = PAYLOAD_s then
                current_byte := PAYLOAD(367 - (byteIndex * 8) downto 360 - (byteIndex * 8));
                payload_tx <= current_byte(bitIndex);
                if bitIndex = 7 then
                    data_fcs_byte <= current_byte;
                    calculate_data_fcs <= true;
                    --running_fcs <= update_crc32(running_fcs, currentByte);
                    bitIndex := 0;
                    if byteIndex = DATA_BYTES - 1 then
                        byteIndex := 0;
                        payload_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    calculate_data_fcs <= false;
                    bitIndex := bitIndex + 1;
                end if;
            else
                bitIndex := 0;
                byteIndex := 0;
                payload_tx <= '0';
            end if;
        end if;
    end process;

    TRANSMIT_FCS : process(clk)
        variable byteIndex : integer range 0 to 3 := 0;
        variable bitIndex  : integer range 0 to 7 := 0;
        variable current_byte : std_logic_vector(7 downto 0);
        variable final_fcs    : std_logic_vector(31 downto 0);
    begin
        if rising_edge(clk) then
            fcs_done <= false;

            if transmissionState = FCS_s then
                -- 1. Flip all bits (Final XOR 0xFFFFFFFF)
                final_fcs := not running_fcs;

                -- 2. Extract Byte (Big Endian Byte Order: 3, 2, 1, 0)
                current_byte := final_fcs(31 - (byteIndex * 8) downto 24 - (byteIndex * 8));

                -- 3. Send LSB of the byte first
                fcs_tx <= current_byte(bitIndex);

                if bitIndex = 7 then
                    bitIndex := 0;
                    if byteIndex = 3 then
                        byteIndex := 0;
                        fcs_done <= true;
                    else
                        byteIndex := byteIndex + 1;
                    end if;
                else
                    bitIndex := bitIndex + 1;
                end if;
            else
                byteIndex := 0;
                bitIndex  := 0;
            end if;
        end if;
    end process;

    CRC_GEN : process(clk)
        variable last_bit_sent : std_logic := '0';
    begin
        if rising_edge(clk) then
            -- 1. Reset Logic
            if transmissionState = PREAMBLE_s then
                running_fcs <= (others => '1');

            -- 2. Calculation Logic
            -- We trigger ONLY when bitIndex transitions from 7 back to 0
            -- This happens in all data-carrying states.
            else
                case transmissionState is
                    when DEST_MAC_s | SRC_MAC_s | ETHER_TYPE_s | PAYLOAD_s =>
                        -- We use the flags you already have to know when a byte is finished
                        if calculate_dst_fcs or calculate_src_fcs or
                           calculate_type_fcs or calculate_data_fcs then

                            -- CRITICAL: Use the byte signal associated with the flag
                            if calculate_dst_fcs then
                                running_fcs <= update_crc32(running_fcs, dst_fcs_byte);
                            elsif calculate_src_fcs then
                                running_fcs <= update_crc32(running_fcs, src_fcs_byte);
                            elsif calculate_type_fcs then
                                running_fcs <= update_crc32(running_fcs, type_fcs_byte);
                            elsif calculate_data_fcs then
                                running_fcs <= update_crc32(running_fcs, data_fcs_byte);
                            end if;
                        end if;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

    TRANSMIT_IDLE : process(clk)
    variable idleCounter : integer  := 0;
    constant INTERFRAME_GAP_CYCLE_CNT : integer := 96_000 - 1; --96;
    begin
        if rising_edge(clk) then
            idle_done <= false;

            -- Use transmissionState, NOT nextState
            if transmissionState = IDLE_s then
                if idleCounter = INTERFRAME_GAP_CYCLE_CNT - 1 then
                    idle_done <= true; -- Variable name is misleading. This signals to preload next byte first transmission bit
                    idleCounter := idleCounter + 1;
                elsif idleCounter >= INTERFRAME_GAP_CYCLE_CNT then
                    idleCounter := 0;
                    idle_done <= true;
                else
                    idleCounter := idleCounter + 1;
                end if;
            else
                idleCounter := 0; -- Reset counter when not in IDLE
            end if;
        end if;
    end process;

    STATE_CONTROL : process(transmissionState, nlp_done, idle_done, preamble_done, sfd_done, dst_mac_done, src_mac_done, type_done, payload_done, fcs_done)
    begin
        nextState <= transmissionState;
        case transmissionState is
            when IDLE_s =>
                if idle_done then
                    nextState <= SFD_s;
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
                    nextState <= IDLE_s;
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
                if payload_done then
                    nextState <= FCS_s;
                end if;
            when FCS_s =>
                if fcs_done then
                    nextState <= NLP_s;
                end if;
            when others =>
                nextState <= NLP_s;
            end case;
    end process;

    TX_CONTROL : process(
    clk
   -- nlp_tx_transmit, nlp_tx_en_transmit, transmissionState,
   -- preamble_tx, sfd_tx, dst_mac_tx, src_mac_tx, type_tx, payload_tx, fcs_tx
    )

    -- TODO consider adding clk to sensitivity list in case it doesn't work without it
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

    TRANSMIT_UART : process(clk)
        variable baud_count : integer range 0 to 1042 := 0;
        variable bit_idx    : integer range 0 to 7 := 0;
        variable byte_idx   : integer range 0 to 3 := 0;
        variable current_tx_byte : std_logic_vector(7 downto 0);
    begin
        if rising_edge(clk) then
            case uart_state is
                when UART_IDLE =>
                    uart_tx_line <= '1';
                    baud_count := 0;
                    -- Trigger UART when Ethernet finishes the FCS state
                    if fcs_done then
                        uart_state <= UART_START_BIT;
                        byte_idx := 0;
                    end if;

                when UART_START_BIT =>
                    uart_tx_line <= '0'; -- Start bit is always 0
                    if baud_count = 1041 then
                        baud_count := 0;
                        uart_state <= UART_DATA;
                        -- Pick the byte to send (MSB first)
                        current_tx_byte := (not running_fcs(31 - (byte_idx*8) downto 24 - (byte_idx*8)));
                    else
                        baud_count := baud_count + 1;
                    end if;

                when UART_DATA =>
                    uart_tx_line <= current_tx_byte(bit_idx);
                    if baud_count = 1041 then
                        baud_count := 0;
                        if bit_idx = 7 then
                            bit_idx := 0;
                            uart_state <= UART_STOP_BIT;
                        else
                            bit_idx := bit_idx + 1;
                        end if;
                    else
                        baud_count := baud_count + 1;
                    end if;

                when UART_STOP_BIT =>
                    uart_tx_line <= '1'; -- Stop bit is always 1
                    if baud_count = 1041 then
                        baud_count := 0;
                        if byte_idx = 3 then
                            uart_state <= UART_IDLE;
                        else
                            byte_idx := byte_idx + 1;
                            uart_state <= UART_START_BIT;
                        end if;
                    else
                        baud_count := baud_count + 1;
                    end if;
            end case;
        end if;

        uart_tx <= uart_tx_line;
    end process;
end architecture behavioral;
