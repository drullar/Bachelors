library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blink is
    Port (
        clk       : in  STD_LOGIC;   -- 10 MHz clock
        tx        : out STD_LOGIC   -- Serial output
    );
end blink;

architecture Behavioral of blink is
    -- Constants
    constant BAUD_RATE      : integer := 9600;
    constant CLOCK_FREQ     : integer := 10000000; -- 10 MHz
    constant BAUD_COUNT     : integer := CLOCK_FREQ / BAUD_RATE;
    constant DATA_BYTE      : STD_LOGIC_VECTOR(7 downto 0) := "01010101"; -- Constant data to send (0x55)
    constant DELAY_CYCLES   : integer := CLOCK_FREQ / 10; -- 0.1 second delay between transmissions
    
    -- Constant byte to transmit (0x55 = '01010101' binary)
    constant TX_DATA     : STD_LOGIC_VECTOR(7 downto 0) := "01010101";
    
    -- 5-second delay counter (10 MHz * 5 sec = 50,000,000 cycles)
    constant DELAY_CYCLES: integer := 50_000_000;
    
    -- Power-on reset duration (100 clock cycles = 10 µs at 10 MHz)
    constant POR_CYCLES  : integer := 100;
    
    -- State machine
    type state_type is (POWER_ON_RESET, IDLE, DELAY_WAIT, START_BIT, DATA_BITS, STOP_BIT);
    signal state : state_type := POWER_ON_RESET;
    
    -- Counters
    signal baud_counter : integer range 0 to BAUD_PERIOD-1 := 0;
    signal bit_counter  : integer range 0 to 7 := 0;
    signal delay_counter: integer range 0 to DELAY_CYCLES-1 := 0;
    signal por_counter  : integer range 0 to POR_CYCLES-1 := 0;
    
    -- Data register
    signal tx_shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    tx <= '1'; -- Idle high
                    data_reg <= DATA_BYTE; -- Reload constant data
                    state <= START_BIT;
                    baud_counter <= 0;
                    
                when START_BIT =>
                    tx <= '0'; -- Start bit
                    
                    if baud_counter < BAUD_COUNT-1 then
                        baud_counter <= baud_counter + 1;
                    else
                        baud_counter <= 0;
                        state <= DATA_BITS;
                        bit_index <= 0;
                    end if;
                    
                when DATA_BITS =>
                    tx <= data_reg(bit_index); -- Send current bit
                    
                    if baud_counter < BAUD_COUNT-1 then
                        baud_counter <= baud_counter + 1;
                    else
                        baud_counter <= 0;
                        
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            state <= STOP_BIT;
                        end if;
                    end if;
                    
                when STOP_BIT =>
                    tx <= '1'; -- Stop bit
                    
                    if baud_counter < BAUD_COUNT-1 then
                        baud_counter <= baud_counter + 1;
                    else
                        baud_counter <= 0;
                        state <= IDLE;
                        delay_counter <= 0;
                    end if;
                    
                when others =>
                    state <= IDLE;
            end case;

        end if;
    end process;

end Behavioral;
