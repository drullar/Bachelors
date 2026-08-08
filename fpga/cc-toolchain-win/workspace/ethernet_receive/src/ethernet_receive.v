`timescale 1ns / 1ps

module ethernet_tx(
    input wire clk,      // 10MHz Input Clock from Oscillator
    inpethernet_tx
_n,    // Active Low Reset
    output wire Ethernet_TDp,
    output wire Ethernet_TDm
);

    // "IP source" - 192.168.21.12
    parameter IPsource_1 = 192;
    parameter IPsource_2 = 168;
    parameter IPsource_3 = 21;
    parameter IPsource_4 = 12;

    // "IP destination" - 192.168.21.11
    parameter IPdestination_1 = 192;
    parameter IPdestination_2 = 168;
    parameter IPdestination_3 = 21;
    parameter IPdestination_4 = 11;

    // "Physical Address" (Destination MAC) - 54:E1:AD:1B:10:0D
    parameter PhysicalAddress_1 = 8'h54;
    parameter PhysicalAddress_2 = 8'hE1;
    parameter PhysicalAddress_3 = 8'hAD;
    parameter PhysicalAddress_4 = 8'h1B;
    parameter PhysicalAddress_5 = 8'h10;
    parameter PhysicalAddress_6 = 8'h0D;

    //////////////////////////////////////////////////////////////////////
    // PLL Instantiation: Convert 10MHz to 20MHz
    //////////////////////////////////////////////////////////////////////
    wire clk20;
    wire usr_pll_lock;

    CC_PLL #(
        .REF_CLK("10.0"),    // reference input in MHz
        .OUT_CLK("20.0"),    // 10BASE-T logic needs 20MHz for Manchester encoding
        .PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
        .LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
        .CI_FILTER_CONST(2), // optional CI filter constant
        .CP_FILTER_CONST(4)  // optional CP filter constant
    ) pll_inst (
        .CLK_REF(clk),
        .CLK_FEEDBACK(1'b0),
        .USR_CLK_REF(1'b0),
        .USR_LOCKED_STDY_RST(1'b0),
        .USR_PLL_LOCKED_STDY(),
        .USR_PLL_LOCKED(usr_pll_lock),
        .CLK270(), .CLK180(), .CLK90(),
        .CLK0(clk20),
        .CLK_REF_OUT()
    );

    //////////////////////////////////////////////////////////////////////
    // Packet Trigger (approx every 0.8 seconds @ 20MHz)
    //////////////////////////////////////////////////////////////////////
    reg [23:0] counter;
    always @(posedge clk20) counter <= counter + 1'b1;

    reg StartSending;
    always @(posedge clk20) StartSending <= &counter;

    //////////////////////////////////////////////////////////////////////
    // IP Checksum calculation
    //////////////////////////////////////////////////////////////////////
    parameter IPchecksum1 = 32'h0000C53F + (IPsource_1<<8)+IPsource_2+(IPsource_3<<8)+IPsource_4+
                            (IPdestination_1<<8)+IPdestination_2+(IPdestination_3<<8)+(IPdestination_4);
    parameter IPchecksum2 = ((IPchecksum1&32'h0000FFFF)+(IPchecksum1>>16));
    parameter IPchecksum3 = ~((IPchecksum2&32'h0000FFFF)+(IPchecksum2>>16));

    reg [6:0] rdaddress;
    reg [7:0] pkt_data;

    always @(posedge clk20)
    case(rdaddress)
        // Ethernet preamble
        7'h00, 7'h01, 7'h02, 7'h03, 7'h04, 7'h05, 7'h06: pkt_data <= 8'h55;
        7'h07: pkt_data <= 8'hD5;
        // Ethernet header (Destination MAC)
        7'h08: pkt_data <= PhysicalAddress_1;
        7'h09: pkt_data <= PhysicalAddress_2;
        7'h0A: pkt_data <= PhysicalAddress_3;
        7'h0B: pkt_data <= PhysicalAddress_4;
        7'h0C: pkt_data <= PhysicalAddress_5;
        7'h0D: pkt_data <= PhysicalAddress_6;
        // Ethernet header (Source MAC - arbitrary)
        7'h0E: pkt_data <= 8'h00;
        7'h0F: pkt_data <= 8'h12;
        7'h10: pkt_data <= 8'h34;
        7'h11: pkt_data <= 8'h56;
        7'h12: pkt_data <= 8'h78;
        7'h13: pkt_data <= 8'h90;
        // IP header
        7'h14: pkt_data <= 8'h08; // EtherType: IP
        7'h15: pkt_data <= 8'h00;
        7'h16: pkt_data <= 8'h45;
        7'h17: pkt_data <= 8'h00;
        7'h18: pkt_data <= 8'h00;
        7'h19: pkt_data <= 8'h2E;
        7'h1A: pkt_data <= 8'h00;
        7'h1B: pkt_data <= 8'h00;
        7'h1C: pkt_data <= 8'h00;
        7'h1D: pkt_data <= 8'h00;
        7'h1E: pkt_data <= 8'h80;
        7'h1F: pkt_data <= 8'h11; // UDP
        7'h20: pkt_data <= IPchecksum3[15:8];
        7'h21: pkt_data <= IPchecksum3[ 7:0];
        7'h22: pkt_data <= IPsource_1;
        7'h23: pkt_data <= IPsource_2;
        7'h24: pkt_data <= IPsource_3;
        7'h25: pkt_data <= IPsource_4;
        7'h26: pkt_data <= IPdestination_1;
        7'h27: pkt_data <= IPdestination_2;
        7'h28: pkt_data <= IPdestination_3;
        7'h29: pkt_data <= IPdestination_4;
        // UDP header
        7'h2A: pkt_data <= 8'h04;
        7'h2B: pkt_data <= 8'h00;
        7'h2C: pkt_data <= 8'h04;
        7'h2D: pkt_data <= 8'h00;
        7'h2E: pkt_data <= 8'h00;
        7'h2F: pkt_data <= 8'h1A;
        7'h30: pkt_data <= 8'h00;
        7'h31: pkt_data <= 8'h00;
        // Payload (18 bytes)
        7'h32,7'h33,7'h34,7'h35,7'h36,7'h37,7'h38,7'h39,7'h3A,7'h3B,7'h3C,7'h3D,7'h3E,7'h3F,7'h40,7'h41,7'h42,7'h43:
               pkt_data <= rdaddress - 7'h32;
        default: pkt_data <= 8'h00;
    endcase

    //////////////////////////////////////////////////////////////////////
    // Serialization and CRC
    //////////////////////////////////////////////////////////////////////
    reg [3:0] ShiftCount;
    reg SendingPacket;
    always @(posedge clk20) if(StartSending) SendingPacket<=1; else if(ShiftCount==14 && rdaddress==7'h48) SendingPacket<=0;
    always @(posedge clk20) ShiftCount <= SendingPacket ? ShiftCount+1 : 15;
    wire readram = (ShiftCount==15);
    always @(posedge clk20) if(ShiftCount==15) rdaddress <= SendingPacket ? rdaddress+1 : 0;
    reg [7:0] ShiftData; always @(posedge clk20) if(ShiftCount[0]) ShiftData <= readram ? pkt_data : {1'b0, ShiftData[7:1]};

    // CRC32 Logic
    reg [31:0] CRC;
    reg CRCflush; always @(posedge clk20) if(CRCflush) CRCflush <= SendingPacket; else if(readram) CRCflush <= (rdaddress==7'h44);
    reg CRCinit; always @(posedge clk20) if(readram) CRCinit <= (rdaddress==7);
    wire CRCinput = CRCflush ? 0 : (ShiftData[0] ^ CRC[31]);
    always @(posedge clk20) if(ShiftCount[0]) CRC <= CRCinit ? ~0 : ({CRC[30:0],1'b0} ^ ({32{CRCinput}} & 32'h04C11DB7));

    //////////////////////////////////////////////////////////////////////
    // Output Generation: NLP and Manchester Encoder
    //////////////////////////////////////////////////////////////////////
    reg [17:0] LinkPulseCount; always @(posedge clk20) LinkPulseCount <= SendingPacket ? 0 : LinkPulseCount+1;
    reg LinkPulse; always @(posedge clk20) LinkPulse <= &LinkPulseCount[17:1];

    reg SendingPacketData; always @(posedge clk20) SendingPacketData <= SendingPacket;
    reg [2:0] idlecount; always @(posedge clk20) if(SendingPacketData) idlecount<=0; else if(~&idlecount) idlecount<=idlecount+1;
    wire dataout = CRCflush ? ~CRC[31] : ShiftData[0];

    reg qo; always @(posedge clk20) qo <= SendingPacketData ? ~dataout^ShiftCount[0] : 1;
    reg qoe; always @(posedge clk20) qoe <= SendingPacketData | LinkPulse | (idlecount<6);

    reg reg_TDp, reg_TDm;
    always @(posedge clk20) begin
        reg_TDp <= (qoe ?  qo : 1'b0);
        reg_TDm <= (qoe ? ~qo : 1'b0);
    end

    assign Ethernet_TDp = reg_TDp;
    assign Ethernet_TDm = reg_TDm;

endmodule
