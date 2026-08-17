library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ethernet_tx is
  generic (
    FPGA_MAC_ADDRESS        : std_logic_vector(47 downto 0) := x"00_12_34_56_78_90";
    DESTINATION_MAC_ADDRESS : std_logic_vector(47 downto 0) := x"FF_FF_FF_FF_FF_FF";
    ETHER_TYPE_WORD         : std_logic_vector(15 downto 0) := x"0800";
    PAYLOAD_SIZE            : integer                       := 128
  );
  port (
    clk20        : in std_logic;
    Ethernet_TDp : out std_logic;
    Ethernet_TDm : out std_logic
  );
end ethernet_tx;

architecture Behavioral of ethernet_tx is

  -- Frame TX state machine
  -- Each state owns a contiguous set of bytes in the outgoing frame.
  -- Transitions happen on the byte boundary (ShiftCount = 15, v_readram = '1').
  type tx_state_t is (
    IDLE,
    PREAMBLE, -- 7 bytes 0x55
    SFD, -- 1 byte  0xD5  (CRC initialised here)
    DST_MAC, -- 6 bytes destination MAC
    SRC_MAC, -- 6 bytes source MAC
    ETHER_TYPE, -- 2 bytes EtherType/Length
    PAYLOAD, -- PAYLOAD_SIZE bytes (replace mux arm with your data source)
    FCS, -- 4 bytes CRC-32 shifted out via CRCflush mechanism
    EOF_ST -- 1 dummy byte slot; SendingPacket cleared mid-slot at ShiftCount=14
  );

  signal state             : tx_state_t                    := IDLE;
  signal byte_count        : unsigned(10 downto 0)         := (others => '0');
  signal counter           : unsigned(19 downto 0)         := (others => '0');
  signal StartSending      : std_logic                     := '0';
  signal pkt_data          : std_logic_vector(7 downto 0)  := (others => '0');
  signal ShiftCount        : unsigned(3 downto 0)          := x"F";
  signal SendingPacket     : std_logic                     := '0';
  signal ShiftData         : std_logic_vector(7 downto 0)  := (others => '0');
  signal CRC               : std_logic_vector(31 downto 0) := (others => '0');
  signal CRCflush          : std_logic                     := '0';
  signal CRCinit           : std_logic                     := '0';
  signal LinkPulseCount    : unsigned(17 downto 0)         := (others => '0');
  signal LinkPulse         : std_logic                     := '0';
  signal SendingPacketData : std_logic                     := '0';
  signal idlecount         : unsigned(2 downto 0)          := "111";
  signal qo                : std_logic                     := '1';
  signal qoe               : std_logic                     := '0';

begin

  process (clk20)
    variable v_readram  : std_logic;
    variable v_CRCinput : std_logic;
    variable v_dataout  : std_logic;
    variable v_bc       : integer;
  begin
    if rising_edge(clk20) then
      v_bc := to_integer(byte_count);

      -- Packet trigger (~50 ms with 20-bit counter at 20 MHz)
      counter <= counter + 1;
      if counter = x"FFFFF" then
        StartSending <= '1';
      else
        StartSending <= '0';
      end if;

      -- Data mux: presents the byte for the current state/byte_count.
      -- pkt_data must be valid on the same cycle as v_readram='1' so it is
      -- registered into ShiftData at the byte boundary.
      case state is
          -- IDLE must mirror PREAMBLE here.  In IDLE, ShiftCount is held at 15 so
          -- v_readram fires every cycle.  pkt_data is a registered signal, meaning
          -- the value loaded into ShiftData on the first v_readram after StartSending
          -- is whatever pkt_data was on the *previous* clock -- i.e. still computed
          -- from state=IDLE.  By giving IDLE the same output as PREAMBLE the first
          -- byte loaded into ShiftData is 0x55, not 0x00.
        when IDLE | PREAMBLE =>
          pkt_data <= x"55";

        when SFD =>
          pkt_data <= x"D5";

        when DST_MAC =>
          case v_bc is
            when 0      => pkt_data      <= DESTINATION_MAC_ADDRESS(47 downto 40);
            when 1      => pkt_data      <= DESTINATION_MAC_ADDRESS(39 downto 32);
            when 2      => pkt_data      <= DESTINATION_MAC_ADDRESS(31 downto 24);
            when 3      => pkt_data      <= DESTINATION_MAC_ADDRESS(23 downto 16);
            when 4      => pkt_data      <= DESTINATION_MAC_ADDRESS(15 downto 8);
            when others => pkt_data <= DESTINATION_MAC_ADDRESS(7 downto 0);
          end case;

        when SRC_MAC =>
          case v_bc is
            when 0      => pkt_data      <= FPGA_MAC_ADDRESS(47 downto 40);
            when 1      => pkt_data      <= FPGA_MAC_ADDRESS(39 downto 32);
            when 2      => pkt_data      <= FPGA_MAC_ADDRESS(31 downto 24);
            when 3      => pkt_data      <= FPGA_MAC_ADDRESS(23 downto 16);
            when 4      => pkt_data      <= FPGA_MAC_ADDRESS(15 downto 8);
            when others => pkt_data <= FPGA_MAC_ADDRESS(7 downto 0);
          end case;

        when ETHER_TYPE =>
          if v_bc = 0 then
            pkt_data <= ETHER_TYPE_WORD(15 downto 8);
          else
            pkt_data <= ETHER_TYPE_WORD(7 downto 0);
          end if;

        when PAYLOAD =>
          -- Sequential test pattern; replace with your actual payload source
          -- indexed by byte_count (e.g. a BRAM read-address).
          pkt_data <= std_logic_vector(byte_count(7 downto 0));

        when others =>
          pkt_data <= x"00";
      end case;

      -- v_readram pulses for one cycle at the byte boundary (ShiftCount = 15).
      -- This is the load strobe: ShiftData captures pkt_data, byte_count advances.
      if ShiftCount = 15 then
        v_readram := '1';
      else
        v_readram := '0';
      end if;

      -- SendingPacket / frame envelope control.
      if StartSending = '1' then
        SendingPacket <= '1';
        state         <= PREAMBLE;
        byte_count    <= (others => '0');
      elsif ShiftCount = 14 and state = EOF_ST then
        -- Matches original: SendingPacket cleared at ShiftCount=14 in the last
        -- dummy byte slot, identical to "ShiftCount=14 and addr=endOfPacket".
        SendingPacket <= '0';
        state         <= IDLE;
        byte_count    <= (others => '0');
      end if;

      -- ShiftCount: free-runs 0-15 during transmission, held at 15 in IDLE.
      if SendingPacket = '1' then
        ShiftCount <= ShiftCount + 1;
      else
        ShiftCount <= x"F";
      end if;

      -- State machine advancement: one state/byte_count step per byte boundary.
      if v_readram = '1' and SendingPacket = '1' then
        case state is

          when PREAMBLE =>
            if byte_count = 6 then
              state      <= SFD;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when SFD =>
            state      <= DST_MAC;
            byte_count <= (others => '0');

          when DST_MAC =>
            if byte_count = 5 then
              state      <= SRC_MAC;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when SRC_MAC =>
            if byte_count = 5 then
              state      <= ETHER_TYPE;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when ETHER_TYPE =>
            if byte_count = 1 then
              state      <= PAYLOAD;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when PAYLOAD =>
            if byte_count = to_unsigned(PAYLOAD_SIZE - 1, 11) then
              state      <= FCS;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when FCS =>
            if byte_count = 3 then
              state      <= EOF_ST;
              byte_count <= (others => '0');
            else
              byte_count <= byte_count + 1;
            end if;

          when others =>
            null;

        end case;
      end if;

      -- Shift register: loads pkt_data at byte boundary, shifts LSB out each bit period.
      -- ShiftCount(0) selects odd half-cycles (bit transitions in Manchester encoding).
      if ShiftCount(0) = '1' then
        if v_readram = '1' then
          ShiftData <= pkt_data;
        else
          ShiftData <= '0' & ShiftData(7 downto 1);
        end if;
      end if;

      -- CRC-32 (poly 0x04C11DB7) computation.
      -- v_CRCinput is forced to '0' during CRCflush so the register just shifts
      -- while the CRC bits are being clocked out to the wire.
      if CRCflush = '1' then
        v_CRCinput := '0';
      else
        v_CRCinput := ShiftData(0) xor CRC(31);
      end if;

      -- CRCflush: set at the first byte boundary of FCS (equivalent to original
      -- "addr = END_OF_DATA+1"). Stays high via SendingPacket until EOF_ST clears it.
      if CRCflush = '1' then
        CRCflush <= SendingPacket;
      elsif v_readram = '1' and state = FCS and byte_count = 0 then
        CRCflush <= '1';
      end if;

      -- CRCinit: asserted for the SFD byte slot so the CRC register is reset to
      -- all-1s on the first bit of DST_MAC, matching the original addr=7 trigger.
      if v_readram = '1' then
        if state = SFD then
          CRCinit <= '1';
        else
          CRCinit <= '0';
        end if;
      end if;

      if ShiftCount(0) = '1' then
        if CRCinit = '1' then
          CRC <= (others => '1');
        elsif v_CRCinput = '1' then
          CRC <= (CRC(30 downto 0) & '0') xor x"04C11DB7";
        else
          CRC <= CRC(30 downto 0) & '0';
        end if;
      end if;

      -- Normal Link Pulse (NLP) for 10Base-T link integrity (~16 ms period).
      if SendingPacket = '1' then
        LinkPulseCount <= (others => '0');
      else
        LinkPulseCount <= LinkPulseCount + 1;
      end if;

      if LinkPulseCount(17 downto 1) = "11111111111111111" then
        LinkPulse <= '1';
      else
        LinkPulse <= '0';
      end if;

      -- Manchester encoder.
      -- SendingPacketData is SendingPacket delayed one cycle so the last half-bit
      -- of the final byte is still driven before the line returns to idle.
      SendingPacketData <= SendingPacket;
      if SendingPacketData = '1' then
        idlecount <= "000";
      elsif idlecount /= "111" then
        idlecount <= idlecount + 1;
      end if;

      if CRCflush = '1' then
        v_dataout := not CRC(31);
      else
        v_dataout := ShiftData(0);
      end if;

      if SendingPacketData = '1' then
        qo <= not (v_dataout xor ShiftCount(0));
      else
        qo <= '1';
      end if;

      if (SendingPacketData = '1') or (LinkPulse = '1') or (idlecount < 6) then
        qoe <= '1';
      else
        qoe <= '0';
      end if;

      if qoe = '1' then
        Ethernet_TDp <= qo;
        Ethernet_TDm <= not qo;
      else
        Ethernet_TDp <= '0';
        Ethernet_TDm <= '0';
      end if;

    end if;
  end process;

end Behavioral;
