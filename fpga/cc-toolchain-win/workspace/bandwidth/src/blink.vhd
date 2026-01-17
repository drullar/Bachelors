library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blink is
    Port ( 
        clk_10mhz     : in STD_LOGIC;           -- 10 MHz clock
        tx_data       : out STD_LOGIC;          -- Output to medium under test
        rx_data       : in STD_LOGIC;           -- Input from medium under test
        uart_tx       : out STD_LOGIC           -- UART output to Arduino
    );
end blink;

architecture Behavioral of blink is
    
    -- Constants for 300 baud UART with 10MHz clock
    constant BAUD_RATE_300  : integer := 300;
    constant CLOCK_FREQ     : integer := 10000000; -- 10 MHz
    constant BAUD_COUNT_300 : integer := CLOCK_FREQ / BAUD_RATE_300; -- 33333 cycles/bit
    
    -- Test duration: 5 seconds at 10MHz = 50,000,000 cycles
    constant TEST_DURATION  : unsigned(25 downto 0) := to_unsigned(50000000, 26);
    
    -- Test pattern signals
    signal pattern_counter  : unsigned(7 downto 0) := (others => '0');
    signal test_pattern     : STD_LOGIC_VECTOR(7 downto 0) := x"AA";
    
    -- Receiver signals
    signal rx_buffer        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal bit_counter      : unsigned(2 downto 0) := (others => '0');
    signal expected_pattern : STD_LOGIC_VECTOR(7 downto 0) := x"AA";
    
    -- Error counting signals
    signal total_bits_sent  : unsigned(31 downto 0) := (others => '0');
    signal error_counter    : unsigned(31 downto 0) := (others => '0');
    signal good_bits        : unsigned(31 downto 0) := (others => '0');
    
    -- Test control signals
    signal test_timer       : unsigned(25 downto 0) := (others => '0');
    signal test_active      : STD_LOGIC := '1';
    signal test_complete    : STD_LOGIC := '0';
    
    -- UART signals
    signal uart_data        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal uart_send        : STD_LOGIC := '0';
    signal uart_busy        : STD_LOGIC := '0';
    signal uart_baud_counter: integer range 0 to BAUD_COUNT_300 := 0;
    signal uart_bit_counter : integer range 0 to 10 := 0;
    signal uart_tx_reg      : STD_LOGIC := '1';  -- Start idle (high)
    
    -- Message transmission signals
    type message_array is array (0 to 19) of STD_LOGIC_VECTOR(7 downto 0);
    signal message          : message_array;
    signal msg_index        : integer range 0 to 20 := 0;
    signal send_message     : STD_LOGIC := '0';
    signal message_sent     : STD_LOGIC := '0';  -- Flag to indicate message completed
    
    -- Percentage calculation (rounded down)
    signal success_percentage : integer range 0 to 100 := 0;
    
    -- Temporary signals for calculation
    signal temp_calculation : unsigned(63 downto 0) := (others => '0');

begin

    uart_tx <= uart_tx_reg;

    -- Pattern Generator Process (10 Mbps data rate)
    pattern_generator: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if test_active = '1' then
                -- Send one bit per clock cycle (10 Mbps with 10 MHz clock)
                tx_data <= test_pattern(to_integer(pattern_counter(2 downto 0)));
                
                -- Increment counters
                pattern_counter <= pattern_counter + 1;
                total_bits_sent <= total_bits_sent + 1;
            else
                tx_data <= '0';
            end if;
        end if;
    end process;

    -- Receiver and Error Detection Process
    receiver: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if test_active = '1' then
                -- Sample incoming data
                rx_buffer <= rx_buffer(6 downto 0) & rx_data;
                
                -- Check for pattern match every 8 bits
                if bit_counter = "111" then
                    if rx_buffer = expected_pattern then
                        good_bits <= good_bits + 1;
                    else
                        error_counter <= error_counter + 1;
                    end if;
                end if;
                
                bit_counter <= bit_counter + 1;
            end if;
        end if;
    end process;

    -- Test Timer Process (5 seconds)
    test_timer_process: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if test_active = '1' then
                if test_timer < TEST_DURATION then
                    test_timer <= test_timer + 1;
                else
                    test_active <= '0';
                    test_complete <= '1';
                end if;
            end if;
        end if;
    end process;

    -- Percentage Calculation Process
    percentage_calc: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if test_complete = '1' and success_percentage = 0 then
                if total_bits_sent > 0 then
                    -- Calculate percentage: (good_bits * 100) / total_bits_sent
                    temp_calculation <= resize(good_bits * 100, 64);
                    success_percentage <= to_integer(temp_calculation / resize(total_bits_sent, 64));
                else
                    success_percentage <= 0;
                end if;
            end if;
        end if;
    end process;

    -- UART Transmitter Process (300 baud)
    uart_transmitter: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if test_complete = '1' and success_percentage > 0 and send_message = '0' and message_sent = '0' then
                -- Prepare message: "Success: XX%\r\n"
                message(0) <= x"53";  -- 'S'
                message(1) <= x"75";  -- 'u'
                message(2) <= x"63";  -- 'c'
                message(3) <= x"63";  -- 'c'
                message(4) <= x"65";  -- 'e'
                message(5) <= x"73";  -- 's'
                message(6) <= x"73";  -- 's'
                message(7) <= x"3A";  -- ':'
                message(8) <= x"20";  -- ' '
                
                -- Convert percentage to ASCII (rounded down)
                message(9)  <= std_logic_vector(to_unsigned(48 + (success_percentage / 10), 8));  -- Tens digit
                message(10) <= std_logic_vector(to_unsigned(48 + (success_percentage mod 10), 8)); -- Units digit
                message(11) <= x"25";  -- '%'
                message(12) <= x"0D";  -- '\r'
                message(13) <= x"0A";  -- '\n'
                message(14) <= x"00";  -- Null terminator
                
                msg_index <= 0;
                send_message <= '1';
                message_sent <= '0';
                
            elsif send_message = '1' then
                if uart_busy = '0' then
                    if msg_index < 15 then
                        if message(msg_index) /= x"00" then  -- Send until null terminator
                            uart_data <= message(msg_index);
                            uart_send <= '1';
                            msg_index <= msg_index + 1;
                        else
                            send_message <= '0';  -- Message complete
                            message_sent <= '1';  -- Mark message as sent
                        end if;
                    else
                        send_message <= '0';  -- Message complete
                        message_sent <= '1';  -- Mark message as sent
                    end if;
                end if;
            else
                uart_send <= '0';
            end if;
        end if;
    end process;

    -- UART Baud Rate Generator
    uart_baud_process: process(clk_10mhz)
    begin
        if rising_edge(clk_10mhz) then
            if uart_send = '1' and uart_busy = '0' then
                uart_busy <= '1';
                uart_baud_counter <= 0;
                uart_bit_counter <= 0;
                uart_tx_reg <= '0';  -- Start bit
                
            elsif uart_busy = '1' then
                if uart_baud_counter < BAUD_COUNT_300 - 1 then
                    uart_baud_counter <= uart_baud_counter + 1;
                else
                    uart_baud_counter <= 0;
                    uart_bit_counter <= uart_bit_counter + 1;
                    
                    case uart_bit_counter is
                        when 0 => uart_tx_reg <= uart_data(0);  -- Bit 0
                        when 1 => uart_tx_reg <= uart_data(1);  -- Bit 1
                        when 2 => uart_tx_reg <= uart_data(2);  -- Bit 2
                        when 3 => uart_tx_reg <= uart_data(3);  -- Bit 3
                        when 4 => uart_tx_reg <= uart_data(4);  -- Bit 4
                        when 5 => uart_tx_reg <= uart_data(5);  -- Bit 5
                        when 6 => uart_tx_reg <= uart_data(6);  -- Bit 6
                        when 7 => uart_tx_reg <= uart_data(7);  -- Bit 7
                        when 8 => 
                            uart_tx_reg <= '1';  -- Stop bit (idle state)
                            uart_busy <= '0';    -- Transmission complete
                        when others => 
                            uart_busy <= '0';
                            uart_tx_reg <= '1';  -- Ensure line stays idle
                    end case;
                end if;
            else
                -- Keep UART line idle (high) when not transmitting
                uart_tx_reg <= '1';
            end if;
        end if;
    end process;

end Behavioral;