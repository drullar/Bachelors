library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ethernet_tx is
  generic (
    FPGA_MAC_ADDRESS : std_logic_vector(47 downto 0) := x"00_12_34_56_78_90"
  );
  port (
    clk20        : in std_logic;
    Ethernet_TDp : out std_logic;
    Ethernet_TDm : out std_logic;

    -- Frame trigger / status
    -- tx_start: one-cycle pulse from the orchestrator.  tx_busy is held '1'
    -- for the full duration of a frame (PREAMBLE through EOF_ST).  The
    -- orchestrator must not assert tx_start while tx_busy='1'.
    tx_start : in std_logic;
    tx_busy  : out std_logic;

    -- Payload-only byte count for this frame, latched when tx_start='1'.
    -- Provided by the orchestrator as ps_fifo_size - 8 (strips DST_MAC + EtherType header).
    payload_len : in std_logic_vector(10 downto 0);

    -- FIFO streaming interface (A-side of uart_rx_fifo, clk20 domain).
    -- FIFO data layout: DST_MAC (6B) | EtherType (2B) | payload (N bytes)
    -- The rx engine reads bytes in sequence:
    --   DST_MAC state    -> FIFO bytes 0..5   (6 reads)
    --   ETHER_TYPE state -> FIFO bytes 6..7   (2 reads, after SRC_MAC which uses no FIFO)
    --   PAYLOAD state    -> FIFO bytes 8..N+7 (N reads)
    -- fifo_rd_en is pulsed at ShiftCount=12 giving 2-cycle margin before the
    -- byte is loaded into ShiftData at ShiftCount=15.
    fifo_rd_en : out std_logic;
    fifo_data  : in std_logic_vector(7 downto 0);
    fifo_empty : in std_logic
  );
end ethernet_tx;

architecture Behavioral of ethernet_tx is

  type tx_state_t is (
    IDLE,
    PREAMBLE, -- 7 bytes 0x55
    SFD, -- 1 byte  0xD5  (CRC initialised here)
    DST_MAC, -- 6 bytes destination MAC  (streamed from FIFO bytes 0..5)
    SRC_MAC, -- 6 bytes source MAC       (FPGA_MAC_ADDRESS generic, no FIFO)
    ETHER_TYPE, -- 2 bytes EtherType/Length (streamed from FIFO bytes 6..7)
    PAYLOAD, -- N bytes payload           (streamed from FIFO bytes 8..N+7)
    FCS, -- 4 bytes CRC-32 shifted out via CRCflush mechanism
    EOF_ST -- 1 dummy byte slot; SendingPacket cleared at ShiftCount=14
  );

  signal state             : tx_state_t                    := IDLE;
  signal byte_count        : unsigned(10 downto 0)         := (others => '0');
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

  -- Payload length latched at tx_start='1' so it is stable throughout the frame.
  signal payload_len_r : unsigned(10 downto 0) := (others => '0');

  -- Registered FIFO read-enable.
  -- Asserted at ShiftCount=12 for FIFO-consuming states.  With the CC_FIFO_40K
  -- having at most 2-cycle output latency, data is guaranteed stable by
  -- ShiftCount=14, when pkt_data is registered before ShiftData loads at
  -- ShiftCount=15.
  signal fifo_rd_en_r : std_logic := '0';

begin

  tx_busy    <= SendingPacket;
  fifo_rd_en <= fifo_rd_en_r;

  process (clk20)
    variable v_readram  : std_logic;
    variable v_CRCinput : std_logic;
    variable v_dataout  : std_logic;
    variable v_bc       : integer;
  begin
    if rising_edge(clk20) then
      v_bc := to_integer(byte_count);

      --  FIFO read enable 
      -- One-cycle pulse at ShiftCount=12 while in a state that streams from the
      -- FIFO.  ShiftCount runs 0..15 so this fires 3 cycles before the byte
      -- boundary (ShiftCount=15), giving the FIFO 2 cycles of output latency
      -- margin.
      if ShiftCount = 12 and SendingPacket = '1' and
        (state = DST_MAC or state = ETHER_TYPE or state = PAYLOAD) then
        fifo_rd_en_r <= '1';
      else
        fifo_rd_en_r <= '0';
      end if;

      --  Data mux 
      -- pkt_data is a *registered* signal.  ShiftData captures it at the byte
      -- boundary (ShiftCount=15 / v_readram='1'), meaning the value that
      -- matters is what was registered at ShiftCount=14.
      --
      -- IDLE must mirror PREAMBLE: the very first ShiftData load after
      -- tx_start is whatever pkt_data held at the last IDLE cycle.  Setting
      -- IDLE to 0x55 avoids a spurious 0x00 preamble byte and the resulting
      -- Manchester phase inversion.
      case state is

        when IDLE | PREAMBLE =>
          pkt_data <= x"55";

        when SFD =>
          pkt_data <= x"D5";

          -- DST_MAC, ETHER_TYPE, and PAYLOAD all read sequentially from the FIFO.
          -- fifo_rd_en_r fires at ShiftCount=12; fifo_data is stable at ShiftCount=14.
        when DST_MAC | ETHER_TYPE | PAYLOAD =>
          pkt_data <= fifo_data;

        when SRC_MAC =>
          case v_bc is
            when 0      => pkt_data      <= FPGA_MAC_ADDRESS(47 downto 40);
            when 1      => pkt_data      <= FPGA_MAC_ADDRESS(39 downto 32);
            when 2      => pkt_data      <= FPGA_MAC_ADDRESS(31 downto 24);
            when 3      => pkt_data      <= FPGA_MAC_ADDRESS(23 downto 16);
            when 4      => pkt_data      <= FPGA_MAC_ADDRESS(15 downto 8);
            when others => pkt_data <= FPGA_MAC_ADDRESS(7 downto 0);
          end case;

        when others =>
          pkt_data <= x"00";

      end case;

      -- v_readram: byte-boundary load strobe (ShiftCount=15).
      if ShiftCount = 15 then
        v_readram := '1';
      else
        v_readram := '0';
      end if;

      --  Frame envelope 
      -- tx_start is asserted by the orchestrator (clk20 domain) when a full
      -- frame is queued in uart_rx_fifo and ethernet_tx is idle (tx_busy='0').
      -- payload_len is latched here so it is stable for the entire frame.
      if tx_start = '1' and SendingPacket = '0' then
        SendingPacket <= '1';
        state         <= PREAMBLE;
        byte_count    <= (others => '0');
        payload_len_r <= unsigned(payload_len);
      elsif ShiftCount = 14 and state = EOF_ST then
        SendingPacket <= '0';
        state         <= IDLE;
        byte_count    <= (others => '0');
      end if;

      -- ShiftCount free-runs 0-15 during transmission; held at 15 in IDLE so
      -- that v_readram fires every cycle (does nothing while SendingPacket='0').
      if SendingPacket = '1' then
        ShiftCount <= ShiftCount + 1;
      else
        ShiftCount <= x"F";
      end if;

      --  State machine 
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
            -- payload_len_r was latched at tx_start; it is the payload-only count.
            if byte_count = payload_len_r - 1 then
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

      --  Shift register 
      if ShiftCount(0) = '1' then
        if v_readram = '1' then
          ShiftData <= pkt_data;
        else
          ShiftData <= '0' & ShiftData(7 downto 1);
        end if;
      end if;

      --  CRC-32 (poly 0x04C11DB7) 
      -- v_CRCinput is forced 0 during CRCflush so the register just shifts
      -- while CRC bits are clocked out to the wire as NOT(CRC[31]).
      if CRCflush = '1' then
        v_CRCinput := '0';
      else
        v_CRCinput := ShiftData(0) xor CRC(31);
      end if;

      if CRCflush = '1' then
        CRCflush <= SendingPacket;
      elsif v_readram = '1' and state = FCS and byte_count = 0 then
        CRCflush <= '1';
      end if;

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

      --  10Base-T Normal Link Pulse (~16 ms) 
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

      --  Manchester encoder 
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
