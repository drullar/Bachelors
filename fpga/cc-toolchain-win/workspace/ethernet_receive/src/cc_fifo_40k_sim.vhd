library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CC_FIFO_40K is
  generic (
    A_WIDTH   : integer := 10;
    B_WIDTH   : integer := 10;
    FIFO_MODE : string  := "ASYNC"
  );
  port (
    B_DI    : in std_logic_vector(39 downto 0);
    A_CLK   : in std_logic;
    B_CLK   : in std_logic;
    F_RST_N : in std_logic := '0';
    A_EN    : in std_logic; -- Read Enable
    B_EN    : in std_logic; -- Write Enable
    B_WE    : in std_logic; -- Byte Write Enable
    A_DO    : out std_logic_vector(39 downto 0);
    F_FULL  : out std_logic;
    F_EMPTY : out std_logic
  );
end CC_FIFO_40K;

architecture behavioral of CC_FIFO_40K is
  -- Simple array to hold up to 1024 words
  type ram_type is array (0 to 1023) of std_logic_vector(39 downto 0);
  signal memory : ram_type := (others => (others => '0'));

  -- Pointers
  signal wr_ptr : unsigned(9 downto 0) := (others => '0');
  signal rd_ptr : unsigned(9 downto 0) := (others => '0');

  signal count : integer range 0 to 1024 := 0;
begin

  -- Status Flags
  F_EMPTY <= '1' when (count = 0) else
    '0';
  F_FULL <= '1' when (count = 1024) else
    '0';

  -- Write Process (Synchronized to B_CLK)
  process (B_CLK)
  begin
    if rising_edge(B_CLK) then
      if B_EN = '1' and B_WE = '1' and count < 1024 then
        memory(to_integer(wr_ptr)) <= B_DI;
        wr_ptr                     <= wr_ptr + 1;
      end if;
    end if;
  end process;

  -- Read Process (Synchronized to A_CLK)
  process (A_CLK)
  begin
    if rising_edge(A_CLK) then
      if A_EN = '1' and count > 0 then
        A_DO   <= memory(to_integer(rd_ptr));
        rd_ptr <= rd_ptr + 1;
      end if;
    end if;
  end process;

  -- Simplified tracking counter process
  process (A_CLK, B_CLK)
  begin
    -- Simple simulation simulation approximation of FIFO depth tracking
    if rising_edge(B_CLK) and (B_EN = '1' and B_WE = '1') and not (rising_edge(A_CLK) and A_EN = '1') then
      if count < 1024 then
        count <= count + 1;
      end if;
    elsif rising_edge(A_CLK) and A_EN = '1' and not (rising_edge(B_CLK) and B_EN = '1') then
      if count > 0 then
        count <= count - 1;
      end if;
    end if;
  end process;

end behavioral;