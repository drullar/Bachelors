library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ethernet_controller is
  generic (
    SIMULATION : boolean := false
  );
  port (
    clk                 : in std_logic; -- 10 Mhz Clock coming from GateMate oscillator
    clk48_sim           : in std_logic;
    clk20_sim           : in std_logic;
    manchester_data_in  : in std_logic;
    manchester_data_out : out std_logic;
    uart_out            : out std_logic
  );
end ethernet_controller;

architecture Behavioural of ethernet_controller is
  CONSTANT FPGA_MAC_ADDRESS : std_logic_vector(47 downto 0) := x"00_12_34_56_78_90";

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

  -- FIFO 
  signal fifo_full     : std_logic := '0';
  signal fifo_empty    : std_logic := '0';
  signal fifo_write_en : std_logic := '0';
  signal fifo_read_en  : std_logic := '0';
  signal fifo_data_in  : std_logic_vector(39 downto 0);
  signal fifo_data_out : std_logic_vector(39 downto 0);

  constant fifo_padding : std_logic_vector(31 downto 0) := (others => '0');
  -- UART
  signal uart_busy    : std_logic := '0';
  signal uart_start   : std_logic := '0';
  signal uart_data_in : std_logic_vector (7 downto 0);

  -- Ethernet RX
  signal eth_data_ready : std_logic := '0';
  signal eth_data_out   : std_logic_vector(7 downto 0);

  type read_state_Type is (IDLE, READ_FIFO, WAIT_FOR_RAM, START_UART, WAIT_FOR_TX);
  signal read_state : read_state_type := IDLE;
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
    generic map (
      FPGA_MAC_ADDRESS => FPGA_MAC_ADDRESS
  )
    port map
    (
      clk48              => clk48,
      manchester_data_in => manchester_data_in,
      data_out           => eth_data_out,
      data_out_valid     => eth_data_ready
    );

  ethernet_tx : entity work.ethernet_tx
    port map
    (
      clk20        => clk20,
      Ethernet_TDp => manchester_data_out
    );

  uart_tx : entity work.uart_tx
    port map
    (
      clk      => clk,
      rst      => '0',
      tx_start => uart_start,
      tx_busy  => uart_busy,
      tx_data  => uart_data_in,
      tx_line  => uart_out
    );

  fifo : CC_FIFO_40K
  generic map(
    A_WIDTH   => 10,
    B_WIDTH   => 10,
    FIFO_MODE => "ASYNC"
  )
  port map
  (
    B_DI    => fifo_data_in,
    A_CLK   => clk,
    B_CLK   => clk48,
    F_RST_N => '1',
    A_EN    => fifo_read_en,
    B_EN    => fifo_write_en,
    B_WE    => fifo_write_en,
    A_DO    => fifo_data_out,
    F_FULL  => fifo_full,
    F_EMPTY => fifo_empty
  );

  fifo_write : process (clk48) begin
    if (rising_edge(clk48)) then
      fifo_write_en <= '0';
      if (eth_data_ready = '1' and fifo_full /= '1') then
        fifo_write_en <= '1';
        fifo_data_in  <= fifo_padding & eth_data_out;
      end if;
    end if;
  end process;

  fifo_read : process (clk) begin
    if rising_edge(clk) then
      fifo_read_en <= '0';
      uart_start   <= '0';

      case read_state is
        when IDLE =>
          if (fifo_empty = '0' and uart_busy = '0') then
            fifo_read_en <= '1';
            read_state   <= WAIT_FOR_RAM;
          end if;

        when WAIT_FOR_RAM =>
          -- Gives the GateMate block RAM 1 clock cycle to fetch data
          read_state <= START_UART;

        when START_UART =>
          -- Securely capture the stable data bus
          uart_data_in <= fifo_data_out(7 downto 0);
          uart_start   <= '1';
          read_state   <= WAIT_FOR_TX;

        when WAIT_FOR_TX =>
          -- FIX: Check that uart_start has dropped AND uart_busy has cleared.
          -- This prevents the 1-cycle propagation delay bug.
          if (uart_busy = '0' and uart_start = '0') then
            read_state <= IDLE;
          end if;

        when others =>
          read_state <= IDLE;
      end case;
    end if;
  end process;
end architecture;