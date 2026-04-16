Generating gtkwave simulation with testbench commands in order of execution:

1. ghdl -a ethernet_receive.vhd 
2. ghdl -a tb_ethernet_receive.vhd
3. ghdl -e tb_ethernet_receive
4. ghdl -r tb_ethernet_receive --vcd=wave.vcd
