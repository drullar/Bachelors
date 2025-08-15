library ieee;
use ieee.std_logic_1164.all;

entity tb_blink is
-- Testbench has no ports
end tb_blink;

architecture sim of tb_blink is
    -- DUT ports
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '1';
    signal tx     : std_logic;

    -- Constants
    constant CLOCK_PERIOD : time := 10 ns; -- 100 MHz clock
begin

    ----------------------------------------------------------------------
    -- DUT instantiation
    ----------------------------------------------------------------------
    uut: entity work.blink
        port map (
            clk   => clk,
            reset => reset,
            tx    => tx
        );

    ----------------------------------------------------------------------
    -- Clock generation
    ----------------------------------------------------------------------
    clk_process : process
    begin
        clk <= '0';
        wait for CLOCK_PERIOD / 2;
        clk <= '1';
        wait for CLOCK_PERIOD / 2;
    end process;

    ----------------------------------------------------------------------
    -- Reset sequence
    ----------------------------------------------------------------------
    reset_process : process
    begin
        -- Hold reset high for a few clock cycles
        wait for 100 ns;
        reset <= '0'; -- Deassert reset
        wait;
    end process;

    ----------------------------------------------------------------------
    -- Simulation time limit
    ----------------------------------------------------------------------
    end_simulation : process
    begin
        wait for 100 ms; -- Run long enough to see multiple bytes
      --  assert false report "Simulation finished." severity failure;
    end process;

end sim;
