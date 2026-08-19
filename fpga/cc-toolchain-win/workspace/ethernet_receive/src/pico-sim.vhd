library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pico_sim is
  generic (
    CLK_FREQ  : integer := 48_000_000;
    BAUD_RATE : integer := 115_200;
    -- Inter-packet gap in clock cycles.  Default = 5 ms at 48 MHz.
    IPG_CLKS    : integer                       := 240_000;
    FRAME_COUNT : integer                       := 10;
    DST_MAC     : std_logic_vector(47 downto 0) := x"FFFFFFFFFFFF";
    ETHER_TYPE  : std_logic_vector(15 downto 0) := x"0800"
  );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    tx_line : out std_logic; -- UART output, wire to FPGA uart_in
    tx_done : out std_logic -- pulses '1' for one cycle after last frame sent
  );
end entity pico_sim;

architecture rtl of pico_sim is

  --  uart_tx instance signals 
  signal uart_start : std_logic                    := '0';
  signal uart_data  : std_logic_vector(7 downto 0) := (others => '0');
  signal uart_busy  : std_logic;

  --  Frame sequencer 
  -- Each frame has: 2 (SIZE) + 6 (DST_MAC) + 2 (EtherType) + 1 (payload) = 11 bytes.
  -- Payload is 1 byte = frame index.  Extend PAYLOAD_BYTES and the rom below
  -- if you need a larger payload.
  constant PAYLOAD_BYTES : integer := 1;
  constant HEADER_BYTES  : integer := 10; -- SIZE + MAC + EtherType
  constant FRAME_BYTES   : integer := HEADER_BYTES + PAYLOAD_BYTES;

  type state_t is (
    S_IDLE, -- initial wait / inter-packet gap
    S_LOAD, -- put next byte on uart_data and assert uart_start
    S_WAIT_BUSY, -- wait for uart_tx to go busy (start-latch confirm)
    S_WAIT_DONE, -- wait for uart_tx to finish (busy -> '0')
    S_GAP, -- inter-packet gap counter
    S_DONE -- all frames sent
  );
  signal state : state_t := S_IDLE;

  signal frame_idx : integer range 0 to FRAME_COUNT + 1 := 0; -- current frame (1-based); +1 margin for post-last-frame increment
  signal byte_idx  : integer range 0 to FRAME_BYTES     := 0; -- byte within frame
  signal gap_cnt   : integer range 0 to IPG_CLKS        := 0;

  -- Build the 11-byte frame for the current frame_idx into a lookup function.
  -- Byte 0-1 : SIZE (big-endian, = PAYLOAD_BYTES)
  -- Byte 2-7 : DST_MAC
  -- Byte 8-9 : EtherType
  -- Byte 10  : payload = frame index (1..FRAME_COUNT)
  function frame_byte(fidx : integer; bidx : integer) return std_logic_vector is
    variable b : std_logic_vector(7 downto 0);
  begin
    case bidx is
      when 0      => b      := std_logic_vector(to_unsigned(PAYLOAD_BYTES / 256, 8)); -- SIZE high
      when 1      => b      := std_logic_vector(to_unsigned(PAYLOAD_BYTES mod 256, 8)); -- SIZE low
      when 2      => b      := DST_MAC(47 downto 40);
      when 3      => b      := DST_MAC(39 downto 32);
      when 4      => b      := DST_MAC(31 downto 24);
      when 5      => b      := DST_MAC(23 downto 16);
      when 6      => b      := DST_MAC(15 downto 8);
      when 7      => b      := DST_MAC(7 downto 0);
      when 8      => b      := ETHER_TYPE(15 downto 8);
      when 9      => b      := ETHER_TYPE(7 downto 0);
      when others => b := std_logic_vector(to_unsigned(fidx, 8)); -- payload = frame index
    end case;
    return b;
  end function;

begin

  uart : entity work.uart_tx
    generic map(
      CLK_FREQ  => CLK_FREQ,
      BAUD_RATE => BAUD_RATE
    )
    port map
    (
      clk      => clk,
      rst      => rst,
      tx_start => uart_start,
      tx_data  => uart_data,
      tx_line  => tx_line,
      tx_busy  => uart_busy
    );

  sequencer : process (clk) begin
    if rising_edge(clk) then
      uart_start <= '0';
      tx_done    <= '0';

      if rst = '1' then
        state     <= S_IDLE;
        frame_idx <= 1;
        byte_idx  <= 0;
        gap_cnt   <= 0;

      else
        case state is

            -- Wait one cycle before starting (lets rst settle)
          when S_IDLE =>
            if frame_idx <= FRAME_COUNT then
              state        <= S_LOAD;
            else
              state <= S_DONE;
            end if;

            -- Present the next byte to uart_tx and pulse tx_start
          when S_LOAD =>
            uart_data  <= frame_byte(frame_idx, byte_idx);
            uart_start <= '1';
            state      <= S_WAIT_BUSY;

            -- Wait for uart_tx to latch the byte and go busy
          when S_WAIT_BUSY =>
            if uart_busy = '1' then
              state <= S_WAIT_DONE;
            end if;

            -- Wait for the byte to finish transmitting
          when S_WAIT_DONE =>
            if uart_busy = '0' then
              if byte_idx = FRAME_BYTES - 1 then
                -- Last byte of this frame: apply inter-packet gap
                byte_idx <= 0;
                gap_cnt  <= 0;
                state    <= S_GAP;
              else
                byte_idx <= byte_idx + 1;
                state    <= S_LOAD;
              end if;
            end if;

            -- Hold line idle for IPG_CLKS cycles between frames
          when S_GAP =>
            if gap_cnt = IPG_CLKS - 1 then
              frame_idx <= frame_idx + 1;
              state     <= S_IDLE;
            else
              gap_cnt <= gap_cnt + 1;
            end if;

            -- All frames transmitted
          when S_DONE =>
            tx_done <= '1';

        end case;
      end if;
    end if;
  end process;

end architecture rtl;
