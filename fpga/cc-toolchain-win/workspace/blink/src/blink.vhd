library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity name requested by user
entity blink is
    port (
        -- System Clock Input (10MHz)
        clk      : in  STD_LOGIC;                             -- FPGA 10MHz Reference Clock
        tx       : out STD_LOGIC
    );
end entity blink;

architecture behavioral of blink is
begin
    process(clk) begin
        tx <= '1' xor clk;
    end process;
end architecture behavioral;
