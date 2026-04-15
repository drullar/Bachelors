Generating gtkwave simulation with testbench:

ghdl -a ethernet_receive.vhd 
ghdl -a tb_ethernet_receive.vhd
ghdl -e tb_ethernet_receive
ghdl -r tb_ethernet_receive --vcd=wave.vcd
