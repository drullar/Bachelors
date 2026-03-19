library ieee;
use ieee.std_logic_1164.all;

entity tb_ethernet is
end entity;

architecture sim of tb_ethernet is

    -- 1. Signals to connect to the DUT (Matching the 4-port entity)
    signal clk      : std_logic := '0';
    signal clk_out  : std_logic;
    signal tx       : std_logic;
    signal tx_en    : std_logic;

    -- Clock period definition (10 MHz = 100 ns)
    constant CLK_PERIOD : time := 100 ns;

begin

    -- 2. Instantiate the Unit Under Test (UUT)
    uut: entity work.ethernet
        port map (
            clk      => clk,
            clk_out  => clk_out,
            tx       => tx,
            tx_en    => tx_en
        );

    -- 3. Clock Generation Process
    clk_process : process
    begin
        -- Run for 1 millisecond (enough to see ~15 full frames)
        while now < 1 ms loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- 4. Stimulus Process
    -- No reset needed anymore, just wait for the simulation to finish
    stim_proc: process
    begin
        report "Simulation Starting - Continuous Loop Mode";

        -- Wait for the clock process to finish the 1ms duration
        wait for 1 ms;

        report "Simulation Finished";
        wait;
    end process;

end architecture;
