library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ethernet is
    port (
        clk     : in  STD_LOGIC; -- 10MHz Bit Clock
        clk_out : out STD_LOGIC;
        tx      : out STD_LOGIC;
        tx_en   : out STD_LOGIC
    );
end entity ethernet;

architecture behavioral of ethernet is

    constant SFD_PATTERN    : std_logic_vector(7 downto 0) := "10101011";
    constant DEST_MAC       : std_logic_vector(47 downto 0) := x"ffffffffffff";
    constant SRC_MAC        : std_logic_vector(47 downto 0) := x"10828618ea08";
    constant ETHER_TYPE     : std_logic_vector(15 downto 0) := x"88b5";
    constant PAYLOAD_BYTES  : integer := 46;

    type TRANSMISSION_STATE is (IDLE_s, PREAMBLE_s, SFD_s, DEST_MAC_s, SRC_MAC_s, ETHER_TYPE_s, PAYLOAD_s, FCS_s);
    signal state : TRANSMISSION_STATE := IDLE_s;

    signal bit_cnt      : integer range 0 to 7 := 7;
    signal byte_cnt     : integer range 0 to 63 := 0;
    signal idle_cnt     : integer range 0 to 127 := 0;
    signal fcs_bit_cnt  : integer range 0 to 31 := 0;

    signal tx_raw_reg   : std_logic := '0';
    signal crc_reg      : std_logic_vector(31 downto 0) := (others => '1');
    signal payload_data : std_logic_vector((PAYLOAD_BYTES * 8) - 1 downto 0) := (others => '0');

    function next_crc32_reflected(
        current_crc : std_logic_vector(31 downto 0);
        data_bit    : std_logic
    ) return std_logic_vector is
        variable new_crc : std_logic_vector(31 downto 0);
        variable feedback : std_logic;
    begin
        feedback := current_crc(0) xor data_bit;
        new_crc(30 downto 0) := current_crc(31 downto 1);
        new_crc(31) := '0';
        if feedback = '1' then
            new_crc := new_crc xor x"EDB88320";
        end if;
        return new_crc;
    end function;

begin

    process(clk)
        variable current_byte : std_logic_vector(7 downto 0);
    begin
        if rising_edge(clk) then
            case state is

                when IDLE_s =>
                    tx_raw_reg <= '0';
                    fcs_bit_cnt <= 0;
                    if idle_cnt >= 95 then
                        state <= PREAMBLE_s;
                        idle_cnt <= 0;
                        bit_cnt <= 7;
                        byte_cnt <= 0;
                    else
                        idle_cnt <= idle_cnt + 1;
                    end if;

                when PREAMBLE_s =>
                    -- Fixed syntax: No 'when' allowed here in sequential logic
                    if (bit_cnt mod 2 /= 0) then
                        tx_raw_reg <= '1';
                    else
                        tx_raw_reg <= '0';
                    end if;

                    if bit_cnt = 0 then
                        bit_cnt <= 7;
                        if byte_cnt = 6 then state <= SFD_s; byte_cnt <= 0;
                        else byte_cnt <= byte_cnt + 1; end if;
                    else bit_cnt <= bit_cnt - 1; end if;

                when SFD_s =>
                    tx_raw_reg <= SFD_PATTERN(bit_cnt);
                    if bit_cnt = 0 then
                        state <= DEST_MAC_s;
                        bit_cnt <= 7;
                        byte_cnt <= 0;
                        crc_reg <= (others => '1');
                    else bit_cnt <= bit_cnt - 1; end if;

                when DEST_MAC_s | SRC_MAC_s =>
                    if state = DEST_MAC_s then
                        current_byte := DEST_MAC(47 - (byte_cnt * 8) downto 40 - (byte_cnt * 8));
                    else
                        current_byte := SRC_MAC(47 - (byte_cnt * 8) downto 40 - (byte_cnt * 8));
                    end if;

                    -- Indexing 7-bit_cnt sends LSB (0) first when bit_cnt starts at 7
                    tx_raw_reg <= current_byte(7 - bit_cnt);
                    crc_reg <= next_crc32_reflected(crc_reg, current_byte(7 - bit_cnt));

                    if bit_cnt = 0 then
                        bit_cnt <= 7;
                        if byte_cnt = 5 then
                            byte_cnt <= 0;
                            if state = DEST_MAC_s then state <= SRC_MAC_s; else state <= ETHER_TYPE_s; end if;
                        else byte_cnt <= byte_cnt + 1; end if;
                    else bit_cnt <= bit_cnt - 1; end if;

                when ETHER_TYPE_s =>
                    current_byte := ETHER_TYPE(15 - (byte_cnt * 8) downto 8 - (byte_cnt * 8));
                    tx_raw_reg <= current_byte(7 - bit_cnt);
                    crc_reg <= next_crc32_reflected(crc_reg, current_byte(7 - bit_cnt));
                    if bit_cnt = 0 then
                        bit_cnt <= 7;
                        if byte_cnt = 1 then state <= PAYLOAD_s; byte_cnt <= 0;
                        else byte_cnt <= byte_cnt + 1; end if;
                    else bit_cnt <= bit_cnt - 1; end if;

                when PAYLOAD_s =>
                    current_byte := payload_data((PAYLOAD_BYTES*8-1)-(byte_cnt*8) downto (PAYLOAD_BYTES*8-8)-(byte_cnt*8));
                    tx_raw_reg <= current_byte(7 - bit_cnt);
                    crc_reg <= next_crc32_reflected(crc_reg, current_byte(7 - bit_cnt));
                    if bit_cnt = 0 then
                        bit_cnt <= 7;
                        if byte_cnt = PAYLOAD_BYTES - 1 then
                            state <= FCS_s;
                            byte_cnt <= 0;
                        else byte_cnt <= byte_cnt + 1; end if;
                    else bit_cnt <= bit_cnt - 1; end if;

                when FCS_s =>
                    -- Transmit complemented CRC bit-by-bit
                    tx_raw_reg <= not crc_reg(fcs_bit_cnt);
                    if fcs_bit_cnt = 31 then
                        state <= IDLE_s;
                        fcs_bit_cnt <= 0;
                        idle_cnt <= 0;
                    else
                        fcs_bit_cnt <= fcs_bit_cnt + 1;
                    end if;

                when others => state <= IDLE_s;
            end case;
        end if;
    end process;

    -- Manchester Output (Registered to prevent glitches)
    process(clk)
    begin
        if state = IDLE_s then
            tx <= '0';
        else
            -- Data '1' = Mid-bit Low-to-High transition
            -- Data '0' = Mid-bit High-to-Low transition
            tx <= not (tx_raw_reg xor clk);
        end if;
    end process;

    tx_en   <= '0' when state = IDLE_s else '1';
    clk_out <= clk;

end architecture behavioral;
