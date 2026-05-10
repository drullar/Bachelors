library ieee;
use ieee.std_logic_1164.all;

entity tb_ethernet_receive is
end tb_ethernet_receive;

architecture behavior of tb_ethernet_receive is

  -- 1. Signals
  signal clk20        : std_logic := '0';
  signal clk48        : std_logic := '0'; -- New 48MHz clock signal
  signal rst_n        : std_logic := '0';
  signal Ethernet_TDp : std_logic;
  signal Ethernet_TDm : std_logic;
  signal TxR          : std_logic;

  -- 2. Clock Period Definitions
  -- 10 MHz = 100 ns (Wait, your original code said 10MHz but used 50ns for clk20)
  -- If clk20 is 20 MHz: T = 50 ns
  constant clk20_PERIOD : time := 50 ns;

  -- 48 MHz Calculation: T = 1 / 48,000,000 = 20.8333... ns
  constant clk48_PERIOD : time := 20.833 ns;

begin

  -- 3. UUT (Entity 1)
  uut : entity work.ethernet_receive
    port map
    (
      clk20        => clk20,
      rst_n        => rst_n,
      Ethernet_TDp => Ethernet_TDp,
      Ethernet_TDm => Ethernet_TDm
    );

  -- 4. Monitor (Entity 2) - Now using the 48MHz clock
  u_monitor : entity work.ethernet_rx
    port map
    (
      clk48              => clk48, -- Passing the new clock here
      manchester_data_in => Ethernet_TDp,
      out_EdgeDetected   => TxR
    );

  -- 5. 20 MHz Clock Process
  clk20_gen : process
  begin
    while now < 200 ms loop
      clk20 <= '0';
      wait for clk20_PERIOD / 2;
      clk20 <= '1';
      wait for clk20_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- 6. 48 MHz Clock Process (Running independently)
  clk48_gen : process
  begin
    while now < 200 ms loop
      clk48 <= '0';
      wait for clk48_PERIOD / 2;
      clk48 <= '1';
      wait for clk48_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- 7. Stimulus
  --  stim_proc : process
  --   begin
  --     rst_n <= '0';
  --     wait for 100 ns;
  --     rst_n <= '1';
  --     wait;
  --   end process;

end behavior;