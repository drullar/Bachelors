//  (c) Cologne Chip AG
//  FPGA Verilog netlist writer     Version: Version 4.2 (1 January 2025)
//  Compile Time: 2025-06-13 09:36:44
//  Program Run:  2025-08-11 22:36:26
//  Program Call: C:\Users\anton\Documents\NBU\Bachelors\docs\manufacturer\cc-toolchain-win\bin\p_r\p_r.exe -i net/blink_synth.v -o blink -ccf src/blink.ccf -cCP 
//  File Type:    Verilog

// Gatecount:     93
module blink (clk ,
       tx 
       ) ;

input  clk;

output tx;



wire tx;
wire clk;
wire na1_1;
wire na2_1;
wire na2_1_i;
wire na2_2;
wire na2_2_i;
wire na4_1;
wire na4_1_i;
wire na4_2;
wire na4_2_i;
wire na6_1;
wire na6_1_i;
wire na6_2;
wire na6_2_i;
wire na7_1;
wire na7_1_i;
wire na8_1;
wire na8_1_i;
wire na10_1;
wire na10_1_i;
wire na10_2;
wire na10_2_i;
wire na12_1;
wire na12_1_i;
wire na12_2;
wire na12_2_i;
wire na13_2;
wire na13_2_i;
wire na14_1;
wire na14_2;
wire na15_2;
wire na16_1;
wire na16_1_i;
wire na16_2;
wire na16_2_i;
wire na17_1;
wire na17_1_i;
wire na17_2;
wire na17_2_i;
wire na19_1;
wire na19_1_i;
wire na21_1;
wire na21_1_i;
wire na21_2;
wire na21_2_i;
wire na23_1;
wire na23_1_i;
wire na23_2;
wire na23_2_i;
wire na25_2;
wire na25_2_i;
wire na27_1;
wire na27_1_i;
wire na28_1;
wire na28_1_i;
wire na28_2;
wire na28_2_i;
wire na29_1;
wire na29_1_i;
wire na29_2;
wire na29_2_i;
wire na30_1;
wire na31_1;
wire na33_2;
wire na34_1;
wire na35_1;
wire na38_2;
wire na38_2_i;
wire na39_1;
wire na39_2;
wire na41_1;
wire na41_1_i;
wire na41_2;
wire na41_2_i;
wire na44_1;
wire na44_1_i;
wire na44_2;
wire na44_2_i;
wire na45_2;
wire na46_1;
wire na46_1_i;
wire na46_2;
wire na46_2_i;
wire na47_2;
wire na51_1;
wire na51_1_i;
wire na51_2;
wire na51_2_i;
wire na52_1;
wire na52_1_i;
wire na52_2;
wire na52_2_i;
wire na54_1;
wire na54_1_i;
wire na54_2;
wire na54_2_i;
wire na56_1;
wire na56_1_i;
wire na56_2;
wire na56_2_i;
wire na59_4;
wire na61_4;
wire na63_4;
wire na65_4;
wire na67_4;
wire na68_4;
wire na70_4;
wire na72_4;
wire na74_4;
wire na76_4;
wire na78_4;
wire na80_4;
wire na81_1;
wire na81_4;
wire na83_4;
wire na85_4;
wire na86_4;
wire na88_4;
wire na90_4;
wire na92_4;
wire na94_4;
wire na95_1;
wire na95_4;
wire na97_1;
wire na97_2;
wire na97_4;
wire na99_1;
wire na100_1;
wire na100_2;
wire na100_4;
wire na102_1;
wire na102_2;
wire na102_4;
wire na104_1;
wire na104_2;
wire na104_4;
wire na106_1;
wire na106_2;
wire na106_4;
wire na108_1;
wire na108_2;
wire na108_4;
wire na109_1;
wire na109_4;
wire na110_1;
wire na110_2;
wire na112_1;
wire na112_4;
wire na114_1;
wire na114_2;
wire na114_4;
wire na116_1;
wire na116_2;
wire na116_4;
wire na118_1;
wire na118_2;
wire na118_4;
wire na120_1;
wire na120_2;
wire na120_4;
wire na122_1;
wire na122_2;
wire na122_4;
wire na123_1;
wire na123_2;
wire na123_4;
wire na125_1;
wire na125_2;
wire na125_4;
wire na127_1;
wire na129_1;
wire na129_2;
wire na129_4;
wire na131_1;
wire na131_2;
wire na131_4;
wire na133_1;
wire na133_2;
wire na133_4;
wire na135_1;
wire na135_2;
wire na135_4;
wire na137_1;
wire na182_1;
wire na184_1;
wire na186_2;
wire na187_1;
wire na187_4;
wire na190_1;
wire na191_1;
wire na192_1;
wire na193_2;
wire na194_2;
wire na195_2;
wire na196_2;
wire na197_2;
wire na198_2;
wire na199_2;
wire na193_10;

CLKIN      #(.CLKIN_CFG (32'h0000_0000)) 
           _a1 ( .PCLK0(na1_1), .PCLK1(_d0), .PCLK2(_d1), .PCLK3(_d2), .CLK0(na182_1), .CLK1(1'b0), .CLK2(1'b0), .CLK3(1'b0), .SER_CLK(1'b0),
                 .SPI_CLK(1'b0), .JTAG_CLK(1'b0) );
// C_AND/D//AND/D      x70y115     80'h00_FA00_80_0000_0C88_3C3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_1 ( .OUT(na2_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na118_2), .IN7(1'b1), .IN8(~na39_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_2 ( .OUT(na2_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a2_4 ( .OUT(na2_2_i), .IN1(1'b1), .IN2(na118_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a2_5 ( .OUT(na2_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_2_i) );
// C_AND/D//AND/D      x70y114     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a4_1 ( .OUT(na4_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na116_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a4_2 ( .OUT(na4_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na4_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a4_4 ( .OUT(na4_2_i), .IN1(na116_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a4_5 ( .OUT(na4_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na4_2_i) );
// C_AND/D//AND/D      x72y113     80'h00_FA00_80_0000_0C88_3C3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a6_1 ( .OUT(na6_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na114_2), .IN7(1'b1), .IN8(~na39_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a6_2 ( .OUT(na6_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na6_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a6_4 ( .OUT(na6_2_i), .IN1(1'b1), .IN2(na114_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a6_5 ( .OUT(na6_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na6_2_i) );
// C_MX4a/D///      x71y120     80'h00_F600_00_0040_0CDF_CA00
C_MX4a     #(.CPE_CFG (9'b0_0000_0000)) 
           _a7_1 ( .OUT(na7_1_i), .IN1(~na184_1), .IN2(na14_2), .IN3(~na44_2), .IN4(~na197_2), .IN5(na13_2), .IN6(1'b1), .IN7(1'b1),
                   .IN8(na39_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a7_2 ( .OUT(na7_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na7_1_i) );
// C_AND/D///      x71y126     80'h00_FA00_00_0000_0C88_F2FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_1 ( .OUT(na8_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na110_1), .IN6(~na45_2), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_2 ( .OUT(na8_1), .CLK(na137_1), .EN(na35_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na8_1_i) );
// C_AND/D//AND/D      x70y112     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a10_1 ( .OUT(na10_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na135_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a10_2 ( .OUT(na10_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na10_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a10_4 ( .OUT(na10_2_i), .IN1(na135_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a10_5 ( .OUT(na10_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na10_2_i) );
// C_AND/D//AND/D      x70y110     80'h00_FA00_80_0000_0C88_3C3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_1 ( .OUT(na12_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na133_2), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_2 ( .OUT(na12_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a12_4 ( .OUT(na12_2_i), .IN1(1'b1), .IN2(na133_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a12_5 ( .OUT(na12_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_2_i) );
// C_///AND/D      x71y119     80'h00_FA00_80_0000_0C08_FF35
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a13_4 ( .OUT(na13_2_i), .IN1(~na13_2), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a13_5 ( .OUT(na13_2), .CLK(na137_1), .EN(na30_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na13_2_i) );
// C_AND*////D      x73y122     80'h00_FA18_00_0000_0788_F35F
C_AND      #(.CPE_CFG (9'b1_0000_0000)) 
           _a14_1 ( .OUT(na14_1), .IN1(1'b1), .IN2(1'b1), .IN3(~na15_2), .IN4(1'b1), .IN5(1'b1), .IN6(~na45_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_5 ( .OUT(na14_2), .CLK(na137_1), .EN(na30_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_1) );
// C_///AND/      x72y115     80'h00_0060_00_0000_0C08_FF34
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a15_4 ( .OUT(na15_2), .IN1(~na13_2), .IN2(na14_2), .IN3(1'b1), .IN4(~na39_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x71y110     80'h00_FA00_80_0000_0C88_3C3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_1 ( .OUT(na16_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na129_2), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_2 ( .OUT(na16_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a16_4 ( .OUT(na16_2_i), .IN1(1'b1), .IN2(na129_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a16_5 ( .OUT(na16_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_2_i) );
// C_AND/D//AND/D      x73y110     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a17_1 ( .OUT(na17_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na123_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a17_2 ( .OUT(na17_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na17_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a17_4 ( .OUT(na17_2_i), .IN1(na123_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a17_5 ( .OUT(na17_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na17_2_i) );
// C_AND/D///      x70y111     80'h00_FA00_00_0000_0C88_1FFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a19_1 ( .OUT(na19_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(~na19_1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a19_2 ( .OUT(na19_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na19_1_i) );
// C_AND/D//AND/D      x69y122     80'h00_F600_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_1 ( .OUT(na21_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na102_2), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_2 ( .OUT(na21_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na21_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a21_4 ( .OUT(na21_2_i), .IN1(1'b1), .IN2(na102_1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a21_5 ( .OUT(na21_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na21_2_i) );
// C_AND/D//AND/D      x66y115     80'h00_F600_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a23_1 ( .OUT(na23_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na100_2), .IN6(1'b1), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a23_2 ( .OUT(na23_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na23_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a23_4 ( .OUT(na23_2_i), .IN1(na100_1), .IN2(1'b1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a23_5 ( .OUT(na23_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na23_2_i) );
// C_///AND/D      x67y117     80'h00_F600_80_0000_0C08_FFA5
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a25_4 ( .OUT(na25_2_i), .IN1(~na25_2), .IN2(1'b1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a25_5 ( .OUT(na25_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na25_2_i) );
// C_AND/D///      x68y125     80'h00_F600_00_0000_0C88_AAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a27_1 ( .OUT(na27_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na99_1), .IN6(1'b1), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a27_2 ( .OUT(na27_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na27_1_i) );
// C_AND/D//AND/D      x69y123     80'h00_F600_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a28_1 ( .OUT(na28_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na104_2), .IN6(1'b1), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a28_2 ( .OUT(na28_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na28_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a28_4 ( .OUT(na28_2_i), .IN1(na104_1), .IN2(1'b1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a28_5 ( .OUT(na28_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na28_2_i) );
// C_AND/D//AND/D      x69y125     80'h00_F600_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a29_1 ( .OUT(na29_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na97_2), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a29_2 ( .OUT(na29_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na29_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a29_4 ( .OUT(na29_2_i), .IN1(1'b1), .IN2(na97_1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a29_5 ( .OUT(na29_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na29_2_i) );
// C_ORAND////      x71y116     80'h00_0018_00_0000_0888_BB55
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a30_1 ( .OUT(na30_1), .IN1(~na31_1), .IN2(1'b0), .IN3(~na33_2), .IN4(1'b0), .IN5(na198_2), .IN6(~na14_1), .IN7(na192_1),
                    .IN8(~na39_1), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x71y117     80'h00_0018_00_0000_0C88_44FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a31_1 ( .OUT(na31_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na13_2), .IN6(na14_2), .IN7(~na195_2), .IN8(na186_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x72y117     80'h00_0060_00_0000_0C08_FF41
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a33_4 ( .OUT(na33_2), .IN1(~na13_2), .IN2(~na14_2), .IN3(~na191_1), .IN4(na39_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX2b////      x67y114     80'h00_0018_00_0040_0A50_00C0
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a34_1 ( .OUT(na34_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na39_1), .IN5(na194_2), .IN6(1'b0), .IN7(na192_1), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x72y124     80'h00_0018_00_0000_0C88_AEFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a35_1 ( .OUT(na35_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na31_1), .IN6(na45_2), .IN7(na192_1), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/D      x73y119     80'h00_FA00_80_0000_0C08_FF3C
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a38_4 ( .OUT(na38_2_i), .IN1(1'b1), .IN2(na127_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a38_5 ( .OUT(na38_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na38_2_i) );
// C_AND////D      x72y118     80'h00_FA18_00_0000_0888_FA3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_1 ( .OUT(na39_1), .IN1(1'b1), .IN2(na14_2), .IN3(1'b1), .IN4(~na39_2), .IN5(na13_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_5 ( .OUT(na39_2), .CLK(na137_1), .EN(na30_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na39_1) );
// C_AND/D//AND/D      x70y113     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_1 ( .OUT(na41_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na131_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_2 ( .OUT(na41_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a41_4 ( .OUT(na41_2_i), .IN1(na131_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a41_5 ( .OUT(na41_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_2_i) );
// C_AND/D//AND/D      x72y121     80'h00_FA00_80_0000_0C88_F253
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a44_1 ( .OUT(na44_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na110_2), .IN6(~na45_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a44_2 ( .OUT(na44_1), .CLK(na137_1), .EN(na35_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na44_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a44_4 ( .OUT(na44_2_i), .IN1(1'b1), .IN2(~na45_2), .IN3(~na44_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a44_5 ( .OUT(na44_2), .CLK(na137_1), .EN(na35_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na44_2_i) );
// C_///AND/      x71y122     80'h00_0060_00_0000_0C08_FF32
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a45_4 ( .OUT(na45_2), .IN1(na13_2), .IN2(~na14_2), .IN3(1'b1), .IN4(~na39_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x69y124     80'h00_F600_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a46_1 ( .OUT(na46_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na108_2), .IN6(1'b1), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a46_2 ( .OUT(na46_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na46_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a46_4 ( .OUT(na46_2_i), .IN1(na108_1), .IN2(1'b1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a46_5 ( .OUT(na46_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na46_2_i) );
// C_///AND/      x68y121     80'h00_0060_00_0000_0C08_FFA3
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a47_4 ( .OUT(na47_2), .IN1(1'b1), .IN2(~na199_2), .IN3(na190_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x68y124     80'h00_F600_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a51_1 ( .OUT(na51_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na106_2), .IN7(na47_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a51_2 ( .OUT(na51_1), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na51_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a51_4 ( .OUT(na51_2_i), .IN1(1'b1), .IN2(na106_1), .IN3(na47_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a51_5 ( .OUT(na51_2), .CLK(na137_1), .EN(~na39_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na51_2_i) );
// C_AND/D//AND/D      x69y121     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a52_1 ( .OUT(na52_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na125_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a52_2 ( .OUT(na52_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na52_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a52_4 ( .OUT(na52_2_i), .IN1(na125_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a52_5 ( .OUT(na52_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na52_2_i) );
// C_AND/D//AND/D      x72y120     80'h00_FA00_80_0000_0C88_3C3C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a54_1 ( .OUT(na54_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na122_2), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a54_2 ( .OUT(na54_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na54_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a54_4 ( .OUT(na54_2_i), .IN1(1'b1), .IN2(na122_1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a54_5 ( .OUT(na54_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na54_2_i) );
// C_AND/D//AND/D      x70y116     80'h00_FA00_80_0000_0C88_3A3A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a56_1 ( .OUT(na56_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na120_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a56_2 ( .OUT(na56_1), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na56_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a56_4 ( .OUT(na56_2_i), .IN1(na120_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a56_5 ( .OUT(na56_2), .CLK(na137_1), .EN(na34_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na56_2_i) );
// C_ADDF2///ADDF2/      x68y114     80'h00_0078_00_0020_0C66_AFA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a59_1 ( .OUT(na59_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(na6_2), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na80_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a59_4 ( .OUT(na59_2), .COUTY1(na59_4), .IN1(1'b0), .IN2(1'b1), .IN3(na6_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na6_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na80_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y115     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a61_1 ( .OUT(na61_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na4_2), .CINX(1'b0),
                    .CINY1(na59_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a61_4 ( .OUT(na61_2), .COUTY1(na61_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na4_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na4_2), .CINX(1'b0), .CINY1(na59_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y116     80'h00_0078_00_0020_0C66_A0AF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a63_1 ( .OUT(na63_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(na2_2), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na61_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a63_4 ( .OUT(na63_2), .COUTY1(na63_4), .IN1(1'b1), .IN2(1'b1), .IN3(na2_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b1), .IN7(na2_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na61_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y117     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a65_1 ( .OUT(na65_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na56_2),
                    .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a65_4 ( .OUT(na65_2), .COUTY1(na65_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na56_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na56_2), .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y118     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a67_1 ( .OUT(na67_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na54_2),
                    .CINX(1'b0), .CINY1(na65_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a67_4 ( .OUT(na67_2), .COUTY1(na67_4), .IN1(1'b0), .IN2(1'b1), .IN3(1'b1), .IN4(na54_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na54_2), .CINX(1'b0), .CINY1(na65_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y109     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a68_1 ( .OUT(na68_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na17_2), .IN7(na19_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na81_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a68_4 ( .OUT(na68_2), .COUTY1(na68_4), .IN1(1'b1), .IN2(na17_1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b1), .IN6(na17_2), .IN7(na19_1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na81_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y119     80'h00_0078_00_0020_0C66_FAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a70_1 ( .OUT(na70_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na52_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na67_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a70_4 ( .OUT(na70_2), .COUTY1(na70_4), .IN1(na52_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na52_2), .IN6(1'b1), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na67_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x68y120     80'h00_0018_00_0010_0666_000A
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a72_1 ( .OUT(na72_1), .COUTY1(na72_4), .IN1(na38_2), .IN2(1'b1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na70_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y110     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a74_1 ( .OUT(na74_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na68_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a74_4 ( .OUT(na74_2), .COUTY1(na74_4), .IN1(1'b1), .IN2(na16_1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na68_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y111     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a76_1 ( .OUT(na76_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(na41_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na74_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a76_4 ( .OUT(na76_2), .COUTY1(na76_4), .IN1(1'b0), .IN2(1'b1), .IN3(na41_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b1), .IN7(na41_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na74_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y112     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a78_1 ( .OUT(na78_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na12_2),
                    .CINX(1'b0), .CINY1(na76_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a78_4 ( .OUT(na78_2), .COUTY1(na78_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na12_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na12_2), .CINX(1'b0), .CINY1(na76_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y113     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a80_1 ( .OUT(na80_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na10_2),
                    .CINX(1'b0), .CINY1(na78_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a80_4 ( .OUT(na80_2), .COUTY1(na80_4), .IN1(1'b0), .IN2(1'b1), .IN3(1'b1), .IN4(na10_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na10_2), .CINX(1'b0), .CINY1(na78_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x68y108     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a81_2 ( .OUT(na81_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a81_6 ( .COUTY1(na81_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na81_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x70y123     80'h00_0078_00_0020_0C66_0AFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a83_1 ( .OUT(na83_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na29_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na94_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a83_4 ( .OUT(na83_2), .COUTY1(na83_4), .IN1(na29_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na29_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na94_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x70y124     80'h00_0018_00_0010_0666_00A0
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a85_1 ( .OUT(na85_1), .COUTY1(na85_4), .IN1(1'b0), .IN2(1'b1), .IN3(na27_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na83_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y118     80'h00_0078_00_0020_0C66_AAA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a86_1 ( .OUT(na86_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na25_2), .IN6(1'b1), .IN7(na23_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na95_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a86_4 ( .OUT(na86_2), .COUTY1(na86_4), .IN1(1'b0), .IN2(1'b1), .IN3(na23_1), .IN4(1'b1), .IN5(na25_2), .IN6(1'b1), .IN7(na23_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na95_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y119     80'h00_0078_00_0020_0C66_0CFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a88_1 ( .OUT(na88_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na21_2), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na86_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a88_4 ( .OUT(na88_2), .COUTY1(na88_4), .IN1(1'b1), .IN2(na21_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na21_2), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na86_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y120     80'h00_0078_00_0020_0C66_0AFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a90_1 ( .OUT(na90_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na28_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na88_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a90_4 ( .OUT(na90_2), .COUTY1(na90_4), .IN1(na28_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na28_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na88_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y121     80'h00_0078_00_0020_0C66_C0CF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a92_1 ( .OUT(na92_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na51_2),
                    .CINX(1'b0), .CINY1(na90_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a92_4 ( .OUT(na92_2), .COUTY1(na92_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na51_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na51_2), .CINX(1'b0), .CINY1(na90_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y122     80'h00_0078_00_0020_0C66_FCFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a94_1 ( .OUT(na94_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na46_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na92_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a94_4 ( .OUT(na94_2), .COUTY1(na94_4), .IN1(1'b1), .IN2(na46_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na46_2), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na92_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y117     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a95_2 ( .OUT(na95_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a95_6 ( .COUTY1(na95_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na95_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x67y124     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a97_1 ( .OUT(na97_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na29_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na108_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a97_4 ( .OUT(na97_2), .COUTY1(na97_4), .IN1(na29_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na29_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na108_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x67y125     80'h00_0018_00_0010_0666_00A0
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a99_1 ( .OUT(na99_1), .IN1(1'b0), .IN2(1'b0), .IN3(na27_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na97_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y119     80'h00_0078_00_0020_0C66_AAA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a100_1 ( .OUT(na100_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na25_2), .IN6(1'b1), .IN7(na23_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na109_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a100_4 ( .OUT(na100_2), .COUTY1(na100_4), .IN1(1'b0), .IN2(1'b0), .IN3(na23_1), .IN4(1'b1), .IN5(na25_2), .IN6(1'b1), .IN7(na23_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na109_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y120     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a102_1 ( .OUT(na102_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na21_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a102_4 ( .OUT(na102_2), .COUTY1(na102_4), .IN1(1'b1), .IN2(na21_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na21_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y121     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a104_1 ( .OUT(na104_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na28_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a104_4 ( .OUT(na104_2), .COUTY1(na104_4), .IN1(na28_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na28_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y122     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a106_1 ( .OUT(na106_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na51_2),
                     .CINX(1'b0), .CINY1(na104_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a106_4 ( .OUT(na106_2), .COUTY1(na106_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na51_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na51_2), .CINX(1'b0), .CINY1(na104_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y123     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a108_1 ( .OUT(na108_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na46_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na106_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a108_4 ( .OUT(na108_2), .COUTY1(na108_4), .IN1(1'b1), .IN2(na46_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na46_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na106_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x67y118     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a109_2 ( .OUT(na109_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a109_6 ( .COUTY1(na109_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na109_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x71y123     80'h00_0078_00_0020_0C66_ACA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a110_1 ( .OUT(na110_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na8_1), .IN7(na44_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na112_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a110_4 ( .OUT(na110_2), .IN1(1'b0), .IN2(1'b0), .IN3(na44_1), .IN4(1'b1), .IN5(1'b1), .IN6(na8_1), .IN7(na44_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na112_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x71y122     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a112_2 ( .OUT(na112_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a112_6 ( .COUTY1(na112_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na112_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x69y114     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a114_1 ( .OUT(na114_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na6_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na135_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a114_4 ( .OUT(na114_2), .COUTY1(na114_4), .IN1(1'b0), .IN2(1'b0), .IN3(na6_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na6_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na135_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y115     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a116_1 ( .OUT(na116_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na4_2),
                     .CINX(1'b0), .CINY1(na114_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a116_4 ( .OUT(na116_2), .COUTY1(na116_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na4_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na4_2), .CINX(1'b0), .CINY1(na114_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y116     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a118_1 ( .OUT(na118_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na2_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na116_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a118_4 ( .OUT(na118_2), .COUTY1(na118_4), .IN1(1'b0), .IN2(1'b0), .IN3(na2_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na2_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na116_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y117     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a120_1 ( .OUT(na120_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na56_2),
                     .CINX(1'b0), .CINY1(na118_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a120_4 ( .OUT(na120_2), .COUTY1(na120_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na56_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na56_2), .CINX(1'b0), .CINY1(na118_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y118     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a122_1 ( .OUT(na122_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na54_2),
                     .CINX(1'b0), .CINY1(na120_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a122_4 ( .OUT(na122_2), .COUTY1(na122_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na54_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na54_2), .CINX(1'b0), .CINY1(na120_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y109     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a123_1 ( .OUT(na123_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na17_2), .IN7(na19_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na187_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a123_4 ( .OUT(na123_2), .COUTY1(na123_4), .IN1(1'b1), .IN2(na17_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na17_2), .IN7(na19_1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na187_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y119     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a125_1 ( .OUT(na125_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na52_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na122_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a125_4 ( .OUT(na125_2), .COUTY1(na125_4), .IN1(na52_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na52_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na122_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x69y120     80'h00_0018_00_0010_0666_000A
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a127_1 ( .OUT(na127_1), .IN1(na38_2), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na125_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y110     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a129_1 ( .OUT(na129_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na123_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a129_4 ( .OUT(na129_2), .COUTY1(na129_4), .IN1(1'b1), .IN2(na16_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na123_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y111     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a131_1 ( .OUT(na131_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na41_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a131_4 ( .OUT(na131_2), .COUTY1(na131_4), .IN1(1'b0), .IN2(1'b0), .IN3(na41_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na41_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y112     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a133_1 ( .OUT(na133_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na12_2),
                     .CINX(1'b0), .CINY1(na131_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a133_4 ( .OUT(na133_2), .COUTY1(na133_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na12_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na12_2), .CINX(1'b0), .CINY1(na131_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y113     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a135_1 ( .OUT(na135_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na10_2),
                     .CINX(1'b0), .CINY1(na133_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a135_4 ( .OUT(na135_2), .COUTY1(na135_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na10_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na10_2), .CINX(1'b0), .CINY1(na133_4), .PINX(1'b0), .PINY1(1'b0) );
GLBOUT     #(.GLBOUT_CFG (64'h0000_0000_0000_0010)) 
           _a137 ( .GLB0(na137_1), .GLB1(_d3), .GLB2(_d4), .GLB3(_d5), .CLK_FB0(_d6), .CLK_FB1(_d7), .CLK_FB2(_d8), .CLK_FB3(_d9),
                   .CLK0_0(1'b0), .CLK0_90(1'b0), .CLK0_180(1'b0), .CLK0_270(1'b0), .CLK0_BYP(na1_1), .CLK1_0(1'b0), .CLK1_90(1'b0),
                   .CLK1_180(1'b0), .CLK1_270(1'b0), .CLK1_BYP(1'b0), .CLK2_0(1'b0), .CLK2_90(1'b0), .CLK2_180(1'b0), .CLK2_270(1'b0),
                   .CLK2_BYP(1'b0), .CLK3_0(1'b0), .CLK3_90(1'b0), .CLK3_180(1'b0), .CLK3_270(1'b0), .CLK3_BYP(1'b0), .USR_GLB0(1'b0),
                   .USR_GLB1(1'b0), .USR_GLB2(1'b0), .USR_GLB3(1'b0), .USR_FB0(1'b0), .USR_FB1(1'b0), .USR_FB2(1'b0), .USR_FB3(1'b0) );
CPE_IBF    #(.BUF_CFG (72'h000001000000000090)) 
           _a182 ( .Y(na182_1), .I(clk) );
CPE_OBF    #(.BUF_CFG (72'h000000000100010902)) 
           _a183 ( .O(tx), .A(na193_10) );
// C_AND////      x71y119     80'h00_0018_00_0000_0C88_ACFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a184_1 ( .OUT(na184_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na14_2), .IN7(na44_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///OR/      x72y124     80'h00_0060_00_0000_0C0E_FF73
C_OR       #(.CPE_CFG (9'b0_1000_0000)) 
           _a186_4 ( .OUT(na186_2), .IN1(1'b0), .IN2(~na8_1), .IN3(~na44_1), .IN4(~na196_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x69y108     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a187_2 ( .OUT(na187_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a187_6 ( .COUTY1(na187_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na187_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_OR////      x72y115     80'h00_0018_00_0000_0CEE_CE00
C_OR       #(.CPE_CFG (9'b0_0000_0000)) 
           _a190_1 ( .OUT(na190_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na13_2), .IN6(na14_2), .IN7(1'b0), .IN8(na39_2),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_Route1////      x68y121     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a191_1 ( .OUT(na191_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na72_4), .PINX(1'b0), .PINY1(1'b0) );
// C_Route1////      x70y125     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a192_1 ( .OUT(na192_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na85_4), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x103y128     80'h08_0060_00_0000_0C08_FFFC
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a193_4 ( .OUT(na193_2), .IN1(1'b1), .IN2(na7_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_CPlines  #(.CPE_CFG (19'h0_0000)) 
           _a193_6 ( .RAM_O2(na193_10), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(1'b0),
                     .OUT2(na193_2), .COMP_OUT(1'b0) );
// C_////Bridge      x67y111     80'h00_00A6_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a194_5 ( .OUT(na194_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na33_2), .IN8(1'b0) );
// C_////Bridge      x74y117     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a195_5 ( .OUT(na195_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na39_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x72y122     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a196_5 ( .OUT(na196_2), .IN1(1'b0), .IN2(1'b0), .IN3(na44_2), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x74y120     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a197_5 ( .OUT(na197_2), .IN1(1'b0), .IN2(1'b0), .IN3(na44_2), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x73y115     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a198_5 ( .OUT(na198_2), .IN1(1'b0), .IN2(1'b0), .IN3(na192_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x69y120     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a199_5 ( .OUT(na199_2), .IN1(1'b0), .IN2(1'b0), .IN3(na192_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
endmodule
