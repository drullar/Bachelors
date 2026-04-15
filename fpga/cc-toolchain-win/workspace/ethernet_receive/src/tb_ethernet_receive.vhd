library ieee;
use ieee.std_logic_1164.all;

entity tb_ethernet_receive is
-- Testbenches have empty entities
end tb_ethernet_receive;

architecture behavior of tb_ethernet_receive is

       -- 1. Signals to connect to the DUT (Matching the 4-port entity)
    signal clk20      : std_logic := '0';
    signal rst_n        :   std_logic; -- Active Low Reset
    signal Ethernet_TDp :  std_logic;
    signal Ethernet_TDm :  std_logic;

    -- Clock period definition (10 MHz = 100 ns)
    constant clk20_PERIOD : time := 50 ns;

begin

    -- 2. Instantiate the Unit Under Test (UUT)
    uut: entity work.ethernet_receive
        port map (
            clk20      => clk20,
            rst_n        => rst_n,
            Ethernet_TDp => Ethernet_TDp,
            Ethernet_TDm => Ethernet_TDm
        );

    -- 3. Clock Generation Process
    clk20_process : process
    begin
        -- Run for 1 millisecond (enough to see ~15 full frames)
        while now < 100 ms loop
            clk20 <= '0';
            wait for clk20_PERIOD / 2;
            clk20 <= '1';
            wait for clk20_PERIOD / 2;
        end loop;
        wait;
    end process;


end behavior;