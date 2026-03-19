library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ethernet_receive is
    generic (
        -- IP source: 192.168.0.44
        IPsource_1 : integer := 192;
        IPsource_2 : integer := 168;
        IPsource_3 : integer := 21;
        IPsource_4 : integer := 12;
        -- IP destination: 192.168.0.2
        IPdestination_1 : integer := 192;
        IPdestination_2 : integer := 168;
        IPdestination_3 : integer := 21;
        IPdestination_4 : integer := 11;
        -- Physical Address (MAC): 00:07:95:0B:FB:AF
        PhysicalAddress_1 : std_logic_vector(7 downto 0) := x"54";
        PhysicalAddress_2 : std_logic_vector(7 downto 0) := x"E1";
        PhysicalAddress_3 : std_logic_vector(7 downto 0) := x"AD";
        PhysicalAddress_4 : std_logic_vector(7 downto 0) := x"1B";
        PhysicalAddress_5 : std_logic_vector(7 downto 0) := x"10";
        PhysicalAddress_6 : std_logic_vector(7 downto 0) := x"0D"
        -- 54-E1-AD-1B-10-0D
    );
    port (
        clk          : in  std_logic; -- 10MHz Input Clock
        Ethernet_TDp : out std_logic;
        Ethernet_TDm : out std_logic;
        clk_out      : out std_logic
    );
end ethernet_receive;

architecture Behavioral of ethernet_receive is

    -- Vendor PLL Component
    component CC_PLL is
        generic (
            REF_CLK         : string;
            OUT_CLK         : string;
            PERF_MD         : string;
            LOW_JITTER      : integer;
            CI_FILTER_CONST : integer;
            CP_FILTER_CONST : integer
        );
        port (
            CLK_REF             : in  std_logic;
            USR_CLK_REF         : in  std_logic;
            CLK_FEEDBACK        : in  std_logic;
            USR_LOCKED_STDY_RST : in  std_logic;
            USR_PLL_LOCKED_STDY : out std_logic;
            USR_PLL_LOCKED      : out std_logic;
            CLK0                : out std_logic;
            CLK90               : out std_logic;
            CLK180              : out std_logic;
            CLK270              : out std_logic;
            CLK_REF_OUT         : out std_logic
        );
    end component;

    -- Constants for Checksum (Calculated at Compile Time)
    constant sum1 : unsigned(31 downto 0) := x"0000C53F" +
                    to_unsigned(IPsource_1 * 256 + IPsource_2, 32) +
                    to_unsigned(IPsource_3 * 256 + IPsource_4, 32) +
                    to_unsigned(IPdestination_1 * 256 + IPdestination_2, 32) +
                    to_unsigned(IPdestination_3 * 256 + IPdestination_4, 32);
    constant sum2 : unsigned(31 downto 0) := (sum1 and x"0000FFFF") + shift_right(sum1, 16);
    constant sum3 : unsigned(31 downto 0) := not ((sum2 and x"0000FFFF") + shift_right(sum2, 16));
    constant IPchecksum3 : std_logic_vector(15 downto 0) := std_logic_vector(sum3(15 downto 0));

    -- Clock and Control Signals
    signal clk20        : std_logic;
    signal counter      : unsigned(23 downto 0) := (others => '0');
    signal StartSending : std_logic := '0';
    signal rdaddress    : unsigned(6 downto 0) := (others => '0');
    signal pkt_data     : std_logic_vector(7 downto 0) := (others => '0');

    -- TX Logic Signals
    signal ShiftCount    : unsigned(3 downto 0) := x"F";
    signal SendingPacket : std_logic := '0';
    signal readram       : std_logic;
    signal ShiftData     : std_logic_vector(7 downto 0) := (others => '0');

    -- CRC Signals
    signal CRC           : std_logic_vector(31 downto 0) := (others => '0');
    signal CRCflush      : std_logic := '0';
    signal CRCinit       : std_logic := '0';
    signal CRCinput      : std_logic;

    -- NLP and Output Signals
    signal LinkPulseCount : unsigned(17 downto 0) := (others => '0');
    signal LinkPulse      : std_logic := '0';
    signal SendingPacketData : std_logic := '0';
    signal idlecount         : unsigned(2 downto 0) := "111";
    signal dataout           : std_logic;
    signal qo                : std_logic := '1';
    signal qoe               : std_logic := '0';

begin

    -- 1. PLL Instance: Convert 10MHz to 20MHz
    pll_gen : CC_PLL
        generic map (
            REF_CLK         => "10.0",
            OUT_CLK         => "20.0",
            PERF_MD         => "ECONOMY",
            LOW_JITTER      => 1,
            CI_FILTER_CONST => 2,
            CP_FILTER_CONST => 4
        )
        port map (
            CLK_REF             => clk,
            USR_CLK_REF         => '0',
            CLK_FEEDBACK        => '0',
            USR_LOCKED_STDY_RST => '0',
            USR_PLL_LOCKED_STDY => open,
            USR_PLL_LOCKED      => open,
            CLK0                => clk20,
            CLK90               => open,
            CLK180              => open,
            CLK270              => open,
            CLK_REF_OUT         => open
        );

    -- 2. Packet Timing (Trigger ~1s)
    process(clk20)
    begin
        if clk20'event and clk20 = '1' then
            counter <= counter + 1;
            if counter = x"FFFFFF" then
                StartSending <= '1';
            else
                StartSending <= '0';
            end if;
        end if;
    end process;

    -- 3. Data ROM
    process(clk20)
    begin
        if clk20'event and clk20 = '1' then
            case to_integer(rdaddress) is
                when 0 to 6           => pkt_data <= x"55";
                when 7                => pkt_data <= x"D5";
                when 8                => pkt_data <= PhysicalAddress_1;
                when 9                => pkt_data <= PhysicalAddress_2;
                when 10               => pkt_data <= PhysicalAddress_3;
                when 11               => pkt_data <= PhysicalAddress_4;
                when 12               => pkt_data <= PhysicalAddress_5;
                when 13               => pkt_data <= PhysicalAddress_6;
                when 14               => pkt_data <= x"00";
                when 15               => pkt_data <= x"12";
                when 16               => pkt_data <= x"34";
                when 17               => pkt_data <= x"56";
                when 18               => pkt_data <= x"78";
                when 19               => pkt_data <= x"90";
                when 20               => pkt_data <= x"08";
                when 21               => pkt_data <= x"00";
                when 22               => pkt_data <= x"45";
                when 23               => pkt_data <= x"00";
                when 24               => pkt_data <= x"00";
                when 25               => pkt_data <= x"2E";
                when 26               => pkt_data <= x"00";
                when 27               => pkt_data <= x"00";
                when 28               => pkt_data <= x"00";
                when 29               => pkt_data <= x"00";
                when 30               => pkt_data <= x"80";
                when 31               => pkt_data <= x"11";
                when 32               => pkt_data <= IPchecksum3(15 downto 8);
                when 33               => pkt_data <= IPchecksum3(7 downto 0);
                when 34               => pkt_data <= std_logic_vector(to_unsigned(IPsource_1, 8));
                when 35               => pkt_data <= std_logic_vector(to_unsigned(IPsource_2, 8));
                when 36               => pkt_data <= std_logic_vector(to_unsigned(IPsource_3, 8));
                when 37               => pkt_data <= std_logic_vector(to_unsigned(IPsource_4, 8));
                when 38               => pkt_data <= std_logic_vector(to_unsigned(IPdestination_1, 8));
                when 39               => pkt_data <= std_logic_vector(to_unsigned(IPdestination_2, 8));
                when 40               => pkt_data <= std_logic_vector(to_unsigned(IPdestination_3, 8));
                when 41               => pkt_data <= std_logic_vector(to_unsigned(IPdestination_4, 8));
                when 42               => pkt_data <= x"04";
                when 43               => pkt_data <= x"00";
                when 44               => pkt_data <= x"04";
                when 45               => pkt_data <= x"00";
                when 46               => pkt_data <= x"00";
                when 47               => pkt_data <= x"1A";
                when 48               => pkt_data <= x"00";
                when 49               => pkt_data <= x"00";
                when 50 to 67         => pkt_data <= std_logic_vector(to_unsigned(to_integer(rdaddress) - 50, 8));
                when others           => pkt_data <= x"00";
            end case;
        end if;
    end process;

    -- 4. Serializer Control
    readram <= '1' when ShiftCount = 15 else '0';

    process(clk20)
    begin
        if clk20'event and clk20 = '1' then
            if StartSending = '1' then
                SendingPacket <= '1';
            elsif ShiftCount = 14 and rdaddress = 72 then
                SendingPacket <= '0';
            end if;

            if SendingPacket = '1' then
                ShiftCount <= ShiftCount + 1;
            else
                ShiftCount <= x"F";
            end if;

            if ShiftCount = 15 then
                if SendingPacket = '1' then
                    rdaddress <= rdaddress + 1;
                else
                    rdaddress <= (others => '0');
                end if;
            end if;

            if ShiftCount(0) = '1' then
                if readram = '1' then
                    ShiftData <= pkt_data;
                else
                    ShiftData <= '0' & ShiftData(7 downto 1);
                end if;
            end if;
        end if;
    end process;

    -- 5. CRC Generation
    CRCinput <= '0' when CRCflush = '1' else (ShiftData(0) xor CRC(31));

    process(clk20)
    begin
        if clk20'event and clk20 = '1' then
            if CRCflush = '1' then
                CRCflush <= SendingPacket;
            elsif readram = '1' then
                if rdaddress = 68 then
                    CRCflush <= '1';
                end if;
            end if;

            if readram = '1' then
                if rdaddress = 7 then
                    CRCinit <= '1';
                else
                    CRCinit <= '0';
                end if;
            end if;

            if ShiftCount(0) = '1' then
                if CRCinit = '1' then
                    CRC <= (others => '1');
                else
                    if CRCinput = '1' then
                        CRC <= (CRC(30 downto 0) & '0') xor x"04C11DB7";
                    else
                        CRC <= (CRC(30 downto 0) & '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- 6. Manchester Encoder and Normal Link Pulse
    process(clk20)
    begin
        if clk20'event and clk20 = '1' then
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

            SendingPacketData <= SendingPacket;

            if SendingPacketData = '1' then
                idlecount <= "000";
            elsif idlecount /= "111" then
                idlecount <= idlecount + 1;
            end if;

            if CRCflush = '1' then
                dataout <= not CRC(31);
            else
                dataout <= ShiftData(0);
            end if;

            if SendingPacketData = '1' then
                qo <= not (dataout xor ShiftCount(0));
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
