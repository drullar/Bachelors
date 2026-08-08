Generating gtkwave simulation with testbench commands in order of execution:

1a. ghdl -a ethernet_tx.vhd
1b. ghdl -a ethernet_rx.vhd 
2. ghdl -a tb_ethernet_receive.vhd
3. ghdl -e tb_ethernet_receive
4. ghdl -r tb_ethernet_receive --vcd=wave.vcd
