library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ethernet is
    port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        clk_out : out STD_LOGIC;
        tx      : out STD_LOGIC;
        tx2     : out STD_LOGIC;
        tx_raw  : out STD_LOGIC;
        tx_en   : out STD_LOGIC;
        uart_tx : out STD_LOGIC
    );
end entity ethernet;

architecture behavioral of ethernet is

    -- ========================================================================
    -- 1. GLOBAL CONSTANTS & SIGNALS
    -- ========================================================================

    constant PREAMBLE_BYTES : integer := 7;
    constant SFD_PATTERN    : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    constant DEST_MAC       : STD_LOGIC_VECTOR(47 downto 0) := x"ff_ff_ff_ff_ff_ff";
    constant SRC_MAC        : STD_LOGIC_VECTOR(47 downto 0) := x"10_82_86_18_ea_08";
    constant ETHER_TYPE     : STD_LOGIC_VECTOR(15 downto 0) := x"88b5";

    constant PAYLOAD_BYTES  : integer := 46;
    signal PAYLOAD          : STD_LOGIC_VECTOR((PAYLOAD_BYTES * 8) - 1 downto 0) := (others => '0');

    constant NLP_INTERVAL   : integer := 160000; -- 16ms / 100ns

    type TRANSMISSION_STATE is (IDLE_s, NLP_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
    signal transmissionState : TRANSMISSION_STATE := IDLE_s;

    -- Global Counters
    signal sfdBitCounter        : integer range 0 to 7 := 7;
    signal idleCounter          : integer := 0;
    signal nlpCounter           : integer range 0 to NLP_INTERVAL := 0;

    signal bitCounter           : integer range 0 to 7 := 7;
    signal preambleByteCounter  : integer range 0 to 6 := 0;
    signal macByteCounter       : integer range 0 to 5 := 0;
    signal etherTypeByteCounter : integer range 0 to 1 := 0;
    signal payloadByteCounter   : integer range 0 to PAYLOAD_BYTES - 1 := 0;
    signal fcsBitCounter        : integer range 0 to 31 := 31;

    -- Outputs & Intermediates
    signal tx_tmp     : STD_LOGIC := '0';
    signal tx_raw_tmp : STD_LOGIC := '0';
    signal crc_reg    : std_logic_vector(31 downto 0) := (others => '1');

    -- ========================================================================
    -- 2. HELPER FUNCTIONS
    -- ========================================================================
    function next_crc32(
            current_crc : std_logic_vector(31 downto 0);
            data_bit    : std_logic
    ) return std_logic_vector is
        variable new_crc : std_logic_vector(31 downto 0);
        variable feedback : std_logic;
    begin
        feedback := current_crc(31) xor data_bit;
        new_crc(31 downto 1) := current_crc(30 downto 0);
        new_crc(0) := '0';
        if feedback = '1' then
            new_crc := new_crc xor x"04C11DB7";
        end if;
        return new_crc;
    end function;

    -- ========================================================================
    -- 3. STATE PROCEDURES
    -- ========================================================================

    procedure p_handleIdleStateLogic(
        signal io_counter : inout integer;
        signal next_state_bit_counter : out integer range 0 to 7;
        signal o_tx : out std_logic;
        signal o_tx_raw : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
        constant COUNTER_GOAL : integer := 96 - 1;
    begin
        o_tx <= '0';
        if io_counter /= COUNTER_GOAL then
            o_tx_raw <= '0';
        end if;

        io_counter <= io_counter + 1;

        if io_counter = COUNTER_GOAL then
            o_transmissionState <= PREAMBLE_s;
            io_counter <= 0;
            o_tx_raw <= '1';
            next_state_bit_counter <= 6;
        end if;
    end procedure;

    procedure p_handlePreambleStateLogic(
        signal io_bitCounter    : inout integer range 0 to 7;
        signal io_byteCounter   : inout integer range 0 to 6;
        signal next_sfd_counter : out integer range 0 to 7;
        signal o_tx             : out std_logic;
        signal o_tx_raw         : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
        constant PREAMBLE_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    begin
        o_tx <= PREAMBLE_PATTERN(io_bitCounter);
        o_tx_raw <= PREAMBLE_PATTERN(io_bitCounter);

        if io_bitCounter = 0 then
            io_bitCounter <= 7;
            if io_byteCounter = 6 then
                o_transmissionState <= SFD_s;
                io_byteCounter <= 0;
                o_tx_raw <= '1';
                next_sfd_counter <= 6;
            else
                io_byteCounter <= io_byteCounter + 1;
            end if;
        else
            io_bitCounter <= io_bitCounter - 1;
        end if;
    end procedure;

    -- FIXED PROCEDURE SIGNATURE BELOW
    procedure p_handleSFDStateLogic(
        signal io_counter             : inout integer range 0 to 7; -- Changed to match sfdBitCounter
        signal next_mac_bit_counter   : out integer range 0 to 7;
        signal o_tx                   : out std_logic;
        signal o_tx_raw               : out std_logic;
        signal o_transmissionState    : out TRANSMISSION_STATE;
        signal io_crc_reg             : inout std_logic_vector(31 downto 0)
    ) is
    begin
        o_tx <= SFD_PATTERN(io_counter);
        o_tx_raw <= SFD_PATTERN(io_counter);

        if io_counter = 0 then
            o_transmissionState <= DEST_MAC_s;
            io_counter <= 7;
            io_crc_reg <= (others => '1');

            o_tx_raw <= DEST_MAC(47);
            next_mac_bit_counter <= 6;
        else
            io_counter <= io_counter - 1;
        end if;
    end procedure;

    procedure p_handleMacStatesLogic(
        constant macAddress        : in std_logic_vector(47 downto 0);
        signal io_bitCounter       : inout integer range 0 to 7;
        signal io_byteCounter      : inout integer range 0 to 5;
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : inout TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
        variable currentByte : std_logic_vector(7 downto 0);
        variable bit_to_send : std_logic;
    begin
        currentByte := macAddress(47 - (io_byteCounter * 8) downto 40 - (io_byteCounter * 8));
        bit_to_send := currentByte(io_bitCounter);

        o_tx_raw <= bit_to_send;
        io_crc_reg <= next_crc32(io_crc_reg, bit_to_send);

        if io_bitCounter = 0 then
            if io_byteCounter = 5 then
                io_byteCounter <= 0;

                if o_transmissionState = DEST_MAC_s then
                    o_transmissionState <= SRC_MAC_s;
                    o_tx_raw <= SRC_MAC(47);
                    io_bitCounter <= 6;
                else
                    o_transmissionState <= ETHER_TYPE_s;
                    o_tx_raw <= ETHER_TYPE(15);
                    io_bitCounter <= 6;
                end if;
            else
                io_byteCounter <= io_byteCounter + 1;
                io_bitCounter <= 7;
            end if;
        else
            io_bitCounter <= io_bitCounter - 1;
        end if;
    end procedure;

    procedure p_handleEtherType(
        signal io_byteCounter : inout integer range 0 to 1;
        signal io_bitCounter  : inout integer range 0 to 7;
        signal o_tx_raw    : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
        variable currentByte : std_logic_vector(7 downto 0);
        variable bitToSend : std_logic;
    begin
        currentByte := ETHER_TYPE(15 - (io_byteCounter * 8) downto 8 - (io_byteCounter * 8));
        bitToSend := currentByte(io_bitCounter);

        o_tx_raw <= bitToSend;
        io_crc_reg <= next_crc32(io_crc_reg, bitToSend);

        if io_bitCounter = 0 then
            if io_byteCounter = 1 then
                io_byteCounter <= 0;
                o_transmissionState <= PAYLOAD_S;
                o_tx_raw <= PAYLOAD(PAYLOAD'high);
                io_bitCounter <= 6;
            else
                io_byteCounter <= io_byteCounter + 1;
                io_bitCounter <= 7;
            end if;
        else
            io_bitCounter <= io_bitCounter - 1;
        end if;
    end procedure;

    procedure p_handlePayloadStateLogic(
        constant c_payloadBytes : in integer;
        signal i_payload : in std_logic_vector;
        signal io_bitCounter : inout integer range 0 to 7;
        signal io_byteCounter : inout integer range 0 to 45;
        signal next_fcs_counter : out integer range 0 to 31;
        signal o_tx : out std_logic;
        signal io_transmissionState : inout TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
        variable currentByte : std_logic_vector(7 downto 0);
        variable bitToSend : std_logic;
        variable v_next_crc : std_logic_vector(31 downto 0);
    begin
        currentByte := i_payload(((c_payloadBytes * 8) - 1) - (8 * io_byteCounter )  downto((c_payloadBytes * 8) - 8) - (io_byteCounter * 8));
        bitToSend := currentByte(io_bitCounter);

        v_next_crc := next_crc32(io_crc_reg, bitToSend);

        o_tx <= bitToSend;
        io_crc_reg <= v_next_crc;

        if io_bitCounter = 0 then
            if io_byteCounter = c_payloadBytes - 1 then
                io_byteCounter <= 0;
                io_transmissionState <= FCS_s;
                o_tx <= not v_next_crc(31);
                next_fcs_counter <= 30;
                io_bitCounter <= 7;
            else
                io_byteCounter <= io_byteCounter + 1;
                io_bitCounter <= 7;
            end if;
        else
            io_bitCounter <= io_bitCounter - 1;
        end if;
    end procedure;

    procedure p_handleFCSStateLogic(
        signal io_counter          : inout integer range 0 to 31;
        constant final_crc         : in std_logic_vector(31 downto 0);
        signal next_nlp_counter    : out integer range 0 to NLP_INTERVAL;
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    begin
        o_tx_raw <= not final_crc(io_counter);

        if io_counter = 0 then
            o_transmissionState <= NLP_s;
            io_counter <= 31;

            o_tx_raw <= '1';
            next_nlp_counter <= 1;
        else
            io_counter <= io_counter - 1;
        end if;
    end procedure;

    procedure p_handleNLPStateLogic(
        signal io_counter          : inout integer range 0 to NLP_INTERVAL;
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    begin
        if io_counter = 0 then
            o_tx_raw <= '1';
        else
            o_tx_raw <= '0';
        end if;

        if io_counter = NLP_INTERVAL then
            io_counter <= 0;
            o_transmissionState <= IDLE_s;
            o_tx_raw <= '0';
        else
            io_counter <= io_counter + 1;
        end if;
    end procedure;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                transmissionState <= IDLE_s;
                tx_raw_tmp <= '0';
                tx_tmp <= '0';
                crc_reg <= (others => '1');
                PAYLOAD <= (others => '0');

                idleCounter <= 0;
                nlpCounter <= 0;
                bitCounter <= 7;
                preambleByteCounter <= 0;
                sfdBitCounter <= 7;
                macByteCounter <= 0;
                etherTypeByteCounter <= 0;
                payloadByteCounter <= 0;
                fcsBitCounter <= 31;
            else
                case transmissionState is
                    when NLP_s =>
                        p_handleNLPStateLogic(nlpCounter, tx_raw_tmp, transmissionState);

                    when IDLE_s =>
                        p_handleIdleStateLogic(idleCounter, bitCounter, tx_tmp, tx_raw_tmp, transmissionState);

                    when PREAMBLE_S =>
                        p_handlePreambleStateLogic(bitCounter, preambleByteCounter, sfdBitCounter, tx_tmp, tx_raw_tmp, transmissionState);

                    when SFD_S =>
                        p_handleSFDStateLogic(sfdBitCounter, bitCounter, tx_tmp, tx_raw_tmp, transmissionState, crc_reg);

                    when DEST_MAC_s =>
                        p_handleMacStatesLogic(DEST_MAC, bitCounter, macByteCounter, tx_raw_tmp, transmissionState, crc_reg);

                    when SRC_MAC_s =>
                        p_handleMacStatesLogic(SRC_MAC, bitCounter, macByteCounter, tx_raw_tmp, transmissionState, crc_reg);

                    when ETHER_TYPE_s =>
                        p_handleEtherType(etherTypeByteCounter, bitCounter, tx_raw_tmp, transmissionState, crc_reg);

                    when PAYLOAD_s =>
                        p_handlePayloadStateLogic(PAYLOAD_BYTES, PAYLOAD, bitCounter, payloadByteCounter, fcsBitCounter, tx_raw_tmp, transmissionState, crc_reg);

                    when FCS_s =>
                        p_handleFCSStateLogic(fcsBitCounter, crc_reg, nlpCounter, tx_raw_tmp, transmissionState);

                    when others =>
                        tx_tmp <= '0';
                        tx_raw_tmp <= '0';
                        transmissionState <= IDLE_s;
                end case;
            end if;
        end if;
    end process;

    tx_en <= '0' when transmissionState = IDLE_s else '1';

    process(transmissionState, tx_raw_tmp, clk)
    begin
        if transmissionState = IDLE_s then
            tx <= '0';
        elsif transmissionState = NLP_s then
            tx <= tx_raw_tmp;
        else
            tx <= tx_raw_tmp xor (not clk);
        end if;
    end process;

    tx_raw  <= tx_raw_tmp;
    uart_tx <= '1';
    clk_out <= clk;
    tx2     <= '0';

end architecture behavioral;
