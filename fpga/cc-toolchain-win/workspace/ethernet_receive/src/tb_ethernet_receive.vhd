library ieee;
use ieee.std_logic_1164.all;

entity tb_ethernet_receive is
end tb_ethernet_receive;

architecture behavior of tb_ethernet_receive is

  -- 1. Signals
  signal clk20        : std_logic := '0';
  signal clk10        : std_logic := '0';
  signal clk48        : std_logic := '0'; -- New 48MHz clock signal
  signal rst_n        : std_logic := '0';
  signal Ethernet_TDp : std_logic;
  signal TxR          : std_logic;

  -- 2. Clock Period Definitions
  -- 10 MHz = 100 ns (Wait, your original code said 10MHz but used 50ns for clk20)
  -- If clk20 is 20 MHz: T = 50 ns
  constant clk20_PERIOD : time := 50 ns;
  constant clk10_PERIOD : time := 100 ns;
  -- 48 MHz Calculation: T = 1 / 48,000,000 = 20.8333... ns
  constant clk48_PERIOD : time := 20.833 ns;

begin

  ethernet_controller_inst : entity work.ethernet_controller
    generic map(
      SIMULATION => true
    )
    port map
    (
      clk                 => clk10,
      clk48_sim           => clk48,
      clk20_sim           => clk20,
      manchester_data_in  => Ethernet_TDp,
      manchester_data_out => Ethernet_TDp
    );

  clk10_gen : process
  begin
    while now < 200 ms loop
      clk10 <= '0';
      wait for clk10_PERIOD/2;
      clk10 <= '1';
      wait for clk10_PERIOD / 2;
    end loop;
    wait;
  end process;

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