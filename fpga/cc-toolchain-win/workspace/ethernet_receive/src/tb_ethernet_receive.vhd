library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.custom_types_pkg.all;

entity tb_ethernet_receive is
end tb_ethernet_receive;

architecture behavior of tb_ethernet_receive is

  -- Clocks
  signal clk20 : std_logic := '0';
  signal clk10 : std_logic := '0';
  signal clk48 : std_logic := '0';

  constant clk20_PERIOD : time := 50 ns;
  constant clk10_PERIOD : time := 100 ns;
  constant clk48_PERIOD : time := 20.833 ns;

  -- Ethernet loopback: TDp feeds both the controller TX output and its own RX input
  signal Ethernet_TDp : std_logic := '0';

  -- UART line connecting the Pico simulator to the controller UART RX input
  -- uart_tx drives this; idle state is '1' (standard UART)
  signal uart_line : std_logic;

  -- Pico simulator uart_tx control signals
  signal pico_tx_start : std_logic                    := '0';
  signal pico_tx_data  : std_logic_vector(7 downto 0) := (others => '0');
  signal pico_tx_busy  : std_logic;

  -- 4.8 Mbaud in simulation: 1 byte = 10 clk48 cycles instead of 4160.
  -- Reduces simulation time ~400x vs 115200 baud with no functional difference.
  constant SIM_BAUD_RATE : integer := 4_800_000;

begin

  --  DUT 
  ethernet_controller_inst : entity work.ethernet_controller
    generic map(
      SIMULATION            => true,
      ETHER_CONTROLLER_MODE => NORMAL,
      BAUD_RATE             => SIM_BAUD_RATE
    )
    port map
    (
      clk                 => clk10,
      clk48_sim           => clk48,
      clk20_sim           => clk20,
      manchester_data_in  => Ethernet_TDp,
      manchester_data_out => Ethernet_TDp,
      uart_in             => uart_line,
      uart_out            => open,
      config_loaded_led   => open
    );

  --  Ethernet RX monitor (DEBUG mode bypasses timing constraints) 
  ethernet_rx_debug : entity work.ethernet_rx
    generic map(
      ETHER_CONTROLLER_MODE => DEBUG
    )
    port map
    (
      clk48              => clk48,
      manchester_data_in => Ethernet_TDp,
      data_out           => open,
      data_out_valid     => open
    );

  --  Pico simulator: uart_tx at 48 MHz / 115 200 baud 
  -- Runs on clk48 so baud timing matches uart_rx inside ethernet_controller,
  -- which is also clocked by clk48 at CLK_FREQ = 48_000_000.
  pico_uart : entity work.uart_tx
    generic map(
      CLK_FREQ  => 48_000_000,
      BAUD_RATE => SIM_BAUD_RATE
    )
    port map
    (
      clk      => clk48,
      rst      => '0',
      tx_start => pico_tx_start,
      tx_data  => pico_tx_data,
      tx_line  => uart_line,
      tx_busy  => pico_tx_busy
    );

  --  Clock generators 
  clk10_gen : process
  begin
    while now < 20 ms loop
      clk10 <= '0';
      wait for clk10_PERIOD / 2;
      clk10 <= '1';
      wait for clk10_PERIOD / 2;
    end loop;
    wait;
  end process;

  clk20_gen : process
  begin
    while now < 20 ms loop
      clk20 <= '0';
      wait for clk20_PERIOD / 2;
      clk20 <= '1';
      wait for clk20_PERIOD / 2;
    end loop;
    wait;
  end process;

  clk48_gen : process
  begin
    while now < 20 ms loop
      clk48 <= '0';
      wait for clk48_PERIOD / 2;
      clk48 <= '1';
      wait for clk48_PERIOD / 2;
    end loop;
    wait;
  end process;

  --  Stimulus 
  -- Simulates the Pico sending one FFTP frame then a second frame.
  --
  -- Frame format (FFTP v1):
  --   [SIZE 2B big-endian] [DST_MAC 6B] [EtherType 2B] [Payload N bytes]
  --   SIZE = payload-only byte count.
  --
  -- Frame 1: SIZE=4, DST_MAC=FF:FF:FF:FF:FF:FF, EtherType=0x0800, Payload=DE AD BE EF
  -- Frame 2: SIZE=3, DST_MAC=00:11:22:33:44:55, EtherType=0x86DD, Payload=AA BB CC
  stim_proc : process

    -- Send one byte via pico_uart and wait for the full transmission to finish.
    -- Wait for busy='1' first to guard against the one-cycle start-latch delay.
    procedure send_byte(data : in std_logic_vector(7 downto 0)) is
    begin
      wait until falling_edge(clk48);
      pico_tx_data  <= data;
      pico_tx_start <= '1';
      wait until falling_edge(clk48);
      pico_tx_start <= '0';
      wait until pico_tx_busy = '1'; -- uart_tx latched the byte, now transmitting
      wait until pico_tx_busy = '0'; -- stop bit done, line back to idle
    end procedure;

    -- Send a complete FFTP frame, followed by a 2 ms inter-packet gap.
    -- Each byte gets a short ~2 µs gap so intra-frame timing stays well within
    -- the 1 ms uart_data_parse timeout.
    procedure send_frame(
      size       : in std_logic_vector(15 downto 0);
      dst_mac    : in std_logic_vector(47 downto 0);
      ether_type : in std_logic_vector(15 downto 0);
      -- payload bytes passed individually; extend for larger payloads as needed
      p0, p1, p2, p3 : in std_logic_vector(7 downto 0) := x"00";
      num_payload    : in integer                      := 4
    ) is
    begin
      -- SIZE
      send_byte(size(15 downto 8));
      wait for 2 us;
      send_byte(size(7 downto 0));
      wait for 2 us;
      -- DST_MAC (6 bytes, MSB first)
      send_byte(dst_mac(47 downto 40));
      wait for 2 us;
      send_byte(dst_mac(39 downto 32));
      wait for 2 us;
      send_byte(dst_mac(31 downto 24));
      wait for 2 us;
      send_byte(dst_mac(23 downto 16));
      wait for 2 us;
      send_byte(dst_mac(15 downto 8));
      wait for 2 us;
      send_byte(dst_mac(7 downto 0));
      wait for 2 us;
      -- EtherType
      send_byte(ether_type(15 downto 8));
      wait for 2 us;
      send_byte(ether_type(7 downto 0));
      wait for 2 us;
      -- Payload
      if num_payload >= 1 then
        send_byte(p0);
        wait for 2 us;
      end if;
      if num_payload >= 2 then
        send_byte(p1);
        wait for 2 us;
      end if;
      if num_payload >= 3 then
        send_byte(p2);
        wait for 2 us;
      end if;
      if num_payload >= 4 then
        send_byte(p3);
        wait for 2 us;
      end if;
      -- Mandatory inter-packet gap: > 1 ms so uart_data_parse timeout can fire
      -- before the next frame starts.  At 4.8 Mbaud simulation the gap still
      -- needs to be >= 1 ms real-time (48000 clk48 cycles at 48 MHz).
      wait for 1.5 ms;
    end procedure;

  begin
    -- Let clocks and synchronisers settle
    wait for 10 us;

    -- Frame 1: broadcast IPv4 frame, 4-byte payload
    send_frame(
    size        => x"0004",
    dst_mac     => x"FFFFFFFFFFFF",
    ether_type  => x"0800",
    p0 => x"DE", p1 => x"AD", p2 => x"BE", p3 => x"EF",
    num_payload => 4
    );

    -- Frame 2: unicast IPv6 frame, 3-byte payload
    send_frame(
    size        => x"0003",
    dst_mac     => x"001122334455",
    ether_type  => x"86DD",
    p0 => x"AA", p1 => x"BB", p2 => x"CC",
    num_payload => 3
    );

    wait;
  end process;

end behavior;
