library ieee;
use ieee.std_logic_1164.all;

entity tb_ethernet is
end entity;

architecture sim of tb_ethernet is

    -- 1. Signals to connect to the DUT
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal clk_out  : std_logic;
    signal tx       : std_logic;
    signal tx2      : std_logic;
    signal tx_raw   : std_logic;
    signal tx_en    : std_logic;
    signal uart_tx  : std_logic;

    -- Clock period definition (10 MHz = 100 ns)
    constant CLK_PERIOD : time := 100 ns;

begin

    -- 2. Instantiate the Unit Under Test (UUT)
    uut: entity work.ethernet
        port map (
            clk      => clk,
            reset    => reset,
            clk_out  => clk_out,
            tx       => tx,
            tx2      => tx2,
            tx_raw   => tx_raw,
            tx_en    => tx_en,
            uart_tx  => uart_tx
        );

    -- 3. Clock Generation Process
    clk_process : process
    begin
        while now < 20 ms loop -- Run simulation for 20ms
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- 4. Stimulus Process (The "Test")
    stim_proc: process
    begin
        -- Hold reset for 200 ns
        reset <= '1';
        wait for 200 ns;
        reset <= '0';

        -- Your IDLE_s state waits for 96,000 cycles!
        -- That is 9.6 milliseconds of simulation time.
        -- We just wait and watch the waveforms.
        wait for 15 ms;

        -- End the simulation
        report "Simulation Finished";
        wait;
    end process;

end architecture;
