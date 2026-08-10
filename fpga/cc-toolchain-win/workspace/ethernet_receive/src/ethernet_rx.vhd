library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.custom_types_pkg.all;

entity ethernet_rx is
generic (
    FPGA_MAC_ADDRESS : std_logic_vector(47 downto 0) := x"00_12_34_56_78_90";
    ETHER_CONTROLLER_MODE : ether_controller_mode := DEFAULT_CONTROLLER_MODE
  );
  port (
    clk48              : in std_logic;
    manchester_data_in : in std_logic; -- non-inverted signal from transmit circuit
    data_out           : out std_logic_vector(7 downto 0);
    data_out_valid     : out std_logic
  );
end ethernet_rx;


architecture Behavioral of ethernet_rx is
  
  subtype rx_frame_header is std_logic_vector(3 downto 0);
  constant INVALID : rx_frame_header := "0000";
  constant PREAMBLE : rx_frame_header := "0001";
  constant SFD : rx_frame_header := "0010";
  constant DST_MAC : rx_frame_header := "0011";
  constant SRC_MAC : rx_frame_header := "0100";
  constant ETHER_TYPE : rx_frame_header := "0101";
  constant DATA : rx_frame_header := "0110";
  
  signal in_data                    : std_logic_vector(2 downto 0) := (others  => '0');
  signal data_reg                   : std_logic_vector(7 downto 0) := (others => '0');
  signal bits_read                  : std_logic_vector(3 downto 0) := (others => '0');
  signal data_done                  : std_logic_vector(7 downto 0) := (others => '0');
  signal cycles_since_last_read_bit : std_logic_vector(2 downto 0) := (others => '0'); -- used to ignore mid bit transitions
  signal bytes_read                 : std_logic_vector(9 downto 0) := (others  => '0');

  signal current_header             : rx_frame_header                 := INVALID;
  signal invert_read_bits           : boolean                         := false; -- Identify whether the read bits are received in inverted manner
  signal frame_dst_mac              : std_logic_vector(47 downto 0) := (others => '0');
  -- Debug signals
  signal out_bit          : std_logic;
  signal out_EdgeDetected : std_logic;
  signal bit_read_to_reg            : std_logic                    := '0';
  signal header_switch_state_debug        : std_logic   := '0';
  signal preamble_byte_debug              : std_logic :='0';
begin
  process (clk48)
    variable cycles_since_last_edge : integer := 0;
    variable v_edge_detected        : boolean := false;
    variable temp_byte              : std_logic_vector(7 downto 0) := (others => '0');
    variable dst_mac_bytes          : integer := 0;
    variable preamble_bytes         : integer := 0;
  begin
    if rising_edge(clk48) then
      header_switch_state_debug <= '0';
      preamble_byte_debug <= '0';
      v_edge_detected := false;
      in_data        <= in_data(1 downto 0) & manchester_data_in;
      out_bit        <= 'Z';
      data_out_valid <= '0';
      temp_byte := (others => '0');

      if ((in_data(2) xor in_data(1)) = '1') then
        v_edge_detected := true;
      end if;

      if (bytes_read /= "0000000000") then
        cycles_since_last_read_bit <= std_logic_vector(unsigned(cycles_since_last_read_bit) + 1);
      end if;

      if (v_edge_detected) then

        out_EdgeDetected <= '1';
        cycles_since_last_edge := 0;
        
        -- Initial read of start of frame transmission or allign based on the clock cycles since last bit - used to read the data in the correct state after mancheter edge transition
        if ((bytes_read = "0000000000") or unsigned(cycles_since_last_read_bit) >= 3) then
          -- Bits are added to the registed in this IF 
          if (bits_read = "1000") then
            case ETHER_CONTROLLER_MODE is
              when DEBUG =>
                data_done      <= data_reg; -- Write full read byte
                data_out_valid <= '1';
                data_reg       <= in_data(1) & (6 downto 0 => '0'); -- Reset data_reg and write incoming data in
                bits_read      <= "0001"; -- Set to 1
                bytes_read     <= std_logic_vector(unsigned(bytes_read) + 1);
              when NORMAL =>
                case current_header is
                  when INVALID =>
                    preamble_bytes := 0;
                    if (data_reg = x"AA") then
                      invert_read_bits <= true;
                      current_header <= PREAMBLE;
                      preamble_bytes := preamble_bytes + 1;
                      header_switch_state_debug <= '1';
                      preamble_byte_debug <= '1';
                    end if;
                    if (data_reg = x"55") then 
                      invert_read_bits <= false;
                      current_header <= PREAMBLE;
                      preamble_bytes := preamble_bytes + 1;
                      header_switch_state_debug <= '1';
                      preamble_byte_debug <= '1';
                    end if;
                  when PREAMBLE =>
                    if (invert_read_bits) then
                      temp_byte := not data_reg;
                    else
                      temp_byte := data_reg;
                    end if;
                    if (temp_byte = x"55") then
                      preamble_byte_debug <= '1';
                      preamble_bytes := preamble_bytes + 1;
                    else 
                      current_header <= INVALID;
                      header_switch_state_debug <= '1';
                    end if;
                    if (preamble_bytes = 7) then
                        current_header <= SFD;
                        header_switch_state_debug <= '1';
                        preamble_bytes := 0;
                      end if;
                  when SFD =>
                    if (invert_read_bits) then
                      temp_byte := not data_reg;
                    else
                      temp_byte := data_reg;
                    end if;
                    if (temp_byte = x"D5") then
                      header_switch_state_debug <= '1';
                      current_header <= DST_MAC;
                    else 
                      header_switch_state_debug <= '1';
                      current_header <=INVALID;
                    end if;
                  when DST_MAC =>
                    if (invert_read_bits) then
                      temp_byte := not data_reg;
                    else
                      temp_byte := data_reg;
                    end if;
                    case dst_mac_bytes is
                        when 0 => frame_dst_mac(47 downto 40) <= temp_byte;
                        when 1 => frame_dst_mac(39 downto 32) <= temp_byte;
                        when 2 => frame_dst_mac(31 downto 24) <= temp_byte;
                        when 3 => frame_dst_mac(23 downto 16) <= temp_byte;
                        when 4 => frame_dst_mac(15 downto  8) <= temp_byte;
                        when 5 => frame_dst_mac( 7 downto  0) <= temp_byte;
                        when others => null;
                    end case;    
                    dst_mac_bytes := dst_mac_bytes + 1;
                    if (dst_mac_bytes = 6) then
                      if (frame_dst_mac = FPGA_MAC_ADDRESS or frame_dst_mac(40) = '1') then -- Check whether the FPGA is destination or the destination is Multicast/Broadcast
                        header_switch_state_debug <= '1';
                        current_header <= SRC_MAC;
                        data_done      <= data_reg; -- Write full read byte
                        data_out_valid <= '1';
                      else 
                        current_header <=INVALID;
                      end if;
                    end if;
                  when others =>
                    data_done      <= data_reg; -- Write full read byte
                    data_out_valid <= '1';
                end case;
                bytes_read     <= std_logic_vector(unsigned(bytes_read) + 1);
                data_reg <= in_data(1) & (6 downto 0 => '0');
                bits_read <= "0001"; -- Set to 1
            end case;
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
        bytes_read                 <= (others => '0');
        current_header <= INVALID;
        frame_dst_mac <= (others =>'0');
        preamble_bytes := 0;
        temp_byte := (others => '0');
      end if;

      data_out <= data_done;
    end if;

  end process;
end Behavioral;