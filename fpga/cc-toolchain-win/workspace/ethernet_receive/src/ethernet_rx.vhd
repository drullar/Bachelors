library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ethernet_rx is
  port (
    clk10              : in std_logic;
    clk48              : in std_logic;
    manchester_data_in : in std_logic; -- non-inverted signal from transmit circuit
    out_EdgeDetected   : out std_logic;
    out_bit            : out std_logic;
    data_out           : out std_logic
  );
end ethernet_rx;

architecture Behavioral of ethernet_rx is

  signal in_data                    : std_logic_vector(2 downto 0) := (others  => '0');
  signal data_reg                   : std_logic_vector(7 downto 0) := ((others => '0'));
  signal bits_read                  : std_logic_vector(3 downto 0) := ((others => '0'));
  signal data_done                  : std_logic_vector(7 downto 0) := ((others => '0'));
  signal cycles_since_last_read_bit : std_logic_vector(2 downto 0) := ((others => '0')); -- used to ignore mid bit transitions
  signal bytes_read                 : std_logic_vector(9 downto 0) := (others  => '0');
  signal bit_read_to_reg            : std_logic                    := '0';
  -- Uart signals
  signal uart_reset             : std_logic                    := '0';
  signal uart_start             : std_logic                    := '0';
  signal uart_data              : std_logic_vector(7 downto 0) := (others => '0');
  signal uart_busy              : std_logic;
  signal uart_bytes_transmitted : std_logic_vector(9 downto 0) := (others => '0');
begin

  uart : entity work.uart_tx
    port map
    (
      clk      => clk10,
      rst      => uart_reset,
      tx_start => uart_start,
      tx_data  => uart_data,
      tx_line  => data_out,
      tx_busy  => uart_busy
    );
  process (clk48)
    variable cycles_since_last_edge : integer := 0;
    variable v_edge_detected        : boolean := false;
  begin
    if rising_edge(clk48) then

      if ((uart_data /= data_done or (unsigned(bytes_read) > 0 and unsigned(uart_bytes_transmitted) < unsigned(bytes_read))) and uart_busy = '0') then
        uart_data              <= data_done;
        uart_start             <= '1';
        uart_bytes_transmitted <= std_logic_vector(unsigned(uart_bytes_transmitted) + 1);
      else
        uart_start <= '0';
      end if;

      v_edge_detected := false;
      in_data <= in_data(1 downto 0) & manchester_data_in;
      out_bit <= 'Z';

      if ((in_data(2) xor in_data(1)) = '1') then
        v_edge_detected := true;
      end if;

      if (bytes_read /= "0000000000") then
        cycles_since_last_read_bit <= std_logic_vector(unsigned(cycles_since_last_read_bit) + 1);
      end if;

      if (v_edge_detected) then

        out_EdgeDetected <= '1';
        cycles_since_last_edge := 0;

        if ((bytes_read = "0000000000") or unsigned(cycles_since_last_read_bit) >= 3) then
          -- Bits are added to the registed in this IF 
          if (bits_read = "1000") then
            data_done  <= data_reg; -- Write full read byte
            data_reg   <= in_data(1) & (6 downto 0 => '0'); -- Reset data_reg and write incoming data in
            bits_read  <= "0001"; -- Set to 1
            bytes_read <= std_logic_vector(unsigned(bytes_read) + 1);
          else
            data_reg  <= in_data(1) & data_reg(7 downto 1); -- Bitshift right and at new bit as MSBit
            bits_read <= std_logic_vector(unsigned(bits_read) + 1);
          end if;
          bit_read_to_reg            <= '1';
          cycles_since_last_read_bit <= (others => '0');
          out_bit                    <= in_data(1);
        end if;
      else
        bit_read_to_reg  <= '0';
        out_EdgeDetected <= '0';
        if (unsigned(bits_read) > 0) then
          cycles_since_last_edge := cycles_since_last_edge + 1;
        end if;
      end if;

      if (cycles_since_last_edge > 6) then
        -- Reset stuff on long idle interval
        data_reg                   <= (others  => '0');
        bits_read                  <= (others  => '0');
        cycles_since_last_read_bit <= (others  => '0');
        data_done                  <= (others  => '0');
        bytes_read                 <= ((others => '0'));
        uart_bytes_transmitted     <= ((others => '0'));
      end if;
    end if;

  end process;
end Behavioral;