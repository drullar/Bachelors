library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity name requested by user
entity manchester is
    port (
        -- System Clock Input (10MHz)
        clk      : in  STD_LOGIC;                               -- FPGA 10MHz Reference Clock
        reset    : in STD_LOGIC;
        tx_encoded     : out STD_LOGIC;
        tx_raw         : out STD_LOGIC;
        clk_out        : out STD_LOGIC
    );
end entity manchester;

architecture behavioral of manchester is
    constant DATA : STD_LOGIC_VECTOR(15 downto 0) := "1010101010101010";
    signal data_out: STD_LOGIC;
    signal clk_5hz: STD_LOGIC;
begin
    clk_divider : process(clk)
    constant DIVIDE_BY : integer := 10;
    variable counter : integer := 1;
    begin
        if rising_edge(clk) then
            if counter = 1 then
                clk_5hz <= '1';
                counter := counter + 1;
            elsif counter = DIVIDE_BY then
                counter := 1;
                clk_5hz <= NOT clk_5hz;
            else
                counter := counter + 1;
            end if;
        end if;
    end process;

    manchester_encoding : process (clk_5hz, reset)
    variable dataIndex : integer range 0 to 15 := 15;
    begin
        if rising_edge(clk_5hz) then
            data_out <= DATA(dataIndex);
            if dataIndex = 0 then
                dataIndex := 15;
            else
                dataIndex := dataIndex - 1;
            end if;
        end if;
    end process;
    tx_raw <= data_out;
    tx_encoded <= data_out;--xor (not clk_5hz);
    clk_out <= clk_5hz;
    --TODO decoding process with separate clock if possible
end architecture behavioral;
