incoming_frame_filter : process (clk48) -- Read from FILTER FIFO and write to UTX FIFO
  variable processed_dst_mac      : std_logic_vector(47 downto 0) := (others => '0');
  variable processed_dst_mac_byte : integer                       := 0;
  variable sent_dst_mac_byte      : integer                       := 0;
  variable temp_byte              : std_logic_vector(7 downto 0)  := (others => '0');
  variable forward_data           : boolean                       := false;
  type processing_state is (s_WAIT_RAM, s_DST_MAC, s_HOLD, s_WAIT_RAM_2, s_OTHERS);
  variable state : frame_processing_state := s_WAIT_RAM;
begin -- Determines whether a frame is destined for this FPGA or not
  if rising_edge(clk48) then
    utx_fifo_write_en   <= '0';
    filter_fifo_read_en <= '0';
    temp_byte    := (others => '0');
    forward_data := false;
    f_fifo_read_signal      <= '0';
    f_fifo_start_processing <= '0';

    -- Reading Logic
    if filter_fifo_empty = '1' then
      -- reset logic
      processed_dst_mac      := (others => '0');
      processed_dst_mac_byte := 0;
      filter_fifo_read_en <= '0';
      forward_data := false;

    else
      if (utx_fifo_full = '1') then
        filter_fifo_read_en <= '0';
        fifo
        forward_data := false;
      else
        filter_fifo_read_en <= '1';
        f_fifo_read_signal  <= '1';
      end if;
    end if;
    if (f_fifo_read_signal = '1') then
      f_fifo_start_processing <= '1';
      if (state = s_HOLD) then
        filter_fifo_read_en <= '0';
      else
        filter_fifo_read_en <= '1';
      end if; -- 1 cycle delay since fifo_read_en
    end if;
    -- Reading logic

    if (f_fifo_start_procesing = '1' and filter_fifo_read_en <= '1') then -- 2 cycle delays since fifo_read_en
      f_fifo_temp_byte                                         <= filter_fifo_data_out(7 downto 0);
    end if;
    if (f_fifo_start_processing = '1') then
      case state is
        when s_WAIT_RAM =>
          state = s_DST_MAC;
        when s_DST_MAC
          -- Filtering logic
          case processed_dst_mac_byte is
            when 0 =>
              processed_dst_mac(47 downto 40) := f_fifo_temp_byte;
              processed_dst_mac_byte          := processed_dst_mac_byte + 1;
            when 1 =>
              processed_dst_mac(39 downto 32) := f_fifo_temp_byte;
              processed_dst_mac_byte          := processed_dst_mac_byte + 1;
            when 2 =>
              processed_dst_mac(31 downto 24) := f_fifo_temp_byte;
              processed_dst_mac_byte          := processed_dst_mac_byte + 1;
            when 3 =>
              processed_dst_mac(23 downto 16) := f_fifo_temp_byte;
              processed_dst_mac_byte          := processed_dst_mac_byte + 1;
            when 4 =>
              processed_dst_mac(15 downto 8) := f_fifo_temp_byte;
              processed_dst_mac_byte         := processed_dst_mac_byte + 1;
            when 5 =>
              processed_dst_mac(7 downto 0) := f_fifo_temp_byte;
              processed_dst_mac_byte        := processed_dst_mac_byte + 1;
              if (processed_dst_mac = FPGA_MAC_ADDRESS or processed_dst_mac(40) = '1') then
                state := s_HOLD;
              else
                state := s_WAIT_RAM;
              end if;
            when others => null;
          end case;
        when s_HOLD =>
          case sent_dst_mac_byte is
            when 0 =>
              temp_byte <= processed_dst_mac(47 downto 40);
              forward_data      := true;
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
            when 1 =>
              forward_data := true;
              temp_byte <= processed_dst_mac(39 downto 32);
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
            when 2 =>
              forward_data := true;
              temp_byte <= processed_dst_mac(31 downto 24);
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
            when 3 =>
              forward_data := true;
              temp_byte <= processed_dst_mac(23 downto 16);
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
            when 4 =>
              forward_data := true;
              temp_byte <= processed_dst_mac(15 downto 8);
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
            when 5 =>
              forward_data := true;
              temp_byte <= processed_dst_mac(7 downto 0);
              sent_dst_mac_byte := sent_dst_mac_byte + 1;
              state             := s_WAIT_RAM_2;
            when others => null
          end case;
        when s_WAIT_RAM_2 =>
          state := s_OTHERS;
        when s_OTHERS =>
          temp_byte   := f_fifo_temp_byte;
          forwad_data := true;
      end case;
    end if;
  end if;
  if forward_data then
    utx_fifo_write_en <= '1';
    utx_fifo_data_in  <= FIFO_PADDING_32 & temp_byte;
  end if;
end if;
end process;