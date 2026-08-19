library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.custom_types_pkg.all;

entity ethernet_controller is
  generic (
    SIMULATION            : boolean               := false;
    ETHER_CONTROLLER_MODE : ether_controller_mode := DEFAULT_CONTROLLER_MODE;
    BAUD_RATE             : integer               := 115_200
  );
  port (
    clk                 : in std_logic; -- 10 Mhz Clock coming from GateMate oscillator
    clk48_sim           : in std_logic;
    clk20_sim           : in std_logic;
    manchester_data_in  : in std_logic;
    uart_in             : in std_logic;
    manchester_data_out : out std_logic;
    uart_out            : out std_logic;
    config_loaded_led   : out std_logic
  );
end ethernet_controller;
architecture Behavioural of ethernet_controller is
  constant FPGA_MAC_ADDRESS : std_logic_vector(47 downto 0) := x"00_12_34_56_78_90";
  constant UART_RX_CLK      : integer                       := 48_000_000;

  -- Signals part of the design
  signal clk20 : std_logic;
  signal clk48 : std_logic;

  -- Components
  component CC_PLL is
    generic (
      REF_CLK         : string;
      OUT_CLK         : string;
      PERF_MD         : string;
      LOW_JITTER      : integer;
      CI_FILTER_CONST : integer;
      CP_FILTER_CONST : integer
    );
    port (
      CLK_REF             : in std_logic;
      CLK_FEEDBACK        : in std_logic;
      USR_CLK_REF         : in std_logic;
      USR_LOCKED_STDY_RST : in std_logic;
      USR_PLL_LOCKED_STDY : out std_logic;
      USR_PLL_LOCKED      : out std_logic;
      CLK0                : out std_logic;
      CLK90               : out std_logic;
      CLK180              : out std_logic;
      CLK270              : out std_logic;
      CLK_REF_OUT         : out std_logic
    );
  end component;

  component CC_FIFO_40K is
    generic (
      A_WIDTH   : integer;
      B_WIDTH   : integer;
      FIFO_MODE : string
    );
    port (
      B_DI    : in std_logic_vector(39 downto 0);
      A_CLK   : in std_logic;
      B_CLK   : in std_logic;
      F_RST_N : in std_logic;
      A_EN    : in std_logic; -- Read enable
      B_EN    : in std_logic; -- Write Enable
      B_WE    : in std_logic; -- Write Enable
      A_DO    : out std_logic_vector(39 downto 0);
      F_FULL  : out std_logic;
      F_EMPTY : out std_logic
    );
  end component;

  -- uart_tx FIFO
  signal utx_fifo_full     : std_logic := '0';
  signal utx_fifo_empty    : std_logic := '0';
  signal utx_fifo_write_en : std_logic := '0';
  signal utx_fifo_read_en  : std_logic := '0';
  signal utx_fifo_data_in  : std_logic_vector(39 downto 0);
  signal utx_fifo_data_out : std_logic_vector(39 downto 0);

  -- uart_rx FIFO
  signal urx_fifo_full      : std_logic := '0';
  signal urx_fifo_empty     : std_logic := '0';
  signal urx_fifo_write_en  : std_logic := '0';
  signal urx_fifo_read_en   : std_logic := '0';
  signal urx_fifo_data_in   : std_logic_vector(39 downto 0);
  signal urx_fifo_data_out  : std_logic_vector(39 downto 0);
  signal eth_tx_busy        : std_logic                     := '0';
  signal eth_tx_start       : std_logic                     := '0';
  signal eth_tx_payload_len : std_logic_vector(10 downto 0) := (others => '0');
  type urx_state_t is (URX_IDLE, URX_WAIT_PS, URX_LATCH_PS, URX_WAIT_BUSY);
  signal urx_state : urx_state_t := URX_IDLE;

  -- payload_size FIFO
  signal ps_fifo_full     : std_logic := '0';
  signal ps_fifo_empty    : std_logic := '0';
  signal ps_fifo_write_en : std_logic := '0';
  signal ps_fifo_read_en  : std_logic := '0';
  signal ps_fifo_data_in  : std_logic_vector(39 downto 0);
  signal ps_fifo_data_out : std_logic_vector(39 downto 0);

  constant FIFO_PADDING_32 : std_logic_vector(31 downto 0) := (others => '0');
  constant FIFO_PADDING_29 : std_logic_vector(28 downto 0) := (others => '0');
  -- UART_TX
  signal uart_busy    : std_logic := '0';
  signal uart_start   : std_logic := '0';
  signal uart_data_in : std_logic_vector (7 downto 0);

  -- Ethernet RX
  signal eth_data_ready : std_logic := '0';
  signal eth_data_out   : std_logic_vector(7 downto 0);

  type read_state_Type is (IDLE, WAIT_FOR_RAM, WAIT_FOR_RAM_2, START_UART, WAIT_FOR_TX);
  signal read_state : read_state_type := IDLE;

  -- UART_RX
  signal uart_rx_valid    : std_logic                    := '0';
  signal uart_rx_data_out : std_logic_vector(7 downto 0) := (others => '0');
  -- UART_RX "packet" segments. Packet structure PAYLOAD_LENGTH, DESTINATION_MAC, ETH_TYPE, PAYLOAD
  signal uart_rx_payload_len : std_logic_vector(15 downto 0) := (others => '0');
  signal uart_rx_dst_mac     : std_logic_vector(47 downto 0) := (others => '0');
  signal uart_rx_ether_type  : std_logic_vector(15 downto 0) := (others => '0');

  type uart_read_parse_t is (URP_IDLE, URP_LEN, URP_DST_MAC, URP_ETH_TYPE, URP_FIFO_WRITE, URP_PAYLOAD, URP_PAYLOAD_PADDING, URP_DONE); -- uart_read_parse = URP
  signal current_uart_parse_state : uart_read_parse_t := URP_IDLE;

  constant UART_RX_TIMEOUT_GOAL : integer := UART_RX_CLK / 1000; -- 1mS
begin

  gen_hardware : if not SIMULATION generate

    clk48_pll : CC_PLL
    generic map(
      REF_CLK => "10.0", OUT_CLK => "48.0", PERF_MD => "ECONOMY",
      LOW_JITTER => 1, CI_FILTER_CONST => 2, CP_FILTER_CONST => 4
    )
    port map
    (
      CLK_REF => clk, CLK_FEEDBACK => '0', USR_CLK_REF => '0',
      USR_LOCKED_STDY_RST => '0', USR_PLL_LOCKED_STDY => open,
      USR_PLL_LOCKED => open, CLK0 => clk48, CLK90 => open,
      CLK180 => open, CLK270 => open, CLK_REF_OUT => open
    );

    clk20_pll : CC_PLL
    generic map(
      REF_CLK => "10.0", OUT_CLK => "20.0", PERF_MD => "ECONOMY",
      LOW_JITTER => 1, CI_FILTER_CONST => 2, CP_FILTER_CONST => 4
    ) port map
    (
    CLK_REF => clk, CLK_FEEDBACK => '0', USR_CLK_REF => '0',
    USR_LOCKED_STDY_RST => '0', USR_PLL_LOCKED_STDY => open,
    USR_PLL_LOCKED => open, CLK0 => clk20, CLK90 => open,
    CLK180 => open, CLK270 => open, CLK_REF_OUT => open
    );

  end generate;

  gen_simulation : if SIMULATION generate
    clk48 <= clk48_sim;
    clk20 <= clk20_sim;
  end generate;

  ethernet_rx : entity work.ethernet_rx
    generic map(
      ETHER_CONTROLLER_MODE => ETHER_CONTROLLER_MODE
    )
    port map
    (
      clk48              => clk48,
      manchester_data_in => manchester_data_in,
      data_out           => eth_data_out,
      data_out_valid     => eth_data_ready
    );

  ethernet_tx : entity work.ethernet_tx
    generic map(
      FPGA_MAC_ADDRESS => FPGA_MAC_ADDRESS
    )
    port map
    (
      clk20        => clk20,
      Ethernet_TDp => manchester_data_out,
      Ethernet_TDm => open,
      tx_start     => eth_tx_start,
      tx_busy      => eth_tx_busy,
      payload_len  => eth_tx_payload_len,
      fifo_rd_en   => urx_fifo_read_en,
      fifo_data    => urx_fifo_data_out(7 downto 0),
      fifo_empty   => urx_fifo_empty
    );

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
      tx_line  => uart_out
    );

  uart_tx_fifo : CC_FIFO_40K -- ETHERNET -> FIFO -> UART
  generic map(
    A_WIDTH   => 10,
    B_WIDTH   => 10,
    FIFO_MODE => "ASYNC"
  )
  port map
  (
    B_DI    => utx_fifo_data_in,
    A_CLK   => clk,
    B_CLK   => clk48,
    F_RST_N => '1',
    A_EN    => utx_fifo_read_en,
    B_EN    => utx_fifo_write_en,
    B_WE    => utx_fifo_write_en,
    A_DO    => utx_fifo_data_out,
    F_FULL  => utx_fifo_full,
    F_EMPTY => utx_fifo_empty
  );

  uart_rx_fifo : CC_FIFO_40K -- UART -> FIFO -> ETHERNET
  generic map(
    A_WIDTH   => 10,
    B_WIDTH   => 10,
    FIFO_MODE => "ASYNC"
  )
  port map
  (
    B_DI    => urx_fifo_data_in,
    A_CLK   => clk20,
    B_CLK   => clk48,
    F_RST_N => '1',
    A_EN    => urx_fifo_read_en,
    B_EN    => urx_fifo_write_en,
    B_WE    => urx_fifo_write_en,
    A_DO    => urx_fifo_data_out,
    F_FULL  => urx_fifo_full,
    F_EMPTY => urx_fifo_empty
  );

  payload_size_fifo : CC_FIFO_40K -- Use to store payload size for uart_rx_fifo payload
  generic map(
    A_WIDTH   => 10,
    B_WIDTH   => 10,
    FIFO_MODE => "ASYNC"
  )
  port map
  (
    B_DI    => ps_fifo_data_in,
    A_CLK   => clk20,
    B_CLK   => clk48,
    F_RST_N => '1',
    A_EN    => ps_fifo_read_en,
    B_EN    => ps_fifo_write_en,
    B_WE    => ps_fifo_write_en,
    A_DO    => ps_fifo_data_out,
    F_FULL  => ps_fifo_full,
    F_EMPTY => ps_fifo_empty
  );

  utx_fifo_write : process (clk48) begin
    if (rising_edge(clk48)) then
      utx_fifo_write_en <= '0';
      if (eth_data_ready = '1' and utx_fifo_full /= '1') then
        utx_fifo_write_en <= '1';
        utx_fifo_data_in  <= FIFO_PADDING_32 & eth_data_out;
      end if;
    end if;
  end process;

  -- Reads bytes from utx_fifo (filled by ethernet_rx) and forwards them to uart_tx.
  -- Runs on clk (10 MHz) matching uart_tx's clock and utx_fifo's A_CLK.
  utx_fifo_read : process (clk) begin
    if rising_edge(clk) then
      utx_fifo_read_en <= '0';
      uart_start       <= '0';

      case read_state is

        when IDLE =>
          if utx_fifo_empty = '0' and uart_busy = '0' then
            utx_fifo_read_en <= '1';
            read_state       <= WAIT_FOR_RAM;
          end if;

          -- First dead cycle after read enable (block RAM capturing address)
        when WAIT_FOR_RAM =>
          read_state <= WAIT_FOR_RAM_2;

          -- Second dead cycle: accommodates the extra latency of the first read
          -- after a drain-then-refill transition on GateMate CC_FIFO_40K ASYNC.
          -- A_DO is guaranteed stable by the time START_UART samples it.
        when WAIT_FOR_RAM_2 =>
          read_state <= START_UART;

          -- Capture stable data and trigger uart_tx
        when START_UART =>
          uart_data_in <= utx_fifo_data_out(7 downto 0);
          uart_start   <= '1';
          read_state   <= WAIT_FOR_TX;

          -- Wait for uart_tx to finish before fetching the next byte.
          -- uart_start is already '0' (reset at top) so the only gate is uart_busy.
        when WAIT_FOR_TX =>
          if uart_busy = '0' and uart_start = '0' then
            read_state <= IDLE;
          end if;

        when others =>
          read_state <= IDLE;

      end case;
    end if;
  end process;

  urx_fifo_read : process (clk20) begin
    if rising_edge(clk20) then
      ps_fifo_read_en <= '0';
      eth_tx_start    <= '0';

      case urx_state is

          -- Wait until there is a queued descriptor AND ethernet_tx is free
        when URX_IDLE =>
          if ps_fifo_empty = '0' and eth_tx_busy = '0' then
            ps_fifo_read_en <= '1';
            urx_state       <= URX_WAIT_PS;
          end if;

          -- CC_FIFO_40K has a registered output: data is valid the cycle AFTER read_en
        when URX_WAIT_PS =>
          urx_state <= URX_LATCH_PS;

          -- ps_fifo_data_out is now stable: compute payload_len and fire tx_start
        when URX_LATCH_PS =>
          eth_tx_payload_len <= std_logic_vector(
            unsigned(ps_fifo_data_out(10 downto 0)) - to_unsigned(8, 11)
            );
          eth_tx_start <= '1';
          urx_state    <= URX_WAIT_BUSY;

          -- Wait for ethernet_tx to assert tx_busy, confirming it latched tx_start
        when URX_WAIT_BUSY =>
          if eth_tx_busy = '1' then
            urx_state <= URX_IDLE;
          end if;

      end case;
    end if;
  end process;

  uart_rx : entity work.uart_rx
    generic map(
      CLK_FREQ  => UART_RX_CLK,
      BAUD_RATE => BAUD_RATE
    )
    port map
    (
      clk        => clk48,
      rst        => '0',
      rx_line    => uart_in,
      data_out   => uart_rx_data_out,
      data_valid => uart_rx_valid
    );

  uart_data_parse : process (clk48) -- TODO add 1 ms timeout logic
    variable read_bytes           : integer := 0;
    variable timeout_counter      : integer := 0;
    variable fifo_write_bytes_cnt : integer := 0;
  begin
    if rising_edge(clk48) then
      urx_fifo_write_en <= '0';
      ps_fifo_write_en  <= '0';
      if (uart_rx_valid = '0' and current_uart_parse_state /= URP_IDLE) then
        timeout_counter := timeout_counter + 1;
        if (timeout_counter = UART_RX_TIMEOUT_GOAL) then
          current_uart_parse_state <= URP_IDLE;
          read_bytes := 0;
          uart_rx_dst_mac     <= (others => '0');
          uart_rx_payload_len <= (others => '0');
          uart_rx_ether_type  <= (others => '0');
        end if;
      else
        timeout_counter := 0;
      end if;
      case current_uart_parse_state is -- Logic handling StateMachine
        when URP_IDLE =>
          if (uart_rx_valid = '1') then
            uart_rx_payload_len(15 downto 8) <= uart_rx_data_out;
            read_bytes := read_bytes + 1;
            current_uart_parse_state <= URP_LEN;
          else -- Variable reset logic
            read_bytes := 0;
            uart_rx_dst_mac     <= (others => '0');
            uart_rx_payload_len <= (others => '0');
            uart_rx_ether_type  <= (others => '0');
          end if;

        when URP_LEN =>
          if (uart_rx_valid = '1') then
            uart_rx_payload_len(7 downto 0) <= uart_rx_data_out;
            read_bytes := read_bytes + 1;
          end if;
          if (read_bytes >= 2) then
            current_uart_parse_state <= URP_DST_MAC;
          end if;

        when URP_DST_MAC =>
          if (uart_rx_valid = '1') then
            uart_rx_dst_mac <= uart_rx_dst_mac(39 downto 0) & uart_rx_data_out;
            read_bytes := read_bytes + 1;
          end if;
          if (read_bytes >= 8) then -- LEN + MAC bytes
            current_uart_parse_state <= URP_ETH_TYPE;
          end if;

        when URP_ETH_TYPE =>
          if (uart_rx_valid = '1') then
            uart_rx_ether_type <= uart_rx_ether_type(7 downto 0) & uart_rx_data_out;
            read_bytes := read_bytes + 1;
          end if;
          if (read_bytes >= 10) then -- LEN + MAC + ETH_TYPE
            current_uart_parse_state <= URP_FIFO_WRITE;
          end if;

        when URP_FIFO_WRITE => -- Write MAC, ETH_TYPE to FIFO
          if (urx_fifo_full = '0') then
            case fifo_write_bytes_cnt is
              when 0 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(47 downto 40);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 1 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(39 downto 32);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 2 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(31 downto 24);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 3 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(23 downto 16);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 4 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(15 downto 8);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 5 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_dst_mac(7 downto 0);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 6 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_ether_type(15 downto 8);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en <= '1';
              when 7 =>
                urx_fifo_data_in <= FIFO_PADDING_32 & uart_rx_ether_type(7 downto 0);
                fifo_write_bytes_cnt := fifo_write_bytes_cnt + 1;
                urx_fifo_write_en        <= '1';
                current_uart_parse_state <= URP_PAYLOAD;
              when others =>
                current_uart_parse_state <= URP_PAYLOAD;
            end case;
          end if;

        when URP_PAYLOAD =>
          -- Write each incoming byte straight to urx_fifo
          if uart_rx_valid = '1' and urx_fifo_full = '0' then
            urx_fifo_data_in  <= FIFO_PADDING_32 & uart_rx_data_out;
            urx_fifo_write_en <= '1';
            read_bytes := read_bytes + 1;
          end if;
          if read_bytes - 10 >= to_integer(unsigned(uart_rx_payload_len)) then -- (read_bytes - 10) = read_bytes without previous headers
            if to_integer(unsigned(uart_rx_payload_len)) < 46 then
              current_uart_parse_state <= URP_PAYLOAD_PADDING;
            else
              current_uart_parse_state <= URP_DONE;
            end if;
          end if;
        when URP_PAYLOAD_PADDING =>
          -- read_bytes enters here as 10 + actual_payload_len.
          -- Loop until read_bytes = 56 (10 header + 46 min payload), writing 0x00 each cycle.
          -- urx_fifo_full guard prevents read_bytes advancing without an actual FIFO write.
          if read_bytes < 46 + 10 and urx_fifo_full = '0' then
            urx_fifo_data_in  <= FIFO_PADDING_32 & x"00";
            urx_fifo_write_en <= '1';
            read_bytes := read_bytes + 1;
          elsif read_bytes >= 46 + 10 then
            current_uart_parse_state <= URP_DONE;
          end if;
        when URP_DONE =>
          -- Commit the frame descriptor to ps_fifo so the dispatcher can trigger ethernet_tx.
          -- Descriptor value = payload bytes + 8 (6 DST_MAC + 2 EtherType already in urx_fifo).
          if ps_fifo_full = '0' then
            if unsigned(uart_rx_payload_len(10 downto 0)) < 46 then
              -- Padded frame: urx_fifo always holds exactly 54 bytes
              -- (8 header from URP_FIFO_WRITE + 46 padded payload from URP_PAYLOAD + URP_PAYLOAD_PADDING).
              -- The original payload length plays no part in the descriptor here.
              ps_fifo_data_in <= FIFO_PADDING_29 & std_logic_vector(to_unsigned(54, 11));
            else
              ps_fifo_data_in <= FIFO_PADDING_29 &
                std_logic_vector(
                unsigned(uart_rx_payload_len(10 downto 0)) + to_unsigned(8, 11)
                );
            end if;
            ps_fifo_write_en <= '1';
            read_bytes           := 0;
            fifo_write_bytes_cnt := 0;
            current_uart_parse_state <= URP_IDLE;
          end if;

        when others =>
          current_uart_parse_state <= URP_IDLE;
      end case;
    end if;
  end process;

  config_loaded_led <= '1';
end architecture;