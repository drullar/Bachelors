library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blink is
    generic (
        CLK_FREQ    : integer := 10_000_000;  -- 10 MHz (GateMate)
        BAUD_RATE   : integer := 300
    );
    port (
        clk     : in  std_logic;
        tx      : out std_logic;
        rx      : in std_logic;
        uart_tx : out std_logic
    );
end blink;

architecture Behavioral of blink is
    signal uart_start: std_logic := '0';
    signal uart_data : std_logic_vector(7 downto 0) := (others => '0');
    signal tx_data  : std_logic := '1';
begin
    check_bandwidth : process(clk)
        constant COUNT_UNTIL: integer := CLK_FREQ * 5; -- 5 seconds
        variable tx_counter : integer := 0;
        variable rx_counter: integer := 0;
        variable correct_bits_received: integer := 0;
        variable incorect_bits_received: integer := 0;
    begin            
        if rising_edge(clk) then
            if rx_counter >= COUNT_UNTIL then
                uart_data <= std_logic_vector(to_unsigned(correct_bits_received/(tx_counter-1)*100,  uart_data'length));
                uart_start <= '1';
            else
                if tx_counter > 1 then
                    -- Start processing RX
                    rx_counter := rx_counter + 1;
                    if rx = not clk then
                        correct_bits_received := correct_bits_received + 1;
                    else
                        incorect_bits_received := incorect_bits_received + 1;
                    end if;
                else
                    -- do nothing
                end if;
                tx_counter := tx_counter + 1;
            end if;
        end if;
        tx <= clk;
    end process check_bandwidth;

    -- UART Transmission Logic
    uart : process(clk)
        constant BIT_PERIOD : integer := CLK_FREQ / BAUD_RATE;
        variable bit_count : integer range 0 to 7 := 0;
        variable clk_count : integer := 0;
        variable state     : integer range 0 to 3 := 0;  -- 0=Idle, 1=Start, 2=Data, 3=Stop
    begin
        if rising_edge(clk) then
            if uart_start = '1' then
                case state is
                    when 0 =>  -- Idle
                        tx_data <= '1';
                        state := 1;  -- Start bit
                        clk_count := 0;
                        
                    when 1 =>  -- Start bit (low)
                        tx_data <= '0';
                        if clk_count < BIT_PERIOD-1 then
                            clk_count := clk_count + 1;
                        else
                            clk_count := 0;
                            state := 2;  -- Data bits
                            bit_count := 0;
                        end if;

                    when 2 =>  -- Data bits (LSB first)
                        tx_data <= uart_data(bit_count);
                        if clk_count < BIT_PERIOD-1 then
                            clk_count := clk_count + 1;
                        else
                            clk_count := 0;
                            if bit_count < 7 then
                                bit_count := bit_count + 1;
                            else
                                state := 3;  -- Stop bit
                            end if;
                        end if;

                    when 3 =>  -- Stop bit (high)
                        tx_data <= '1';
                        if clk_count < BIT_PERIOD-1 then
                            clk_count := clk_count + 1;
                        else
                            clk_count := 0;
                            state := 0;  -- Return to idle
                        end if;
                end case;
            else 
                tx_data <= '1'; -- Keep line idle;
            end if;
        end if;
        uart_tx <= tx_data;
    end process;
end Behavioral;