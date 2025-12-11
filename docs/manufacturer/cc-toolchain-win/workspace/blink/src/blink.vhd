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
    
    -- States for the state machine
    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT, DELAY);
    signal state : state_type := IDLE;
    
    -- Counters and registers
    signal baud_counter     : integer range 0 to BAUD_COUNT-1 := 0;
    signal bit_index        : integer range 0 to 7 := 0;
    signal delay_counter    : integer range 0 to DELAY_CYCLES-1 := 0;
    
    -- Data register
    signal data_reg         : STD_LOGIC_VECTOR(7 downto 0) := DATA_BYTE;
    
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
