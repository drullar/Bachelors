[[19.03.2026] - Managed to make 10Base-T transmission from the FPGA to my laptop. I used the code from https://www.fpga4fun.com/10BASE-T0.html, adjusted to work with the built in PLL in order to get 20Mhz clock. The code is located in ethernet_receive subfolder at the time of comitting this.
The solution worked when:
- connecting the FPGA directly to the RJ45 connector. Here 2 out pins were used for one positive and one inverted signal
- connecting the FPGA to the RJ45 connector via the transceiver
[16.03.2026] - Trying to simulate the above design with GHDL and analyse it in GTKWave in order to start working on the receiver. Issue that I am facing with this is that the design starts transmitting the ethernet frame more than 100ms+ (unsure what time exactly) from the start of the simulation and gtkwave might have problems with too big of a files.


**TODO**
High Level Design breakdown thoughts on how to perform the reading:
1. Check Has Preamble Started
2. If so start oversampling (sync clock ???)
3. Detect SFD start and consequently it's end
4. Start reading Frame bytes and buffering/caching them. As a started cache everything up to data (excluding). I need to figure out how to determine when the data ends.
    Perhaps the knowledge of how big FCS and end of frame delimeter might help.
5. Process buffer data when it's the buffer is considered ready to read (up to data excluding or with data if that is feacable)