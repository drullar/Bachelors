//  (c) Cologne Chip AG
//  FPGA Verilog netlist writer     Version: Version 4.2 (1 January 2025)
//  Compile Time: 2025-06-13 09:36:44
//  Program Run:  2025-08-18 21:57:48
//  Program Call: D:\Documents\NBU\Bachelors\docs\manufacturer\cc-toolchain-win\bin\p_r\p_r.exe -i net/blink_synth.v -o blink -ccf src/blink.ccf -cCP 
//  File Type:    Verilog

// Gatecount:     36
module blink (clk ,
       tx 
       ) ;

input  clk;

output tx;



wire tx;
wire clk;
wire na1_1;
wire na1_1_i;
wire na2_1;
wire na2_1_i;
wire na2_2;
wire na2_2_i;
wire na3_1;
wire na3_1_i;
wire na3_2;
wire na3_2_i;
wire na4_1;
wire na5_1;
wire na5_1_i;
wire na7_2;
wire na7_2_i;
wire na9_1;
wire na9_1_i;
wire na9_2;
wire na9_2_i;
wire na11_1;
wire na11_1_i;
wire na11_2;
wire na11_2_i;
wire na12_1;
wire na12_1_i;
wire na14_1;
wire na14_1_i;
wire na14_2;
wire na14_2_i;
wire na15_1;
wire na15_1_i;
wire na15_2;
wire na15_2_i;
wire na17_2;
wire na18_2;
wire na19_1;
wire na23_1;
wire na23_2;
wire na23_4;
wire na25_1;
wire na25_2;
wire na25_4;
wire na27_1;
wire na27_2;
wire na27_4;
wire na29_1;
wire na29_2;
wire na29_4;
wire na31_1;
wire na31_2;
wire na32_1;
wire na32_4;
wire na33_1;
wire na33_2;
wire na35_1;
wire na35_4;
wire na36_4;
wire na38_4;
wire na40_4;
wire na43_1;
wire na55_2;
wire na55_2_i;
wire na60_1;
wire na62_2;
wire na63_1;
wire na63_4;
wire na64_1;
wire na68_1;
wire na76_1;
wire na77_1;
wire na78_2;
wire na79_2;
wire na80_2;
wire na78_10;

// C_AND/D///      x70y113     80'h00_FE00_00_0000_0C88_1AFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a1_1 ( .OUT(na1_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na23_1), .IN6(1'b1), .IN7(~na62_2), .IN8(~na64_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a1_2 ( .OUT(na1_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na1_1_i) );
// C_AND/D//AND/D      x67y114     80'h00_FE00_80_0000_0C88_1A13
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_1 ( .OUT(na2_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na23_2), .IN6(1'b1), .IN7(~na62_2), .IN8(~na64_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_2 ( .OUT(na2_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a2_4 ( .OUT(na2_2_i), .IN1(1'b1), .IN2(~na2_2), .IN3(~na62_2), .IN4(~na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a2_5 ( .OUT(na2_2), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_2_i) );
// C_AND/D//AND/D      x67y120     80'h00_FE00_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a3_1 ( .OUT(na3_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na31_2), .IN6(1'b1), .IN7(~na62_2), .IN8(~na64_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a3_2 ( .OUT(na3_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na3_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a3_4 ( .OUT(na3_2_i), .IN1(na31_1), .IN2(1'b1), .IN3(~na62_2), .IN4(~na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a3_5 ( .OUT(na3_2), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na3_2_i) );
CLKIN      #(.CLKIN_CFG (32'h0000_0000)) 
           _a4 ( .PCLK0(na4_1), .PCLK1(_d0), .PCLK2(_d1), .PCLK3(_d2), .CLK0(na60_1), .CLK1(1'b0), .CLK2(1'b0), .CLK3(1'b0), .SER_CLK(1'b0),
                 .SPI_CLK(1'b0), .JTAG_CLK(1'b0) );
// C_MX4b/D///      x70y124     80'h00_FE00_00_0040_0A8E_00C3
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a5_1 ( .OUT(na5_1_i), .IN1(1'b1), .IN2(~na55_2), .IN3(1'b1), .IN4(na79_2), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(~na9_2),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a5_2 ( .OUT(na5_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na5_1_i) );
// C_///XOR/D      x71y121     80'h00_FA00_80_0000_0C06_FF06
C_XOR      #(.CPE_CFG (9'b0_1000_0000)) 
           _a7_4 ( .OUT(na7_2_i), .IN1(na7_2), .IN2(na55_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a7_5 ( .OUT(na7_2), .CLK(na43_1), .EN(na19_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na7_2_i) );
// C_AND/D//AND/D      x68y124     80'h00_FA00_80_0000_0C88_A333
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a9_1 ( .OUT(na9_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na68_1), .IN7(na33_2), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a9_2 ( .OUT(na9_1), .CLK(na43_1), .EN(na17_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na9_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a9_4 ( .OUT(na9_2_i), .IN1(1'b1), .IN2(~na68_1), .IN3(1'b1), .IN4(~na9_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a9_5 ( .OUT(na9_2), .CLK(na43_1), .EN(na17_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na9_2_i) );
// C_AND/D//AND/D      x70y118     80'h00_FE00_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a11_1 ( .OUT(na11_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na25_2), .IN7(~na62_2), .IN8(~na64_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a11_2 ( .OUT(na11_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na11_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a11_4 ( .OUT(na11_2_i), .IN1(1'b1), .IN2(na25_1), .IN3(~na62_2), .IN4(~na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a11_5 ( .OUT(na11_2), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na11_2_i) );
// C_AND/D///      x67y121     80'h00_FA00_00_0000_0C88_A3FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_1 ( .OUT(na12_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na68_1), .IN7(na33_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_2 ( .OUT(na12_1), .CLK(na43_1), .EN(na17_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_1_i) );
// C_AND/D//AND/D      x67y118     80'h00_FE00_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_1 ( .OUT(na14_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na29_2), .IN7(~na62_2), .IN8(~na64_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_2 ( .OUT(na14_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a14_4 ( .OUT(na14_2_i), .IN1(1'b1), .IN2(na29_1), .IN3(~na62_2), .IN4(~na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a14_5 ( .OUT(na14_2), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_2_i) );
// C_AND/D//AND/D      x67y115     80'h00_FE00_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_1 ( .OUT(na15_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na27_2), .IN6(1'b1), .IN7(~na62_2), .IN8(~na64_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_2 ( .OUT(na15_1), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a15_4 ( .OUT(na15_2_i), .IN1(na27_1), .IN2(1'b1), .IN3(~na62_2), .IN4(~na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a15_5 ( .OUT(na15_2), .CLK(na43_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_2_i) );
// C_///AND/      x67y121     80'h00_0060_00_0000_0C08_FFCA
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a17_4 ( .OUT(na17_2), .IN1(na76_1), .IN2(1'b1), .IN3(1'b1), .IN4(na64_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x68y122     80'h00_0060_00_0000_0C08_FF8A
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a18_4 ( .OUT(na18_2), .IN1(na12_1), .IN2(1'b1), .IN3(na80_2), .IN4(na9_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x69y121     80'h00_0018_00_0040_0A6E_00C5
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a19_1 ( .OUT(na19_1), .IN1(~na7_2), .IN2(1'b1), .IN3(1'b1), .IN4(na64_1), .IN5(1'b0), .IN6(~na55_2), .IN7(~na77_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y115     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a23_1 ( .OUT(na23_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na2_2), .IN7(na1_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na32_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a23_4 ( .OUT(na23_2), .COUTY1(na23_4), .IN1(1'b1), .IN2(na2_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na2_2), .IN7(na1_1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na32_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y116     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a25_1 ( .OUT(na25_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na11_2),
                    .CINX(1'b0), .CINY1(na23_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a25_4 ( .OUT(na25_2), .COUTY1(na25_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na11_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                    .IN8(na11_2), .CINX(1'b0), .CINY1(na23_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y117     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a27_1 ( .OUT(na27_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na15_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na25_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a27_4 ( .OUT(na27_2), .COUTY1(na27_4), .IN1(na15_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na15_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na25_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y118     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a29_1 ( .OUT(na29_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na14_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na27_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a29_4 ( .OUT(na29_2), .COUTY1(na29_4), .IN1(1'b1), .IN2(na14_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na14_2), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na27_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y119     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a31_1 ( .OUT(na31_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na3_2), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                    .CINY1(na29_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a31_4 ( .OUT(na31_2), .IN1(1'b1), .IN2(na3_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na3_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na29_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x69y114     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a32_2 ( .OUT(na32_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a32_6 ( .COUTY1(na32_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na32_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x68y123     80'h00_0078_00_0020_0C66_CAC0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a33_1 ( .OUT(na33_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na12_1), .IN6(1'b1), .IN7(1'b1), .IN8(na9_2),
                    .CINX(1'b0), .CINY1(na35_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a33_4 ( .OUT(na33_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na9_1), .IN5(na12_1), .IN6(1'b1), .IN7(1'b1), .IN8(na9_2),
                    .CINX(1'b0), .CINY1(na35_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x68y122     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a35_2 ( .OUT(na35_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a35_6 ( .COUTY1(na35_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na35_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x68y117     80'h00_0078_00_0020_0C66_CAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a36_1 ( .OUT(na36_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na15_2), .IN6(1'b1), .IN7(1'b1), .IN8(na11_1),
                    .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a36_4 ( .OUT(na36_2), .COUTY1(na36_4), .IN1(na15_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na15_2), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na11_1), .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y118     80'h00_0078_00_0020_0C66_FCFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a38_1 ( .OUT(na38_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na14_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na36_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a38_4 ( .OUT(na38_2), .COUTY1(na38_4), .IN1(1'b1), .IN2(na14_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na14_2), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na36_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y119     80'h00_0078_00_0020_0C66_FC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a40_1 ( .OUT(na40_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na3_2), .IN7(1'b1), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na38_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a40_4 ( .OUT(na40_2), .COUTY1(na40_4), .IN1(1'b1), .IN2(na3_1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b1), .IN6(na3_2), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na38_4), .PINX(1'b0), .PINY1(1'b0) );
GLBOUT     #(.GLBOUT_CFG (64'h0000_0000_0000_0010)) 
           _a43 ( .GLB0(na43_1), .GLB1(_d3), .GLB2(_d4), .GLB3(_d5), .CLK_FB0(_d6), .CLK_FB1(_d7), .CLK_FB2(_d8), .CLK_FB3(_d9), .CLK0_0(1'b0),
                  .CLK0_90(1'b0), .CLK0_180(1'b0), .CLK0_270(1'b0), .CLK0_BYP(na4_1), .CLK1_0(1'b0), .CLK1_90(1'b0), .CLK1_180(1'b0),
                  .CLK1_270(1'b0), .CLK1_BYP(1'b0), .CLK2_0(1'b0), .CLK2_90(1'b0), .CLK2_180(1'b0), .CLK2_270(1'b0), .CLK2_BYP(1'b0),
                  .CLK3_0(1'b0), .CLK3_90(1'b0), .CLK3_180(1'b0), .CLK3_270(1'b0), .CLK3_BYP(1'b0), .USR_GLB0(1'b0), .USR_GLB1(1'b0),
                  .USR_GLB2(1'b0), .USR_GLB3(1'b0), .USR_FB0(1'b0), .USR_FB1(1'b0), .USR_FB2(1'b0), .USR_FB3(1'b0) );
// C_///AND/D      x69y122     80'h00_FA00_80_0000_0C08_FFF3
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a55_4 ( .OUT(na55_2_i), .IN1(1'b1), .IN2(~na55_2), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a55_5 ( .OUT(na55_2), .CLK(na43_1), .EN(na19_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na55_2_i) );
CPE_IBF    #(.BUF_CFG (72'h000001000000000090)) 
           _a60 ( .Y(na60_1), .I(clk) );
CPE_OBF    #(.BUF_CFG (72'h000000000100010902)) 
           _a61 ( .O(tx), .A(na78_10) );
// C_///AND/      x70y119     80'h00_0060_00_0000_0C08_FFF1
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a62_4 ( .OUT(na62_2), .IN1(~na7_2), .IN2(~na55_2), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x68y116     80'h00_3F00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a63_2 ( .OUT(na63_1), .CLK(1'b1), .EN(1'b0), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a63_6 ( .COUTY1(na63_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na63_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_Route1////      x68y120     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a64_1 ( .OUT(na64_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                    .CINY1(na40_4), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x69y124     80'h00_0018_00_0000_0C88_F4FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a68_1 ( .OUT(na68_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na7_2), .IN6(na55_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x69y123     80'h00_0018_00_0040_0A89_00C3
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a76_1 ( .OUT(na76_1), .IN1(1'b1), .IN2(~na55_2), .IN3(1'b1), .IN4(na79_2), .IN5(1'b1), .IN6(1'b0), .IN7(1'b0), .IN8(~na18_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x70y121     80'h00_0018_00_0000_0C88_33FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a77_1 ( .OUT(na77_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na55_2), .IN7(1'b1), .IN8(~na18_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x103y128     80'h08_0060_00_0000_0C08_FFCF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a78_4 ( .OUT(na78_2), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na5_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_CPlines  #(.CPE_CFG (19'h0_0000)) 
           _a78_6 ( .RAM_O2(na78_10), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(1'b0),
                    .OUT2(na78_2), .COMP_OUT(1'b0) );
// C_////Bridge      x72y124     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a79_5 ( .OUT(na79_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na7_2), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x68y121     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a80_5 ( .OUT(na80_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na9_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
endmodule
