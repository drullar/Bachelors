Generating gtkwave simulation with testbench commands in order of execution:

 ghdl -a .\custom_types_pkg.vhd .\cc_fifo_40k_sim.vhd .\ethernet_rx.vhd .\ethernet_tx.vhd .\uart_rx.vhd .\uart_tx.vhd .\ethernet_controller.vhd .\tb_ethernet_receive.vhd
1a. ghdl -a ethernet_tx.vhd
1b. ghdl -a ethernet_rx.vhd 
2. ghdl -a tb_ethernet_receive.vhd
3. ghdl -e tb_ethernet_receive
4. ghdl -r tb_ethernet_receive --vcd=wave.vcd
