library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ethernet_tx is
  generic (
    -- IP source: 192.168.21.12
    IPsource_1 : integer := 192;
    IPsource_2 : integer := 168;
    IPsource_3 : integer := 21;
    IPsource_4 : integer := 12;
    -- IP destination: 192.168.21.11
    IPdestination_1 : integer := 192;
    IPdestination_2 : integer := 168;
    IPdestination_3 : integer := 21;
    IPdestination_4 : integer := 11;
    -- Physical Address (Dest MAC): 54:E1:AD:1B:10:0D
    PhysicalAddress_1 : std_logic_vector(7 downto 0) := x"54";
    PhysicalAddress_2 : std_logic_vector(7 downto 0) := x"E1";
    PhysicalAddress_3 : std_logic_vector(7 downto 0) := x"AD";
    PhysicalAddress_4 : std_logic_vector(7 downto 0) := x"1B";
    PhysicalAddress_5 : std_logic_vector(7 downto 0) := x"10";
    PhysicalAddress_6 : std_logic_vector(7 downto 0) := x"0D"
  );
  port (
    clk20        : in std_logic; -- 10MHz Input Clock on FPGA | 20Mhz Input clock on Testbench -- TODO revert/comment when switch between FPGA and Testbench
    Ethernet_TDp : out std_logic;
    Ethernet_TDm : out std_logic
  );
end ethernet_tx;

architecture Behavioral of ethernet_tx is

  -- Pre-calculate Checksum (Static logic)
  constant sum1 : unsigned(31 downto 0) := x"0000C53F" +
  to_unsigned(IPsource_1 * 256 + IPsource_2, 32) +
  to_unsigned(IPsource_3 * 256 + IPsource_4, 32) +
  to_unsigned(IPdestination_1 * 256 + IPdestination_2, 32) +
  to_unsigned(IPdestination_3 * 256 + IPdestination_4, 32);
  constant sum2        : unsigned(31 downto 0)         := (sum1 and x"0000FFFF") + shift_right(sum1, 16);
  constant sum3        : unsigned(31 downto 0)         := not ((sum2 and x"0000FFFF") + shift_right(sum2, 16));
  constant IPchecksum3 : std_logic_vector(15 downto 0) := std_logic_vector(sum3(15 downto 0));

  -- signal clk20             : std_logic; -- TODO revert/comment when switch between FPGA and Testbench
  signal counter                   : unsigned(19 downto 0)         := (others => '0'); -- Counter reduced because the simulation takes too long when frame TX starts at 0.8s
  signal StartSending              : std_logic                     := '0';
  signal rdaddress                 : unsigned(7 downto 0)          := (others => '0');
  signal pkt_data                  : std_logic_vector(7 downto 0)  := (others => '0');
  signal ShiftCount                : unsigned(3 downto 0)          := x"F";
  signal SendingPacket             : std_logic                     := '0';
  signal ShiftData                 : std_logic_vector(7 downto 0)  := (others => '0');
  signal CRC                       : std_logic_vector(31 downto 0) := (others => '0');
  signal CRCflush                  : std_logic                     := '0';
  signal CRCinit                   : std_logic                     := '0';
  signal LinkPulseCount            : unsigned(17 downto 0)         := (others => '0');
  signal LinkPulse                 : std_logic                     := '0';
  signal SendingPacketData         : std_logic                     := '0';
  signal idlecount                 : unsigned(2 downto 0)          := "111";
  signal qo                        : std_logic                     := '1';
  signal qoe                       : std_logic                     := '0';
  constant DATA_SIZE               : integer                       := 128; -- byte of raw data
  constant END_OF_DATA             : integer                       := 50 + DATA_SIZE - 1; -- 113 when Data is 64B
  constant endOfPacket             : integer                       := END_OF_DATA + 5; -- 118 when data is 64B
  constant HARD_CODED_BASE_IP_LEN  : integer                       := 20;
  constant HARD_CODED_BASE_UDP_LEN : integer                       := 8;
  signal UDP_LEN                   : std_logic_vector(15 downto 0) := std_logic_vector(
  to_unsigned(HARD_CODED_BASE_UDP_LEN + DATA_SIZE, 16)
  );
  signal IP_LEN : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(
  HARD_CODED_BASE_UDP_LEN + DATA_SIZE + HARD_CODED_BASE_IP_LEN, 16));

begin

  -- Main Process (Synchronous logic only)
  process (clk20) -- TODO revert/comment when switch between FPGA and Testbench
    -- Variables for local combinational-like logic inside the process
    variable v_readram  : std_logic;
    variable v_CRCinput : std_logic;
    variable v_dataout  : std_logic;
    variable v_addr_int : integer;
  begin
    if clk20'event and clk20 = '1' then
      v_addr_int := to_integer(rdaddress);

      -- Packet Trigger (~0.8s). Afeter changed counter size the Pack trigger is around 50ms from start of simulation
      counter <= counter + 1;
      if counter = x"FFFFF" then
        StartSending <= '1';
      else
        StartSending <= '0';
      end if;

      -- Data ROM Logic
      case v_addr_int is
        when 0 | 1 | 2 | 3 | 4 | 5 | 6 => pkt_data <= x"55";
        when 7                         => pkt_data                         <= x"D5";
        when 8                         => pkt_data                         <= PhysicalAddress_1;
        when 9                         => pkt_data                         <= PhysicalAddress_2;
        when 10                        => pkt_data                        <= PhysicalAddress_3;
        when 11                        => pkt_data                        <= PhysicalAddress_4;
        when 12                        => pkt_data                        <= PhysicalAddress_5;
        when 13                        => pkt_data                        <= PhysicalAddress_6;
        when 14                        => pkt_data                        <= x"00";
        when 15                        => pkt_data                        <= x"12";
        when 16                        => pkt_data                        <= x"34";
        when 17                        => pkt_data                        <= x"56";
        when 18                        => pkt_data                        <= x"78";
        when 19                        => pkt_data                        <= x"90";
        when 20                        => pkt_data                        <= x"08"; -- Ether type / Length 1st Byte
        when 21                        => pkt_data                        <= x"00"; -- Ether type / Length 2nd Byte
        when 22                        => pkt_data                        <= x"45";
        when 23                        => pkt_data                        <= x"00";
        when 24                        => pkt_data                        <= IP_LEN(15 downto 8);-- x"00"; -- IP size 1st Byte
        when 25                        => pkt_data                        <= IP_LEN(7 downto 0); -- std_logic_vector(to_unsigned(46 - 18 + DATA_SIZE, 8));-- x"5C"; -- IP size 2nd Byte
        when 26                        => pkt_data                        <= x"00";
        when 27                        => pkt_data                        <= x"00";
        when 28                        => pkt_data                        <= x"00";
        when 29                        => pkt_data                        <= x"00";
        when 30                        => pkt_data                        <= x"80";
        when 31                        => pkt_data                        <= x"11";
        when 32                        => pkt_data                        <= IPchecksum3(15 downto 8);
        when 33                        => pkt_data                        <= IPchecksum3(7 downto 0);
        when 34                        => pkt_data                        <= std_logic_vector(to_unsigned(IPsource_1, 8));
        when 35                        => pkt_data                        <= std_logic_vector(to_unsigned(IPsource_2, 8));
        when 36                        => pkt_data                        <= std_logic_vector(to_unsigned(IPsource_3, 8));
        when 37                        => pkt_data                        <= std_logic_vector(to_unsigned(IPsource_4, 8));
        when 38                        => pkt_data                        <= std_logic_vector(to_unsigned(IPdestination_1, 8));
        when 39                        => pkt_data                        <= std_logic_vector(to_unsigned(IPdestination_2, 8));
        when 40                        => pkt_data                        <= std_logic_vector(to_unsigned(IPdestination_3, 8));
        when 41                        => pkt_data                        <= std_logic_vector(to_unsigned(IPdestination_4, 8));
        when 42                        => pkt_data                        <= x"04";
        when 43                        => pkt_data                        <= x"00";
        when 44                        => pkt_data                        <= x"04";
        when 45                        => pkt_data                        <= x"00";
        when 46                        => pkt_data                        <= UDP_LEN(15 downto 8);--  x"00"; -- UDP size 1st byte
        when 47                        => pkt_data                        <= UDP_LEN(7 downto 0);-- std_logic_vector(to_unsigned(8 + DATA_SIZE, 8)); -- UDP size 2nd byte
        when 48                        => pkt_data                        <= x"00";
        when 49                        => pkt_data                        <= x"00";
        when 50 to END_OF_DATA         => pkt_data         <= std_logic_vector(to_unsigned(v_addr_int - 50, 8));
        when others                    => pkt_data                    <= x"00";
      end case;

      -- Serialization Control
      if ShiftCount = 15 then
        v_readram := '1';
      else
        v_readram := '0';
      end if;

      if StartSending = '1' then
        SendingPacket <= '1';
      elsif ShiftCount = 14 and v_addr_int = endOfPacket then
        SendingPacket <= '0';
      end if;

      if SendingPacket = '1' then
        ShiftCount <= ShiftCount + 1;
      else
        ShiftCount <= x"F";
      end if;

      if v_readram = '1' then
        if SendingPacket = '1' then
          rdaddress <= rdaddress + 1;
        else
          rdaddress <= (others => '0');
        end if;
      end if;

      if ShiftCount(0) = '1' then
        if v_readram = '1' then
          ShiftData <= pkt_data;
        else
          ShiftData <= '0' & ShiftData(7 downto 1);
        end if;
      end if;

      -- CRC Calculation
      if CRCflush = '1' then
        v_CRCinput := '0';
      else
        v_CRCinput := ShiftData(0) xor CRC(31);
      end if;

      if CRCflush = '1' then
        CRCflush <= SendingPacket;
      elsif v_readram = '1' and v_addr_int = END_OF_DATA + 1 then
        CRCflush <= '1';
      end if;

      if v_readram = '1' then
        if v_addr_int = 7 then
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
          CRC <= (CRC(30 downto 0) & '0');
        end if;
      end if;

      -- Normal Link Pulse (NLP) Generation
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

      -- Manchester Encoder Logic
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
