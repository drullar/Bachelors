library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench entity has no ports
entity tb_blink is
end tb_blink;

architecture sim of tb_blink is
    -- Signals to connect to the DUT
    signal clk   : std_logic := '0';
    signal tx    : std_logic;
    signal rx    : std_logic := '0';
    signal s_end : std_logic;
    signal s_ok  : std_logic;

    -- Clock period constant
    constant CLK_PERIOD : time := 100 ns;  -- 10 MHz clock
begin
    -- Clock generation process
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Instantiate the DUT
    uut: entity work.blink
        generic map (CLK_FREQ => 10_000_000)
        port map (
            clk   => clk,
            tx    => tx,
            rx    => rx,
            s_end => s_end,
            s_ok  => s_ok
        );

    -- Simple stimulus for rx
    stim_proc: process
    begin
        wait for 2 us;
        rx <= '1';
        wait for 2 us;
        rx <= '0';
        wait for 5 us;
        wait;  -- stop stimulus, keep running
    end process;
end sim;
