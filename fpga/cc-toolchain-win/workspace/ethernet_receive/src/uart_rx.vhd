library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity uart_rx is
  generic (
    CLK_FREQ  : integer := 48_000_000; -- input clock frequency in Hz
    BAUD_RATE : integer := 115_200 -- target baud rate in bps
  );
  port (
    clk        : in std_logic;
    rst        : in std_logic;
    rx_line    : in std_logic; -- raw UART RX line from pad
    data_out   : out std_logic_vector(7 downto 0); -- received byte (stable when data_valid='1')
    data_valid : out std_logic -- one-cycle pulse per received byte
  );
end uart_rx;

architecture Behavioral of uart_rx is

  constant BIT_TICKS  : integer := CLK_FREQ / BAUD_RATE; -- 416 at 48 MHz/115200
  constant HALF_TICKS : integer := BIT_TICKS / 2; -- 208

  type rx_state_t is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
  signal state : rx_state_t := IDLE;

  -- Three-stage synchroniser prevents metastability when rx_line crosses into
  -- the clk domain.  The output rx_s is the stable, registered input value.
  signal sync_reg : std_logic_vector(2 downto 0) := "111";
  signal rx_s     : std_logic;

  signal baud_cnt : integer range 0 to BIT_TICKS - 1 := 0;
  signal bit_idx  : integer range 0 to 7             := 0;
  signal rx_shift : std_logic_vector(7 downto 0)     := (others => '0');
  signal valid_r  : std_logic                        := '0';

begin

  sync_proc : process (clk) begin
    if rising_edge(clk) then
      sync_reg <= sync_reg(1 downto 0) & rx_line;
    end if;
  end process;
  rx_s <= sync_reg(2);

  data_out   <= rx_shift;
  data_valid <= valid_r;

  rx_proc : process (clk) begin
    if rising_edge(clk) then
      valid_r <= '0'; -- default: no new byte this cycle

      if rst = '1' then
        state    <= IDLE;
        baud_cnt <= 0;
        bit_idx  <= 0;

      else
        case state is

          when IDLE =>
            if rx_s = '0' then
              baud_cnt <= 0;
              state    <= START_BIT;
            end if;
          when START_BIT =>
            if baud_cnt = HALF_TICKS - 1 then
              if rx_s = '0' then -- still low 
                baud_cnt <= 0;
                bit_idx  <= 0;
                state    <= DATA_BITS;
              else -- line rose before mid-bit 
                state <= IDLE;
              end if;
            else
              baud_cnt <= baud_cnt + 1;
            end if;

          when DATA_BITS =>
            if baud_cnt = BIT_TICKS - 1 then
              baud_cnt          <= 0;
              rx_shift(bit_idx) <= rx_s;
              if bit_idx = 7 then
                bit_idx <= 0;
                state   <= STOP_BIT;
              else
                bit_idx <= bit_idx + 1;
              end if;
            else
              baud_cnt <= baud_cnt + 1;
            end if;

          when STOP_BIT =>
            if baud_cnt = BIT_TICKS - 1 then
              baud_cnt <= 0;
              if rx_s = '1' then -- valid stop bit
                valid_r <= '1';
              end if;
              state <= IDLE;
            else
              baud_cnt <= baud_cnt + 1;
            end if;

        end case;
      end if;
    end if;
  end process;

end Behavioral;
