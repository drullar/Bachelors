library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity pico_sim is
  generic (
    BAUD_RATE : integer := 115_200
  );
  port (
    clk      : in std_logic;
    data_out : out std_logic
  );
end pico_sim;

architecture behaviour of pico_sim is
  constant DST_MAC    : std_logic_vector (47 downto 0) := (others => '1'); -- broadcast
  constant LEN        : std_logic_vector (15 downto 0) := "0000000000000001";
  constant ETHER_TYPE : std_logic_vector (15 downto 0) := x"0080";
  constant PAYLOAD    : std_logic_vector (7 downto 0)  := x"0A";

  signal uart_start   : std_logic                    := '0';
  signal uart_busy    : std_logic                    := '1';
  signal uart_data_in : std_logic_vector(7 downto 0) := (others => '0');

  type state_type is (IDLE, SEND_LEN, SEND_MAC, SEND_ETYPE, SEND_PAYLOAD, DONE);
  signal state      : state_type           := SEND_LEN;
  signal byte_index : integer range 0 to 7 := 0;
begin
  uart_tx : entity work.uart_tx
    generic map(
      BAUD_RATE => BAUD_RATE
    )
    port map
    (
      clk      => clk,
      rst      => '0',
      tx_start => uart_start,
      tx_busy  => uart_busy,
      tx_data  => uart_data_in,
      tx_line  => data_out
    );

  process (clk) begin
    if rising_edge(clk) then
      -- Default single-cycle pulse for uart_start
      uart_start <= '0';

      case state is

        when SEND_LEN =>
          if (uart_busy = '0' and uart_start = '0') then
            -- LEN is 2 bytes (1 downto 0)
            uart_data_in <= LEN((1 - byte_index) * 8 + 7 downto (1 - byte_index) * 8);
            uart_start   <= '1';

            if byte_index = 1 then
              byte_index <= 0;
              state      <= SEND_MAC;
            else
              byte_index <= byte_index + 1;
            end if;
          end if;

        when SEND_MAC =>
          if (uart_busy = '0' and uart_start = '0') then
            -- DST_MAC is 6 bytes (5 downto 0)
            uart_data_in <= DST_MAC((5 - byte_index) * 8 + 7 downto (5 - byte_index) * 8);
            uart_start   <= '1';

            if byte_index = 5 then
              byte_index <= 0;
              state      <= SEND_ETYPE;
            else
              byte_index <= byte_index + 1;
            end if;
          end if;

        when SEND_ETYPE =>
          if (uart_busy = '0' and uart_start = '0') then
            -- ETHER_TYPE is 2 bytes (1 downto 0)
            uart_data_in <= ETHER_TYPE((1 - byte_index) * 8 + 7 downto (1 - byte_index) * 8);
            uart_start   <= '1';

            if byte_index = 1 then
              byte_index <= 0;
              state      <= SEND_PAYLOAD;
            else
              byte_index <= byte_index + 1;
            end if;
          end if;

        when SEND_PAYLOAD =>
          if (uart_busy = '0' and uart_start = '0') then
            -- PAYLOAD is 1 byte
            uart_data_in <= PAYLOAD;
            uart_start   <= '1';
            state        <= DONE;
          end if;

        when DONE =>
          -- Transmission complete
          null;

        when others =>
          state <= SEND_LEN;

      end case;
    end if;
  end process;
end behaviour;