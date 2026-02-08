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
        tx2            : out STD_LOGIC;
        tx_raw         : out STD_LOGIC;
        tx_en          : out STD_LOGIC; -- Enables the transmission of data via the SN75C1168N chip. '0' should be transmitted when the state is IDLE, in all other cases it should be '1';
        uart_tx        : out STD_LOGIC
    );

    -- Ethernet Specific Constants
    constant PREAMBLE_BYTES : integer := 7;
    constant UPPER_LAYER_TYPE : STD_LOGIC_VECTOR(15 downto 0) := x"88b5"; -- x"0000"; -- x"88b5"; -- or length if that is used instead
    --signal PAYLOAD: STD_LOGIC_VECTOR(367 downto 0) := (others => '0'); -- Use minimal size of 46 bytes, i.e 367 bits

    -- signal FCS : STD_LOGIC_VECTOR(31 downto 0) := x"2934059A"; -- TODO calculate FCS in a separate process
    type TRANSMISSION_STATE is (IDLE_s, NLP_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
end entity ethernet;

architecture behavioral of ethernet is
    constant DATA : STD_LOGIC_VECTOR(15 downto 0) := "1101010101001000";
    signal data_out: STD_LOGIC;
    signal tx_tmp : STD_LOGIC;
    signal tx_raw_tmp : STD_LOGIC;

    signal transmissionState : TRANSMISSION_STATE := IDLE_s;

    signal sfdBitCounter : integer := 7;
    signal idleCounter : integer := 0;

    signal crc_reg : std_logic_vector(31 downto 0) := (others => '1');
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

    procedure p_handleIdleStateLogic(
    signal counter : inout integer;
    signal o_tx : out std_logic;
    signal o_tx_raw : out std_logic;
    signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    constant COUNTER_GOAL : integer := 96 - 1;
    begin
        o_tx <= '0';
        o_tx_raw <= '0';
        counter <= counter + 1;
        if counter = COUNTER_GOAL then
            o_transmissionState <= PREAMBLE_s;
            counter <= 0;
        end if;
    end procedure;

    procedure p_handleSFDStateLogic(
        signal counter             : inout integer;
        signal o_tx                : out std_logic;
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
        constant SFD_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    begin
        -- 1. Use the counter to set the output
        o_tx <= SFD_PATTERN(counter);
        o_tx_raw <= SFD_PATTERN(counter);

        -- 2. Decide what to do NEXT cycle
        if counter = 0 then
            -- We just finished the last bit (bit 0)
            o_transmissionState <= DEST_MAC_s; -- Or your next state (DEST_MAC_s)
            counter <= 7;                 -- Reset for next time
            io_crc_reg <= (others => '1');
        else
            -- Still have bits left to send
            counter <= counter - 1;
        end if;
    end procedure;

    procedure p_handlePreambleStateLogic(
        signal bitCounter       : inout integer range 0 to 7;
        signal byteCounter      : inout integer range 0 to 6;
        signal o_tx             : out std_logic;
        signal o_tx_raw         : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    constant PREAMBLE_PATTERN : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    begin
        state_debug_signal <= '1';
        o_tx <= PREAMBLE_PATTERN(bitCounter);
        o_tx_raw <= PREAMBLE_PATTERN(bitCounter);

        if bitCounter = 0 then
            bitCounter <= 7;
            if byteCounter = 6 then
                o_transmissionState <= SFD_s;
                byteCounter <= 0;
            else
                byteCounter <= byteCounter + 1;
            end if;
        else
            bitCounter <= bitCounter - 1;
        end if;
    end procedure;

    procedure p_handleMacStatesLogic(
        constant macAddress : in std_logic_vector(47 downto 0);
        signal bitCounter : inout integer range 0 to 7; -- LSbit
        signal byteCounter : inout integer range 0 to 5; -- MSByte
        signal o_tx_raw    : out std_logic;
        signal o_transmissionState : inout TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
    variable currentByte : std_logic_vector(7 downto 0);
    variable bit_to_send : std_logic; -- Helper variable
    begin
        currentByte := macAddress(47 - (byteCounter * 8) downto 40 - (byteCounter * 8));
        bit_to_send := currentByte(bitCounter);
        o_tx_raw <= bit_to_send;
        io_crc_reg <= next_crc32(io_crc_reg, bit_to_send);
        if bitCounter = 0 then
            bitCounter <= 7;
            if byteCounter = 5 then
                byteCounter <= 0;
                if o_transmissionState = DEST_MAC_s then
                    o_transmissionState <= SRC_MAC_s;
                else
                    o_transmissionState <= ETHER_TYPE_s;
                end if;
            else
                byteCounter <= byteCounter + 1;
            end if;
        else
            bitCounter <= bitCounter - 1;
        end if;
    end procedure;

    procedure p_handleEtherType(
        signal byteCounter : inout integer range 0 to 1;
        signal bitCounter  : inout integer range 0 to 7;
        signal o_tx_raw    : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE;
        signal io_crc_reg          : inout std_logic_vector(31 downto 0)
    ) is
    constant ETHER_TYPE : STD_LOGIC_VECTOR(15 downto 0) := x"88b5";
    variable currentByte : std_logic_vector(7 downto 0);
    variable bitToSend : std_logic;
    begin
        currentByte := ETHER_TYPE(15 - (byteCounter * 8) downto 8 - (byteCounter * 8));
        bitToSend := currentByte(bitCounter);
        o_tx_raw <= bitToSend;
        io_crc_reg <= next_crc32(io_crc_reg, bitToSend);

        if bitCounter = 0 then
            bitCounter <= 7;
            if byteCounter = 1 then
                byteCounter <= 0;
                o_transmissionState <= PAYLOAD_S;
            else
                byteCounter <= byteCounter + 1;
            end if;
        else
            bitCounter <= bitCounter - 1;
        end if;
    end procedure;

    -- 16ms / 100ns = 160,000 cycles
    constant NLP_INTERVAL : integer := 160000;
    signal nlpCounter     : integer range 0 to NLP_INTERVAL := 0;

    procedure p_handleNLPStateLogic(
        signal counter             : inout integer range 0 to NLP_INTERVAL;
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    begin
        -- 1. Pulse logic: High only on the first cycle
        if counter = 0 then
            o_tx_raw <= '1';
        else
            o_tx_raw <= '0';
        end if;

        -- 2. Timing logic
        if counter = NLP_INTERVAL then
            counter <= 0;
            -- After the pulse and wait period, decide where to go.
            -- Usually, you go back to IDLE to wait for a packet,
            -- or directly to PREAMBLE if a transmission is queued.
            o_transmissionState <= IDLE_s;
        else
            counter <= counter + 1;
        end if;
    end procedure;

signal bitCounter : integer range 0 to 7 := 7;
signal preambleByteCounter : integer range 0 to 6 := 0;
signal macByteCounter : integer range 0 to 5 := 0;
signal etherTypeByteCounter : integer range 0 to 1 := 0;

constant PAYLOAD_BYTES : integer := 46;
signal PAYLOAD : STD_LOGIC_VECTOR((PAYLOAD_BYTES * 8) - 1 downto 0) := (others => '0');
signal payloadByteCounter : integer range 0 to PAYLOAD_BYTES - 1 := 0;

procedure p_handlePayloadStateLogic(
    constant c_payloadBytes : in integer;
    signal i_payload : in std_logic_vector((46 * 8) - 1 downto 0);
    signal io_bitCounter : inout integer range 0 to 7;
    signal io_byteCounter : inout integer range 0 to 45;
    signal o_tx : out std_logic;
    signal io_transmissionState : inout TRANSMISSION_STATE;
    signal io_crc_reg          : inout std_logic_vector(31 downto 0)
) is
variable currentByte : std_logic_vector(7 downto 0);
variable bitToSend : std_logic;
begin
    currentByte := i_payload(((c_payloadBytes * 8) - 1) - (8 * io_byteCounter )  downto((c_payloadBytes * 8) - 8) - (io_byteCounter * 8));
    bitToSend := currentByte(io_bitCounter);
    o_tx <= bitToSend;
    io_crc_reg <= next_crc32(io_crc_reg, bitToSend);
    if io_bitCounter = 0 then
        io_bitCounter <= 7;
        if io_byteCounter = c_payloadBytes - 1 then
            io_byteCounter <= 0;
            io_transmissionState <= FCS_s;
        else
            io_byteCounter <= io_byteCounter + 1;
        end if;
    else
        io_bitCounter <= io_bitCounter - 1;
    end if;
end procedure;

signal fcsBitCounter : integer range 0 to 31 := 31;
procedure p_handleFCSStateLogic(
        signal counter             : inout integer range 0 to 31;
        constant final_crc         : in std_logic_vector(31 downto 0);
        signal o_tx_raw            : out std_logic;
        signal o_transmissionState : out TRANSMISSION_STATE
    ) is
    begin
        -- Ethernet FCS is the 1's complement of the calculated CRC.
        -- We send bit 31 down to 0.
        o_tx_raw <= not final_crc(counter);

        if counter = 0 then
            o_transmissionState <= NLP_s; -- Packet Transmission Complete
            counter <= 31;                 -- Reset for next packet
        else
            counter <= counter - 1;
        end if;
    end procedure;

begin
process(clk)
constant DEST_MAC : STD_LOGIC_VECTOR(47 downto 0) :=  x"ff_ff_ff_ff_ff_ff";
constant SRC_MAC : STD_LOGIC_VECTOR(47 downto 0) := x"10_82_86_18_ea_08"; -- x"00_00_00_00_00_00"; --
begin
    if rising_edge(clk) then
        case transmissionState is
            when NLP_s =>
                p_handleNLPStateLogic(nlpCounter, tx_raw_tmp, transmissionState);
            when IDLE_s =>
                p_handleIdleStateLogic(idleCounter, tx_tmp, tx_raw_tmp, transmissionState);
            when PREAMBLE_S =>
                p_handlePreambleStateLogic(bitCounter, preambleByteCounter, tx_tmp, tx_raw_tmp, transmissionState);
            when SFD_S =>
                p_handleSFDStateLogic(sfdBitCounter, tx_tmp, tx_raw_tmp, transmissionState,crc_reg);
            when DEST_MAC_s =>
                p_handleMacStatesLogic(DEST_MAC,bitCounter,macByteCounter,tx_raw_tmp, transmissionState, crc_reg);
            when SRC_MAC_s =>
                p_handleMacStatesLogic(SRC_MAC,bitCounter,macByteCounter,tx_raw_tmp, transmissionState, crc_reg);
            when ETHER_TYPE_s =>
                p_handleEtherType(etherTypeByteCounter,bitCounter,tx_raw_tmp, transmissionState, crc_reg);
            when PAYLOAD_s =>
                p_handlePayloadStateLogic(PAYLOAD_BYTES, PAYLOAD,bitCounter, payloadByteCounter, tx_raw_tmp, transmissionState, crc_reg);
            when FCS_s =>
                p_handleFCSStateLogic(fcsBitCounter, crc_reg, tx_raw_tmp, transmissionState);
            when others =>
                tx_tmp <= '0';
                tx_raw_tmp <= '0';
                transmissionState <= IDLE_s;
            end case;
    end if;
-- Logic for tx_en as requested: '0' in IDLE, '1' otherwise
    if transmissionState = IDLE_s then
        tx  <= '0'; -- Force tx to 0 (or '1' depending on your physical layer idle spec)
    elsif transmissionState = NLP_s then
        tx    <= tx_raw_tmp; -- NLP is a raw pulse, usually NOT Manchester encoded
    else
        tx <= tx_raw_tmp xor (not clk); -- Perform Manchester encoding
    end if;
    tx_raw <= tx_raw_tmp;
end process;

end architecture behavioral;
