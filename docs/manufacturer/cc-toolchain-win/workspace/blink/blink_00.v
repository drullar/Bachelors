//  (c) Cologne Chip AG
//  FPGA Verilog netlist writer     Version: Version 4.2 (1 January 2025)
//  Compile Time: 2025-06-13 09:36:44
//  Program Run:  2025-08-19 09:42:27
//  Program Call: C:\Users\anton\Documents\NBU\Bachelors\docs\manufacturer\cc-toolchain-win\bin\p_r\p_r.exe -i net/blink_synth.v -o blink -ccf src/blink.ccf -cCP 
//  File Type:    Verilog

// Gatecount:    119
module blink (clk ,
       tx 
       ) ;

input  clk;

output tx;



wire tx;
wire clk;
wire na1_2;
wire na1_2_i;
wire na2_1;
wire na2_1_i;
wire na2_2;
wire na2_2_i;
wire na3_1;
wire na4_1;
wire na4_1_i;
wire na4_2;
wire na4_2_i;
wire na6_1;
wire na6_1_i;
wire na6_2;
wire na6_2_i;
wire na8_1;
wire na9_2;
wire na10_1;
wire na10_1_i;
wire na10_2;
wire na10_2_i;
wire na11_1;
wire na11_1_i;
wire na11_2;
wire na11_2_i;
wire na13_1;
wire na13_1_i;
wire na14_1;
wire na14_1_i;
wire na15_1;
wire na15_1_i;
wire na15_2;
wire na15_2_i;
wire na16_1;
wire na16_1_i;
wire na16_2;
wire na16_2_i;
wire na17_1;
wire na17_2;
wire na18_1;
wire na18_1_i;
wire na20_1;
wire na20_1_i;
wire na20_2;
wire na20_2_i;
wire na21_1;
wire na21_1_i;
wire na22_1;
wire na22_2;
wire na23_1;
wire na23_1_i;
wire na26_1;
wire na26_1_i;
wire na26_2;
wire na26_2_i;
wire na28_1;
wire na28_1_i;
wire na28_2;
wire na28_2_i;
wire na30_2;
wire na30_2_i;
wire na31_2;
wire na31_2_i;
wire na32_1;
wire na32_2;
wire na33_1;
wire na33_1_i;
wire na34_1;
wire na34_1_i;
wire na35_2;
wire na35_2_i;
wire na36_1;
wire na36_1_i;
wire na37_2;
wire na37_2_i;
wire na39_1;
wire na39_1_i;
wire na39_2;
wire na39_2_i;
wire na41_1;
wire na41_1_i;
wire na41_2;
wire na41_2_i;
wire na43_1;
wire na43_1_i;
wire na43_2;
wire na43_2_i;
wire na45_1;
wire na45_1_i;
wire na45_2;
wire na45_2_i;
wire na48_1;
wire na48_1_i;
wire na48_2;
wire na48_2_i;
wire na50_1;
wire na50_1_i;
wire na50_2;
wire na50_2_i;
wire na52_1;
wire na52_1_i;
wire na52_2;
wire na52_2_i;
wire na54_1;
wire na54_1_i;
wire na54_2;
wire na54_2_i;
wire na55_2;
wire na55_2_i;
wire na58_1;
wire na58_1_i;
wire na58_2;
wire na58_2_i;
wire na60_1;
wire na60_1_i;
wire na60_2;
wire na60_2_i;
wire na61_1;
wire na61_1_i;
wire na61_2;
wire na61_2_i;
wire na62_1;
wire na63_2;
wire na64_1;
wire na67_1;
wire na68_2;
wire na69_1;
wire na70_2;
wire na71_1;
wire na73_4;
wire na75_4;
wire na77_4;
wire na79_1;
wire na79_4;
wire na81_4;
wire na83_4;
wire na85_4;
wire na87_4;
wire na89_4;
wire na90_4;
wire na92_4;
wire na94_4;
wire na96_4;
wire na98_4;
wire na100_4;
wire na102_4;
wire na104_4;
wire na105_1;
wire na105_4;
wire na106_4;
wire na108_4;
wire na110_4;
wire na112_1;
wire na112_4;
wire na113_1;
wire na113_2;
wire na113_4;
wire na115_1;
wire na115_2;
wire na115_4;
wire na117_1;
wire na117_2;
wire na119_1;
wire na119_4;
wire na121_1;
wire na121_2;
wire na121_4;
wire na123_1;
wire na123_2;
wire na123_4;
wire na125_1;
wire na125_2;
wire na125_4;
wire na127_1;
wire na127_2;
wire na127_4;
wire na129_1;
wire na129_2;
wire na129_4;
wire na130_1;
wire na130_2;
wire na130_4;
wire na132_1;
wire na132_2;
wire na132_4;
wire na134_1;
wire na134_2;
wire na134_4;
wire na136_1;
wire na138_1;
wire na138_2;
wire na138_4;
wire na140_1;
wire na140_2;
wire na140_4;
wire na142_1;
wire na142_2;
wire na142_4;
wire na144_1;
wire na144_2;
wire na144_4;
wire na145_1;
wire na145_4;
wire na147_1;
wire na147_2;
wire na147_4;
wire na149_1;
wire na149_2;
wire na149_4;
wire na151_1;
wire na151_2;
wire na151_4;
wire na153_1;
wire na153_2;
wire na153_4;
wire na155_1;
wire na155_2;
wire na156_1;
wire na156_4;
wire na157_1;
wire na157_2;
wire na160_1;
wire na218_1;
wire na220_1;
wire na221_1;
wire na221_4;
wire na222_1;
wire na223_1;
wire na224_1;
wire na229_2;
wire na230_1;
wire na232_1;
wire na257_1;
wire na261_1;
wire na262_2;
wire na263_2;
wire na264_2;
wire na265_2;
wire na266_2;
wire na267_2;
wire na268_2;
wire na269_2;
wire na270_2;
wire na271_2;
wire na272_2;
wire na273_2;
wire na262_10;

// C_///AND/D      x71y125     80'h00_F600_80_0000_0C08_FF1A
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a1_4 ( .OUT(na1_2_i), .IN1(na136_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a1_5 ( .OUT(na1_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na1_2_i) );
// C_AND/D//AND/D      x65y126     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_1 ( .OUT(na2_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na134_2), .IN7(~na223_1), .IN8(~na220_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a2_2 ( .OUT(na2_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a2_4 ( .OUT(na2_2_i), .IN1(1'b1), .IN2(na134_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a2_5 ( .OUT(na2_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na2_2_i) );
CLKIN      #(.CLKIN_CFG (32'h0000_0000)) 
           _a3 ( .PCLK0(na3_1), .PCLK1(_d0), .PCLK2(_d1), .PCLK3(_d2), .CLK0(na218_1), .CLK1(1'b0), .CLK2(1'b0), .CLK3(1'b0), .SER_CLK(1'b0),
                 .SPI_CLK(1'b0), .JTAG_CLK(1'b0) );
// C_AND/D//AND/D      x70y125     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a4_1 ( .OUT(na4_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na132_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a4_2 ( .OUT(na4_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na4_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a4_4 ( .OUT(na4_2_i), .IN1(na132_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a4_5 ( .OUT(na4_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na4_2_i) );
// C_AND/D//AND/D      x69y122     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a6_1 ( .OUT(na6_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na129_2), .IN7(~na223_1), .IN8(~na220_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a6_2 ( .OUT(na6_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na6_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a6_4 ( .OUT(na6_2_i), .IN1(1'b1), .IN2(na129_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a6_5 ( .OUT(na6_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na6_2_i) );
// C_AND////      x71y111     80'h00_0018_00_0000_0C88_3AFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_1 ( .OUT(na8_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na9_2), .IN6(1'b1), .IN7(1'b1), .IN8(~na222_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///OR/      x71y113     80'h00_0060_00_0000_0C0E_FFB0
C_OR       #(.CPE_CFG (9'b0_1000_0000)) 
           _a9_4 ( .OUT(na9_2), .IN1(1'b0), .IN2(1'b0), .IN3(na21_1), .IN4(~na220_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x71y112     80'h00_FA00_80_0000_0C88_F8F8
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a10_1 ( .OUT(na10_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na8_1), .IN6(na155_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a10_2 ( .OUT(na10_1), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na10_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a10_4 ( .OUT(na10_2_i), .IN1(na8_1), .IN2(na155_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a10_5 ( .OUT(na10_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na10_2_i) );
// C_AND/D//AND/D      x72y110     80'h00_FA00_80_0000_0C88_CACA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a11_1 ( .OUT(na11_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na153_2), .IN6(1'b1), .IN7(1'b1), .IN8(na263_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a11_2 ( .OUT(na11_1), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na11_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a11_4 ( .OUT(na11_2_i), .IN1(na153_1), .IN2(1'b1), .IN3(1'b1), .IN4(na263_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a11_5 ( .OUT(na11_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na11_2_i) );
// C_AND/D///      x70y117     80'h00_F600_00_0000_0C88_15FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a13_1 ( .OUT(na13_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na271_2), .IN6(1'b1), .IN7(~na13_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a13_2 ( .OUT(na13_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na13_1_i) );
// C_MX4a/D///      x72y117     80'h00_FA00_00_0040_0CB9_5300
C_MX4a     #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_1 ( .OUT(na14_1_i), .IN1(~na230_1), .IN2(1'b1), .IN3(1'b0), .IN4(~na229_2), .IN5(1'b1), .IN6(~na22_2), .IN7(~na31_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a14_2 ( .OUT(na14_1), .CLK(na160_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_1_i) );
// C_AND/D//AND/D      x70y120     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_1 ( .OUT(na15_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na144_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_2 ( .OUT(na15_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a15_4 ( .OUT(na15_2_i), .IN1(na144_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a15_5 ( .OUT(na15_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_2_i) );
// C_AND/D//AND/D      x73y112     80'h00_FA00_80_0000_0C88_CAC3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_1 ( .OUT(na16_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na157_2), .IN6(1'b1), .IN7(1'b1), .IN8(na17_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_2 ( .OUT(na16_1), .CLK(na160_1), .EN(na67_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a16_4 ( .OUT(na16_2_i), .IN1(1'b1), .IN2(~na16_2), .IN3(1'b1), .IN4(na17_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a16_5 ( .OUT(na16_2), .CLK(na160_1), .EN(na67_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_2_i) );
// C_AND///AND/      x72y118     80'h00_0078_00_0000_0C88_AA52
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a17_1 ( .OUT(na17_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na9_2), .IN6(1'b1), .IN7(na232_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a17_4 ( .OUT(na17_2), .IN1(na23_1), .IN2(~na22_2), .IN3(~na21_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D///      x72y111     80'h00_FA00_00_0000_0C88_CAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a18_1 ( .OUT(na18_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na157_1), .IN6(1'b1), .IN7(1'b1), .IN8(na17_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a18_2 ( .OUT(na18_1), .CLK(na160_1), .EN(na67_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na18_1_i) );
// C_AND/D//AND/D      x66y108     80'h00_F600_80_0000_0C88_2F2F
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a20_1 ( .OUT(na20_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na117_2), .IN8(~na224_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a20_2 ( .OUT(na20_1), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na20_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a20_4 ( .OUT(na20_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(na117_1), .IN4(~na224_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a20_5 ( .OUT(na20_2), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na20_2_i) );
// C_MX2b/D///      x72y115     80'h00_FA00_00_0040_0A33_000A
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_1 ( .OUT(na21_1_i), .IN1(na23_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(~na266_2), .IN6(~na22_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_2 ( .OUT(na21_1), .CLK(na160_1), .EN(na69_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na21_1_i) );
// C_ICOMP////D      x73y118     80'h00_FA18_00_0000_0888_FF65
C_ICOMP    #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_1 ( .OUT(na22_1), .IN1(na23_1), .IN2(1'b0), .IN3(na21_1), .IN4(~na267_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_5 ( .OUT(na22_2), .CLK(na160_1), .EN(na69_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na22_1) );
// C_MX4a/D///      x75y115     80'h00_FA00_00_0040_0C89_AC00
C_MX4a     #(.CPE_CFG (9'b0_0000_0000)) 
           _a23_1 ( .OUT(na23_1_i), .IN1(na23_1), .IN2(1'b0), .IN3(1'b0), .IN4(~na269_2), .IN5(1'b1), .IN6(na22_2), .IN7(na21_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a23_2 ( .OUT(na23_1), .CLK(na160_1), .EN(na69_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na23_1_i) );
// C_AND/D//AND/D      x67y108     80'h00_F600_80_0000_0C88_4F4F
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_1 ( .OUT(na26_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(~na272_2), .IN8(na115_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_2 ( .OUT(na26_1), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na26_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a26_4 ( .OUT(na26_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(~na272_2), .IN4(na115_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a26_5 ( .OUT(na26_2), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na26_2_i) );
// C_AND/D//AND/D      x67y106     80'h00_F600_80_0000_0C88_2F2F
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a28_1 ( .OUT(na28_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na113_2), .IN8(~na224_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a28_2 ( .OUT(na28_1), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na28_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a28_4 ( .OUT(na28_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(na113_1), .IN4(~na224_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a28_5 ( .OUT(na28_2), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na28_2_i) );
// C_///AND/D      x66y106     80'h00_F600_80_0000_0C08_FF35
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a30_4 ( .OUT(na30_2_i), .IN1(~na273_2), .IN2(1'b1), .IN3(1'b1), .IN4(~na30_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a30_5 ( .OUT(na30_2), .CLK(na160_1), .EN(~na9_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na30_2_i) );
// C_///ORAND*/D      x72y113     80'h00_FA00_80_0000_0C07_FF37
C_ORAND    #(.CPE_CFG (9'b1_1000_0000)) 
           _a31_4 ( .OUT(na31_2_i), .IN1(~na9_2), .IN2(~na33_1), .IN3(1'b0), .IN4(~na32_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a31_5 ( .OUT(na31_2), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na31_2_i) );
// C_AND////D      x72y120     80'h00_FA18_00_0000_0888_FC55
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a32_1 ( .OUT(na32_1), .IN1(~na23_1), .IN2(1'b1), .IN3(~na21_1), .IN4(1'b1), .IN5(1'b1), .IN6(na22_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a32_5 ( .OUT(na32_2), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na32_1) );
// C_AND/D///      x71y116     80'h00_FA00_00_0000_0C88_38FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a33_1 ( .OUT(na33_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na9_2), .IN6(na34_1), .IN7(1'b1), .IN8(~na32_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a33_2 ( .OUT(na33_1), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na33_1_i) );
// C_ORAND*/D///      x71y114     80'h00_FA00_00_0000_0388_37FF
C_ORAND    #(.CPE_CFG (9'b1_0000_0000)) 
           _a34_1 ( .OUT(na34_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na9_2), .IN6(~na35_2), .IN7(1'b0), .IN8(~na32_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a34_2 ( .OUT(na34_1), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na34_1_i) );
// C_///AND/D      x75y112     80'h00_FA00_80_0000_0C08_FF38
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a35_4 ( .OUT(na35_2_i), .IN1(na9_2), .IN2(na36_1), .IN3(1'b1), .IN4(~na32_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a35_5 ( .OUT(na35_2), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na35_2_i) );
// C_ORAND*/D///      x73y116     80'h00_FA00_00_0000_0388_37FF
C_ORAND    #(.CPE_CFG (9'b1_0000_0000)) 
           _a36_1 ( .OUT(na36_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na9_2), .IN6(~na37_2), .IN7(1'b0), .IN8(~na32_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a36_2 ( .OUT(na36_1), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na36_1_i) );
// C_///AND/D      x71y114     80'h00_FA00_80_0000_0C08_FFC2
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a37_4 ( .OUT(na37_2_i), .IN1(na9_2), .IN2(~na270_2), .IN3(1'b1), .IN4(na32_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a37_5 ( .OUT(na37_2), .CLK(na160_1), .EN(na64_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na37_2_i) );
// C_AND/D//AND/D      x70y116     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_1 ( .OUT(na39_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na138_2), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_2 ( .OUT(na39_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na39_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a39_4 ( .OUT(na39_2_i), .IN1(1'b1), .IN2(na138_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a39_5 ( .OUT(na39_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na39_2_i) );
// C_AND/D//AND/D      x69y115     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_1 ( .OUT(na41_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na130_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_2 ( .OUT(na41_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a41_4 ( .OUT(na41_2_i), .IN1(na130_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a41_5 ( .OUT(na41_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_2_i) );
// C_AND/D//AND/D      x69y121     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a43_1 ( .OUT(na43_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na127_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a43_2 ( .OUT(na43_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na43_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a43_4 ( .OUT(na43_2_i), .IN1(na127_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a43_5 ( .OUT(na43_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na43_2_i) );
// C_AND/D//AND/D      x70y124     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_1 ( .OUT(na45_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na125_2), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_2 ( .OUT(na45_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a45_4 ( .OUT(na45_2_i), .IN1(1'b1), .IN2(na125_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a45_5 ( .OUT(na45_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_2_i) );
// C_AND/D//AND/D      x69y123     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a48_1 ( .OUT(na48_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na123_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a48_2 ( .OUT(na48_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na48_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a48_4 ( .OUT(na48_2_i), .IN1(na123_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a48_5 ( .OUT(na48_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na48_2_i) );
// C_AND/D//AND/D      x70y121     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a50_1 ( .OUT(na50_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na121_2), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a50_2 ( .OUT(na50_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na50_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a50_4 ( .OUT(na50_2_i), .IN1(1'b1), .IN2(na121_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a50_5 ( .OUT(na50_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na50_2_i) );
// C_AND/D//AND/D      x72y109     80'h00_FA00_80_0000_0C88_CACA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a52_1 ( .OUT(na52_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na149_2), .IN6(1'b1), .IN7(1'b1), .IN8(na263_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a52_2 ( .OUT(na52_1), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na52_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a52_4 ( .OUT(na52_2_i), .IN1(na149_1), .IN2(1'b1), .IN3(1'b1), .IN4(na263_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a52_5 ( .OUT(na52_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na52_2_i) );
// C_AND/D//AND/D      x72y108     80'h00_FA00_80_0000_0C88_F83A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a54_1 ( .OUT(na54_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na8_1), .IN6(na147_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a54_2 ( .OUT(na54_1), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na54_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a54_4 ( .OUT(na54_2_i), .IN1(na8_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na54_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a54_5 ( .OUT(na54_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na54_2_i) );
// C_///AND/D      x67y109     80'h00_FA00_80_0000_0C08_FFF8
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a55_4 ( .OUT(na55_2_i), .IN1(na8_1), .IN2(na147_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a55_5 ( .OUT(na55_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na55_2_i) );
// C_AND/D//AND/D      x69y120     80'h00_F600_80_0000_0C88_1C1C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a58_1 ( .OUT(na58_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na142_2), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a58_2 ( .OUT(na58_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na58_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a58_4 ( .OUT(na58_2_i), .IN1(1'b1), .IN2(na142_1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a58_5 ( .OUT(na58_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na58_2_i) );
// C_AND/D//AND/D      x70y118     80'h00_F600_80_0000_0C88_1A1A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a60_1 ( .OUT(na60_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na140_2), .IN6(1'b1), .IN7(~na223_1), .IN8(~na220_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a60_2 ( .OUT(na60_1), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na60_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a60_4 ( .OUT(na60_2_i), .IN1(na140_1), .IN2(1'b1), .IN3(~na223_1), .IN4(~na220_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a60_5 ( .OUT(na60_2), .CLK(na160_1), .EN(~na63_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na60_2_i) );
// C_AND/D//AND/D      x71y107     80'h00_FA00_80_0000_0C88_F8F8
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a61_1 ( .OUT(na61_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na8_1), .IN6(na151_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a61_2 ( .OUT(na61_1), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na61_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a61_4 ( .OUT(na61_2_i), .IN1(na8_1), .IN2(na151_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a61_5 ( .OUT(na61_2), .CLK(na160_1), .EN(na68_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na61_2_i) );
// C_OR////      x73y117     80'h00_0018_00_0000_0CEE_0B00
C_OR       #(.CPE_CFG (9'b0_0000_0000)) 
           _a62_1 ( .OUT(na62_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na230_1), .IN6(~na22_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x69y119     80'h00_0060_00_0000_0C08_FFF2
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a63_4 ( .OUT(na63_2), .IN1(na9_2), .IN2(~na22_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x69y114     80'h00_0018_00_0000_0888_C7B5
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a64_1 ( .OUT(na64_1), .IN1(~na266_2), .IN2(1'b0), .IN3(na223_1), .IN4(~na32_1), .IN5(~na23_1), .IN6(~na22_2), .IN7(1'b0),
                    .IN8(na257_1), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x72y116     80'h00_0018_00_0000_0888_DF53
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a67_1 ( .OUT(na67_1), .IN1(1'b0), .IN2(~na22_2), .IN3(~na21_1), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(~na268_2), .IN8(na222_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///XOR/      x71y111     80'h00_0060_00_0000_0C06_FF09
C_XOR      #(.CPE_CFG (9'b0_1000_0000)) 
           _a68_4 ( .OUT(na68_2), .IN1(na230_1), .IN2(~na22_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x74y117     80'h00_0018_00_0000_0888_CFBA
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a69_1 ( .OUT(na69_1), .IN1(na261_1), .IN2(1'b0), .IN3(na223_1), .IN4(~na32_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b0), .IN8(na257_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///ORAND/      x67y112     80'h00_0060_00_0000_0C08_FFE5
C_ORAND    #(.CPE_CFG (9'b0_1000_0000)) 
           _a70_4 ( .OUT(na70_2), .IN1(~na71_1), .IN2(1'b0), .IN3(na264_2), .IN4(na224_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ICOMP////      x71y119     80'h00_0018_00_0000_0888_3FA6
C_ICOMP    #(.CPE_CFG (9'b0_0000_0000)) 
           _a71_1 ( .OUT(na71_1), .IN1(na23_1), .IN2(~na22_2), .IN3(~na21_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(na222_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y111     80'h00_0078_00_0020_0C66_AAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a73_1 ( .OUT(na73_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na61_2), .IN6(1'b1), .IN7(na52_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na79_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a73_4 ( .OUT(na73_2), .COUTY1(na73_4), .IN1(na61_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na61_2), .IN6(1'b1), .IN7(na52_1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na79_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y112     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a75_1 ( .OUT(na75_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na11_2),
                    .CINX(1'b0), .CINY1(na73_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a75_4 ( .OUT(na75_2), .COUTY1(na75_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na11_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na11_2), .CINX(1'b0), .CINY1(na73_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y113     80'h00_0078_00_0020_0C66_FC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a77_1 ( .OUT(na77_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na10_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na75_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a77_4 ( .OUT(na77_2), .COUTY1(na77_4), .IN1(1'b1), .IN2(na10_1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b1), .IN6(na10_2), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na75_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y110     80'h00_3F00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a79_2 ( .OUT(na79_1), .CLK(1'b1), .EN(1'b0), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a79_6 ( .COUTY1(na79_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na79_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x68y117     80'h00_0078_00_0020_0C66_AFA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a81_1 ( .OUT(na81_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(na50_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na104_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a81_4 ( .OUT(na81_2), .COUTY1(na81_4), .IN1(1'b0), .IN2(1'b1), .IN3(na50_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na50_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na104_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y118     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a83_1 ( .OUT(na83_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na48_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na81_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a83_4 ( .OUT(na83_2), .COUTY1(na83_4), .IN1(na48_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b1), .IN5(na48_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na81_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y119     80'h00_0078_00_0020_0C66_C0CF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a85_1 ( .OUT(na85_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na45_2),
                    .CINX(1'b0), .CINY1(na83_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a85_4 ( .OUT(na85_2), .COUTY1(na85_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na45_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na45_2), .CINX(1'b0), .CINY1(na83_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y120     80'h00_0078_00_0020_0C66_0AFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a87_1 ( .OUT(na87_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na85_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a87_4 ( .OUT(na87_2), .COUTY1(na87_4), .IN1(na43_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na85_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y121     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a89_1 ( .OUT(na89_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na6_2), .IN7(1'b0), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na87_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a89_4 ( .OUT(na89_2), .COUTY1(na89_4), .IN1(1'b1), .IN2(na6_1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b1), .IN6(na6_2), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na87_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y112     80'h00_0078_00_0020_0C66_AA0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a90_1 ( .OUT(na90_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na41_2), .IN6(1'b1), .IN7(na13_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na105_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a90_4 ( .OUT(na90_2), .COUTY1(na90_4), .IN1(na41_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b1), .IN5(na41_2), .IN6(1'b1), .IN7(na13_1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na105_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y122     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a92_1 ( .OUT(na92_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(na4_2), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na89_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a92_4 ( .OUT(na92_2), .COUTY1(na92_4), .IN1(1'b0), .IN2(1'b1), .IN3(na4_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b1), .IN7(na4_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na89_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y123     80'h00_0078_00_0020_0C66_0CFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a94_1 ( .OUT(na94_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na2_2), .IN7(1'b0), .IN8(1'b1), .CINX(1'b0),
                    .CINY1(na92_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a94_4 ( .OUT(na94_2), .COUTY1(na94_4), .IN1(1'b1), .IN2(na2_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na2_2), .IN7(1'b0),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na92_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x68y124     80'h00_0018_00_0010_0666_000A
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a96_1 ( .OUT(na96_1), .COUTY1(na96_4), .IN1(na1_2), .IN2(1'b1), .IN3(1'b0), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na94_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y113     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a98_1 ( .OUT(na98_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na39_2),
                    .CINX(1'b0), .CINY1(na90_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a98_4 ( .OUT(na98_2), .COUTY1(na98_4), .IN1(1'b0), .IN2(1'b1), .IN3(1'b1), .IN4(na39_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na39_2), .CINX(1'b0), .CINY1(na90_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y114     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a100_1 ( .OUT(na100_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na60_2),
                     .CINX(1'b0), .CINY1(na98_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a100_4 ( .OUT(na100_2), .COUTY1(na100_4), .IN1(1'b0), .IN2(1'b1), .IN3(1'b1), .IN4(na60_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                     .IN8(na60_2), .CINX(1'b0), .CINY1(na98_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y115     80'h00_0078_00_0020_0C66_FCFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a102_1 ( .OUT(na102_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na58_2), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a102_4 ( .OUT(na102_2), .COUTY1(na102_4), .IN1(1'b1), .IN2(na58_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na58_2), .IN7(1'b1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y116     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a104_1 ( .OUT(na104_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na15_2),
                     .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a104_4 ( .OUT(na104_2), .COUTY1(na104_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na15_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                     .IN8(na15_2), .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x68y111     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a105_2 ( .OUT(na105_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a105_6 ( .COUTY1(na105_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na105_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x68y107     80'h00_0078_00_0020_0C66_CCFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a106_1 ( .OUT(na106_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na28_2), .IN7(1'b1), .IN8(na30_2),
                     .CINX(1'b0), .CINY1(na112_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a106_4 ( .OUT(na106_2), .COUTY1(na106_4), .IN1(1'b1), .IN2(na28_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na28_2), .IN7(1'b1),
                     .IN8(na30_2), .CINX(1'b0), .CINY1(na112_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y108     80'h00_0078_00_0020_0C66_FCFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a108_1 ( .OUT(na108_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na26_2), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na106_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a108_4 ( .OUT(na108_2), .COUTY1(na108_4), .IN1(1'b1), .IN2(na26_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na26_2), .IN7(1'b1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na106_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x68y109     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a110_1 ( .OUT(na110_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1), .IN8(na20_2),
                     .CINX(1'b0), .CINY1(na108_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a110_4 ( .OUT(na110_2), .COUTY1(na110_4), .IN1(1'b0), .IN2(1'b1), .IN3(1'b1), .IN4(na20_1), .IN5(1'b0), .IN6(1'b1), .IN7(1'b1),
                     .IN8(na20_2), .CINX(1'b0), .CINY1(na108_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x68y106     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a112_2 ( .OUT(na112_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a112_6 ( .COUTY1(na112_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na112_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x70y107     80'h00_0078_00_0020_0C66_CC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a113_1 ( .OUT(na113_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na28_2), .IN7(1'b1), .IN8(na30_2),
                     .CINX(1'b0), .CINY1(na119_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a113_4 ( .OUT(na113_2), .COUTY1(na113_4), .IN1(1'b1), .IN2(na28_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na28_2), .IN7(1'b1),
                     .IN8(na30_2), .CINX(1'b0), .CINY1(na119_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y108     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a115_1 ( .OUT(na115_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na26_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na113_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a115_4 ( .OUT(na115_2), .COUTY1(na115_4), .IN1(1'b1), .IN2(na26_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na26_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na113_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y109     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a117_1 ( .OUT(na117_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na20_2),
                     .CINX(1'b0), .CINY1(na115_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a117_4 ( .OUT(na117_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na20_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na20_2),
                     .CINX(1'b0), .CINY1(na115_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y106     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a119_2 ( .OUT(na119_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a119_6 ( .COUTY1(na119_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na119_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x67y118     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a121_1 ( .OUT(na121_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na50_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na144_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a121_4 ( .OUT(na121_2), .COUTY1(na121_4), .IN1(1'b0), .IN2(1'b0), .IN3(na50_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na50_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na144_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y119     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a123_1 ( .OUT(na123_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na48_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na121_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a123_4 ( .OUT(na123_2), .COUTY1(na123_4), .IN1(na48_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na48_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na121_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y120     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a125_1 ( .OUT(na125_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na45_2),
                     .CINX(1'b0), .CINY1(na123_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a125_4 ( .OUT(na125_2), .COUTY1(na125_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na45_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na45_2), .CINX(1'b0), .CINY1(na123_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y121     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a127_1 ( .OUT(na127_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na125_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a127_4 ( .OUT(na127_2), .COUTY1(na127_4), .IN1(na43_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na125_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y122     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a129_1 ( .OUT(na129_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na6_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na127_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a129_4 ( .OUT(na129_2), .COUTY1(na129_4), .IN1(1'b1), .IN2(na6_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na6_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na127_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y113     80'h00_0078_00_0020_0C66_AA0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a130_1 ( .OUT(na130_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na41_2), .IN6(1'b1), .IN7(na13_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na145_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a130_4 ( .OUT(na130_2), .COUTY1(na130_4), .IN1(na41_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na41_2), .IN6(1'b1), .IN7(na13_1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na145_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y123     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a132_1 ( .OUT(na132_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na4_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a132_4 ( .OUT(na132_2), .COUTY1(na132_4), .IN1(1'b0), .IN2(1'b0), .IN3(na4_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na4_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y124     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a134_1 ( .OUT(na134_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na2_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na132_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a134_4 ( .OUT(na134_2), .COUTY1(na134_4), .IN1(1'b1), .IN2(na2_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na2_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na132_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x67y125     80'h00_0018_00_0010_0666_000A
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a136_1 ( .OUT(na136_1), .IN1(na1_2), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na134_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y114     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a138_1 ( .OUT(na138_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na39_2),
                     .CINX(1'b0), .CINY1(na130_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a138_4 ( .OUT(na138_2), .COUTY1(na138_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na39_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na39_2), .CINX(1'b0), .CINY1(na130_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y115     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a140_1 ( .OUT(na140_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na60_2),
                     .CINX(1'b0), .CINY1(na138_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a140_4 ( .OUT(na140_2), .COUTY1(na140_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na60_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na60_2), .CINX(1'b0), .CINY1(na138_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y116     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a142_1 ( .OUT(na142_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na58_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na140_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a142_4 ( .OUT(na142_2), .COUTY1(na142_4), .IN1(1'b1), .IN2(na58_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na58_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na140_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y117     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a144_1 ( .OUT(na144_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na15_2),
                     .CINX(1'b0), .CINY1(na142_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a144_4 ( .OUT(na144_2), .COUTY1(na144_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na15_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na15_2), .CINX(1'b0), .CINY1(na142_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x67y112     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a145_2 ( .OUT(na145_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a145_6 ( .COUTY1(na145_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na145_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x69y108     80'h00_0078_00_0020_0C66_CAC0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a147_1 ( .OUT(na147_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na55_2), .IN6(1'b1), .IN7(1'b1), .IN8(na54_2),
                     .CINX(1'b0), .CINY1(na156_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a147_4 ( .OUT(na147_2), .COUTY1(na147_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na54_1), .IN5(na55_2), .IN6(1'b1), .IN7(1'b1),
                     .IN8(na54_2), .CINX(1'b0), .CINY1(na156_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y109     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a149_1 ( .OUT(na149_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na52_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na147_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a149_4 ( .OUT(na149_2), .COUTY1(na149_4), .IN1(1'b0), .IN2(1'b0), .IN3(na52_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na52_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na147_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y110     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a151_1 ( .OUT(na151_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na61_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na149_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a151_4 ( .OUT(na151_2), .COUTY1(na151_4), .IN1(na61_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na61_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na149_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y111     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a153_1 ( .OUT(na153_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na11_2),
                     .CINX(1'b0), .CINY1(na151_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a153_4 ( .OUT(na153_2), .COUTY1(na153_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na11_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na11_2), .CINX(1'b0), .CINY1(na151_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x69y112     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a155_1 ( .OUT(na155_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na10_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na153_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a155_4 ( .OUT(na155_2), .IN1(1'b1), .IN2(na10_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na10_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na153_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x69y107     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a156_2 ( .OUT(na156_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a156_6 ( .COUTY1(na156_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na156_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x71y109     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a157_1 ( .OUT(na157_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(na18_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na221_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a157_4 ( .OUT(na157_2), .IN1(1'b1), .IN2(na16_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(na18_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na221_4), .PINX(1'b0), .PINY1(1'b0) );
GLBOUT     #(.GLBOUT_CFG (64'h0000_0000_0000_0010)) 
           _a160 ( .GLB0(na160_1), .GLB1(_d3), .GLB2(_d4), .GLB3(_d5), .CLK_FB0(_d6), .CLK_FB1(_d7), .CLK_FB2(_d8), .CLK_FB3(_d9),
                   .CLK0_0(1'b0), .CLK0_90(1'b0), .CLK0_180(1'b0), .CLK0_270(1'b0), .CLK0_BYP(na3_1), .CLK1_0(1'b0), .CLK1_90(1'b0),
                   .CLK1_180(1'b0), .CLK1_270(1'b0), .CLK1_BYP(1'b0), .CLK2_0(1'b0), .CLK2_90(1'b0), .CLK2_180(1'b0), .CLK2_270(1'b0),
                   .CLK2_BYP(1'b0), .CLK3_0(1'b0), .CLK3_90(1'b0), .CLK3_180(1'b0), .CLK3_270(1'b0), .CLK3_BYP(1'b0), .USR_GLB0(1'b0),
                   .USR_GLB1(1'b0), .USR_GLB2(1'b0), .USR_GLB3(1'b0), .USR_FB0(1'b0), .USR_FB1(1'b0), .USR_FB2(1'b0), .USR_FB3(1'b0) );
CPE_IBF    #(.BUF_CFG (72'h000001000000000090)) 
           _a218 ( .Y(na218_1), .I(clk) );
CPE_OBF    #(.BUF_CFG (72'h000000000100010902)) 
           _a219 ( .O(tx), .A(na262_10) );
// C_AND////      x70y122     80'h00_0018_00_0000_0C88_F1FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a220_1 ( .OUT(na220_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na23_1), .IN6(~na22_2), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x71y108     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a221_2 ( .OUT(na221_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a221_6 ( .COUTY1(na221_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na221_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_Route1////      x70y114     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a222_1 ( .OUT(na222_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na77_4), .PINX(1'b0), .PINY1(1'b0) );
// C_Route1////      x68y125     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a223_1 ( .OUT(na223_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na96_4), .PINX(1'b0), .PINY1(1'b0) );
// C_Route1////      x68y110     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a224_1 ( .OUT(na224_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na110_4), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x74y116     80'h00_0060_00_0000_0C08_FF5A
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a229_4 ( .OUT(na229_2), .IN1(na23_1), .IN2(1'b1), .IN3(~na21_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x73y115     80'h00_0018_00_0000_0C88_A5FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a230_1 ( .OUT(na230_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na23_1), .IN6(1'b1), .IN7(na21_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_OR////      x72y113     80'h00_0018_00_0000_0CEE_5700
C_OR       #(.CPE_CFG (9'b0_0000_0000)) 
           _a232_1 ( .OUT(na232_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(~na265_2), .IN6(~na16_1), .IN7(~na18_1), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_OR////      x74y114     80'h00_0018_00_0000_0CEE_ED00
C_OR       #(.CPE_CFG (9'b0_0000_0000)) 
           _a257_1 ( .OUT(na257_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(~na23_1), .IN6(na22_2), .IN7(na21_1), .IN8(na222_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX2b////      x71y117     80'h00_0018_00_0040_0AA8_00CF
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a261_1 ( .OUT(na261_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na17_2), .IN5(1'b0), .IN6(na70_2), .IN7(1'b0), .IN8(~na17_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x103y128     80'h08_0060_00_0000_0C08_FFAF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a262_4 ( .OUT(na262_2), .IN1(1'b1), .IN2(1'b1), .IN3(na14_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_CPlines  #(.CPE_CFG (19'h0_0000)) 
           _a262_6 ( .RAM_O2(na262_10), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(1'b0),
                     .OUT2(na262_2), .COMP_OUT(1'b0) );
// C_////Bridge      x70y110     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a263_5 ( .OUT(na263_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na8_1), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x66y109     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a264_5 ( .OUT(na264_2), .IN1(na9_2), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x73y113     80'h00_00A1_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a265_5 ( .OUT(na265_2), .IN1(1'b0), .IN2(na16_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x67y111     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a266_5 ( .OUT(na266_2), .IN1(1'b0), .IN2(1'b0), .IN3(na21_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x76y118     80'h00_00A5_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a267_5 ( .OUT(na267_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(na22_2), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x74y115     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a268_5 ( .OUT(na268_2), .IN1(na23_1), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x78y116     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a269_5 ( .OUT(na269_2), .IN1(na23_1), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x73y114     80'h00_00A7_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a270_5 ( .OUT(na270_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(na32_1) );
// C_////Bridge      x69y117     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a271_5 ( .OUT(na271_2), .IN1(1'b0), .IN2(1'b0), .IN3(na223_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x66y107     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a272_5 ( .OUT(na272_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na224_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x67y105     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a273_5 ( .OUT(na273_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na224_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
endmodule
