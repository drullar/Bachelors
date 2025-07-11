library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink is
port (
    clk      : in  std_logic;          -- 100 MHz clock
    tx       : out std_logic           -- Serial output (IO_EB_B1)
);
end entity;

architecture rtl of blink is
    -- 300 baud @ 100MHz (100,000,000 / 300 = 333,333 cycles)
    constant BAUD_COUNT : integer := 333333;
    signal baud_counter : integer range 0 to BAUD_COUNT-1 := 0;
    signal baud_tick    : std_logic := '0';
    
    -- Data Generation
    signal data_counter : unsigned(7 downto 0) := (others => '0');
    signal tx_data      : std_logic_vector(7 downto 0);
begin

    -- Baud Rate Generator
    process(clk)
    begin
        if rising_edge(clk) then
            if baud_counter = BAUD_COUNT-1 then
                baud_counter <= 0;
                baud_tick <= '1';
            else
                baud_counter <= baud_counter + 1;
                baud_tick <= '0';
            end if;
        end if;
    end process;

    -- Data Counter (0-255)
    process(clk)
    begin
        if rising_edge(clk) then
            if baud_tick = '1' then
                if data_counter = 255 then
                    data_counter <= (others => '0'); -- Reset to 0 after 255
                else
                    data_counter <= data_counter + 1; -- Increment
                end if;
            end if;
        end if;
    end process;

    -- UART Transmitter
    process(clk)
        variable bit_count : integer range 0 to 10 := 0;
    begin
        if rising_edge(clk) then
            if baud_tick = '1' then
                case bit_count is
                    when 0 =>  -- Start bit
                        tx <= '0';
                        tx_data <= std_logic_vector(data_counter); -- Latch current value
                        bit_count := 1;
                    when 1 to 8 =>  -- Data bits (LSB first)
                        tx <= tx_data(bit_count-1);
                        bit_count := bit_count + 1;
                    when 9 =>  -- Stop bit
                        tx <= '1';
                        bit_count := 0;
                    when others => null;
                end case;
            end if;
        end if;
    end process;
end architecture;