library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx is
  generic (
    CLK_FREQ  : integer := 10_000_000;
    BAUD_RATE : integer := 115_200 -- Desired Baud Rate
  );
  port (
    clk      : in std_logic;
    rst      : in std_logic;
    tx_start : in std_logic;
    tx_data  : in std_logic_vector(7 downto 0);
    tx_line  : out std_logic;
    tx_busy  : out std_logic
  );
end entity uart_tx;

architecture rtl of uart_tx is

  -- Calculate the number of clock cycles per bit
  constant BIT_PERIOD : integer := CLK_FREQ / BAUD_RATE;

  type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
  signal state : state_type := IDLE;

  signal clk_count : integer range 0 to BIT_PERIOD - 1 := 0;
  signal bit_index : integer range 0 to 7              := 0;
  signal tx_reg    : std_logic_vector(7 downto 0)      := (others => '0');

begin

  process (clk, rst)
  begin
    if rst = '1' then
      state     <= IDLE;
      tx_line   <= '1'; -- Idle state for UART is High
      tx_busy   <= '0';
      clk_count <= 0;
      bit_index <= 0;
    elsif rising_edge(clk) then
      case state is

        when IDLE =>
          tx_line   <= '1';
          tx_busy   <= '0';
          clk_count <= 0;
          bit_index <= 0;
          if tx_start = '1' then
            tx_reg  <= tx_data; -- Latch input data
            tx_busy <= '1';
            state   <= START_BIT;
          end if;

        when START_BIT =>
          tx_line <= '0'; -- Start bit is always Low
          if clk_count < BIT_PERIOD - 1 then
            clk_count <= clk_count + 1;
          else
            clk_count <= 0;
            state     <= DATA_BITS;
          end if;

        when DATA_BITS =>
          tx_line <= tx_reg(bit_index); -- Send LSB first
          if clk_count < BIT_PERIOD - 1 then
            clk_count <= clk_count + 1;
          else
            clk_count <= 0;
            if bit_index < 7 then
              bit_index <= bit_index + 1;
            else
              bit_index <= 0;
              state     <= STOP_BIT;
            end if;
          end if;

        when STOP_BIT =>
          tx_line <= '1'; -- Stop bit is always High
          if clk_count < BIT_PERIOD - 1 then
            clk_count <= clk_count + 1;
          else
            clk_count <= 0;
            tx_busy   <= '0';
            state     <= IDLE;
          end if;

        when others =>
          state <= IDLE;
      end case;
    end if;
  end process;

end architecture rtl;