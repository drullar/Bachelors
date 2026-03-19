[19.03.2026] - Managed to make 10Base-T transmission from the FPGA to my laptop. I used the code from https://www.fpga4fun.com/10BASE-T0.html, adjusted to work with the built in PLL in order to get 20Mhz clock. The code is located in ethernet_receive subfolder at the time of comitting this.
The solution worked when:
- connecting the FPGA directly to the RJ45 connector. Here 2 out pins were used for one positive and one inverted signal
- connecting the FPGA to the RJ45 connector via the transceiver
