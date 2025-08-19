library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blink is
    Port (
        clk : in  STD_LOGIC;     -- 10 MHz clock input
        tx    : out STD_LOGIC      -- UART TX output
    );
end blink;

architecture Behavioral of blink is
    -- UART configuration (9600 baud with 10 MHz clock)
    constant CLK_FREQ    : integer := 10_000_000;  -- 10 MHz
    constant BAUD_RATE   : integer := 9600;
    constant BAUD_PERIOD : integer := CLK_FREQ / BAUD_RATE;
    
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

uart_tx_process: process(clk)
begin
    if rising_edge(clk) then
        case state is
            -- Power-on reset state (initialization)
            when POWER_ON_RESET =>
                tx <= '1';  -- UART idle state is high
                baud_counter <= 0;
                bit_counter <= 0;
                delay_counter <= 0;
                tx_shift_reg <= (others => '0');
                
                if por_counter < POR_CYCLES-1 then
                    por_counter <= por_counter + 1;
                else
                    por_counter <= 0;
                    state <= IDLE;
                end if;
            
            when IDLE =>
                tx <= '1';  -- Idle high
                delay_counter <= 0;
                state <= DELAY_WAIT;
            
            when DELAY_WAIT =>
                if delay_counter < DELAY_CYCLES-1 then
                    delay_counter <= delay_counter + 1;
                else
                    delay_counter <= 0;
                    tx_shift_reg <= TX_DATA;  -- Load constant data
                    state <= START_BIT;
                end if;
            
            when START_BIT =>
                tx <= '0';  -- Start bit is low
                
                if baud_counter < BAUD_PERIOD-1 then
                    baud_counter <= baud_counter + 1;
                else
                    baud_counter <= 0;
                    state <= DATA_BITS;
                end if;
            
            when DATA_BITS =>
                tx <= tx_shift_reg(0);  -- Send LSB first
                
                if baud_counter < BAUD_PERIOD-1 then
                    baud_counter <= baud_counter + 1;
                else
                    baud_counter <= 0;
                    tx_shift_reg <= '0' & tx_shift_reg(7 downto 1);  -- Shift right
                    
                    if bit_counter < 7 then
                        bit_counter <= bit_counter + 1;
                    else
                        bit_counter <= 0;
                        state <= STOP_BIT;
                    end if;
                end if;
            
            when STOP_BIT =>
                tx <= '1';  -- Stop bit is high
                
                if baud_counter < BAUD_PERIOD-1 then
                    baud_counter <= baud_counter + 1;
                else
                    baud_counter <= 0;
                    state <= IDLE;
                end if;
            
            when others =>
                state <= POWER_ON_RESET;
        end case;
    end if;
end process;

end Behavioral;