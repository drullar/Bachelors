//  (c) Cologne Chip AG
//  FPGA Verilog netlist writer     Version: Version 4.2 (1 January 2025)
//  Compile Time: 2025-06-13 09:36:44
//  Program Run:  2025-06-24 15:38:18
//  Program Call: C:\Users\anton\Documents\NBU\Bachelors\docs\manufacturer\cc-toolchain-win\bin\p_r\p_r.exe -i net/blink_synth.v -o blink -ccf src/blink.ccf -cCP 
//  File Type:    Verilog

// Gatecount:     73
module blink (clk ,
       tx 
       ) ;

input  clk;

output tx;



wire tx;
wire clk;
wire na1_1;
wire na1_1_i;
wire na1_2;
wire na1_2_i;
wire na2_1;
wire na4_2;
wire na5_2;
wire na7_1;
wire na7_2;
wire na8_1;
wire na8_1_i;
wire na8_2;
wire na8_2_i;
wire na9_1;
wire na12_1;
wire na12_1_i;
wire na12_2;
wire na12_2_i;
wire na14_1;
wire na14_1_i;
wire na14_2;
wire na14_2_i;
wire na16_1;
wire na16_1_i;
wire na16_2;
wire na16_2_i;
wire na18_1;
wire na18_1_i;
wire na18_2;
wire na18_2_i;
wire na21_1;
wire na21_1_i;
wire na21_2;
wire na21_2_i;
wire na22_1;
wire na22_1_i;
wire na22_2;
wire na22_2_i;
wire na26_1;
wire na26_1_i;
wire na26_2;
wire na26_2_i;
wire na28_1;
wire na28_1_i;
wire na29_1;
wire na30_2;
wire na31_1;
wire na33_1;
wire na33_1_i;
wire na33_2;
wire na33_2_i;
wire na34_2;
wire na34_2_i;
wire na36_1;
wire na36_1_i;
wire na36_2;
wire na36_2_i;
wire na37_1;
wire na37_1_i;
wire na37_2;
wire na37_2_i;
wire na38_1;
wire na38_1_i;
wire na40_1;
wire na41_1;
wire na41_1_i;
wire na41_2;
wire na41_2_i;
wire na42_2;
wire na42_2_i;
wire na45_1;
wire na45_1_i;
wire na45_2;
wire na45_2_i;
wire na46_1;
wire na47_1;
wire na48_1;
wire na48_2;
wire na51_1;
wire na51_2;
wire na51_4;
wire na53_1;
wire na53_2;
wire na53_4;
wire na55_1;
wire na55_2;
wire na55_4;
wire na57_1;
wire na57_2;
wire na59_1;
wire na59_2;
wire na59_4;
wire na61_1;
wire na61_2;
wire na61_4;
wire na63_1;
wire na63_2;
wire na63_4;
wire na65_1;
wire na65_2;
wire na65_4;
wire na67_1;
wire na67_2;
wire na67_4;
wire na68_1;
wire na68_4;
wire na69_1;
wire na69_2;
wire na69_4;
wire na71_1;
wire na71_2;
wire na71_4;
wire na73_1;
wire na73_2;
wire na73_4;
wire na75_1;
wire na76_1;
wire na76_4;
wire na77_1;
wire na77_2;
wire na79_1;
wire na79_4;
wire na80_1;
wire na80_2;
wire na80_4;
wire na82_1;
wire na84_1;
wire na117_1;
wire na117_1_i;
wire na118_1;
wire na118_1_i;
wire na119_1;
wire na119_1_i;
wire na120_2;
wire na120_2_i;
wire na121_2;
wire na121_2_i;
wire na122_1;
wire na122_1_i;
wire na123_2;
wire na123_2_i;
wire na124_2;
wire na124_2_i;
wire na125_1;
wire na126_1;
wire na127_1;
wire na129_1;
wire na129_4;
wire na145_2;
wire na152_2;
wire na153_2;
wire na154_2;
wire na155_2;
wire na156_2;
wire na157_2;
wire na158_2;
wire na159_2;
wire na160_2;
wire na161_2;
wire na162_2;
wire na153_10;

// C_AND/D//AND/D      x72y118     80'h00_FE00_80_0000_0C88_C5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a1_1 ( .OUT(na1_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(1'b1), .IN8(na63_2),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a1_2 ( .OUT(na1_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na1_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a1_4 ( .OUT(na1_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(1'b1), .IN4(na63_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a1_5 ( .OUT(na1_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na1_2_i) );
CLKIN      #(.CLKIN_CFG (32'h0000_0000)) 
           _a2 ( .PCLK0(na2_1), .PCLK1(_d0), .PCLK2(_d1), .PCLK3(_d2), .CLK0(na127_1), .CLK1(1'b0), .CLK2(1'b0), .CLK3(1'b0), .SER_CLK(1'b0),
                 .SPI_CLK(1'b0), .JTAG_CLK(1'b0) );
// C_///AND/      x74y119     80'h00_0060_00_0000_0C08_FF41
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a4_4 ( .OUT(na4_2), .IN1(~na22_2), .IN2(~na33_2), .IN3(~na157_2), .IN4(na12_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x74y118     80'h00_0060_00_0000_0C08_FF21
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a5_4 ( .OUT(na5_2), .IN1(~na34_2), .IN2(~na154_2), .IN3(na14_1), .IN4(~na1_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND///AND/      x73y118     80'h00_0078_00_0000_0C88_1441
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a7_1 ( .OUT(na7_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na156_2), .IN6(na33_1), .IN7(~na18_2), .IN8(~na12_2),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a7_4 ( .OUT(na7_2), .IN1(~na22_1), .IN2(~na16_1), .IN3(~na14_2), .IN4(na26_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x71y122     80'h00_FA00_80_0000_0C88_C5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_1 ( .OUT(na8_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na9_1), .IN6(1'b1), .IN7(1'b1), .IN8(na73_1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_2 ( .OUT(na8_1), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na8_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a8_4 ( .OUT(na8_2_i), .IN1(~na9_1), .IN2(1'b1), .IN3(na71_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a8_5 ( .OUT(na8_2), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na8_2_i) );
// C_AND////      x73y125     80'h00_0018_00_0000_0888_8888
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a9_1 ( .OUT(na9_1), .IN1(na45_1), .IN2(na8_1), .IN3(na36_1), .IN4(na37_1), .IN5(na45_2), .IN6(na8_2), .IN7(na36_2), .IN8(na37_2),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x72y120     80'h00_FE00_80_0000_0C88_C5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_1 ( .OUT(na12_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(1'b1), .IN8(na57_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_2 ( .OUT(na12_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a12_4 ( .OUT(na12_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(1'b1), .IN4(na57_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a12_5 ( .OUT(na12_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_2_i) );
// C_AND/D//AND/D      x70y125     80'h00_FE00_80_0000_0C88_A5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_1 ( .OUT(na14_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(na55_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a14_2 ( .OUT(na14_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a14_4 ( .OUT(na14_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(na55_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a14_5 ( .OUT(na14_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na14_2_i) );
// C_AND/D//AND/D      x71y120     80'h00_FE00_80_0000_0C88_C5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_1 ( .OUT(na16_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(1'b1), .IN8(na53_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_2 ( .OUT(na16_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a16_4 ( .OUT(na16_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(1'b1), .IN4(na53_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a16_5 ( .OUT(na16_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_2_i) );
// C_AND/D//AND/D      x72y119     80'h00_FE00_80_0000_0C88_A5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a18_1 ( .OUT(na18_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(na51_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a18_2 ( .OUT(na18_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na18_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a18_4 ( .OUT(na18_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(na51_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a18_5 ( .OUT(na18_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na18_2_i) );
// C_AND/D//AND/D      x71y117     80'h00_FE00_80_0000_0C88_C5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_1 ( .OUT(na21_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(1'b1), .IN8(na67_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a21_2 ( .OUT(na21_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na21_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a21_4 ( .OUT(na21_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(1'b1), .IN4(na67_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a21_5 ( .OUT(na21_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na21_2_i) );
// C_AND/D//AND/D      x69y117     80'h00_FE00_80_0000_0C88_A5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_1 ( .OUT(na22_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(na65_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_2 ( .OUT(na22_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na22_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a22_4 ( .OUT(na22_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(na65_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a22_5 ( .OUT(na22_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na22_2_i) );
// C_AND/D//AND/D      x72y116     80'h00_FE00_80_0000_0C88_A5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_1 ( .OUT(na26_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(na61_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_2 ( .OUT(na26_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na26_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a26_4 ( .OUT(na26_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(na61_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a26_5 ( .OUT(na26_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na26_2_i) );
// C_AND/D///      x74y119     80'h00_FA00_00_0000_0C88_33FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a28_1 ( .OUT(na28_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na31_1), .IN7(1'b1), .IN8(~na29_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a28_2 ( .OUT(na28_1), .CLK(na84_1), .EN(na46_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na28_1_i) );
// C_MX4b////      x74y116     80'h00_0018_00_0040_0A33_00A3
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a29_1 ( .OUT(na29_1), .IN1(1'b1), .IN2(~na77_2), .IN3(na30_2), .IN4(1'b1), .IN5(~na126_1), .IN6(~na125_1), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x76y115     80'h00_0060_00_0000_0C08_FF8F
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a30_4 ( .OUT(na30_2), .IN1(1'b1), .IN2(1'b1), .IN3(na145_2), .IN4(na42_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x75y118     80'h00_0018_00_0000_0C88_11FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a31_1 ( .OUT(na31_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na38_1), .IN6(~na41_2), .IN7(~na159_2), .IN8(~na42_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x71y116     80'h00_FE00_80_0000_0C88_C5F1
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a33_1 ( .OUT(na33_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na48_1), .IN6(1'b1), .IN7(1'b1), .IN8(na59_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a33_2 ( .OUT(na33_1), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na33_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a33_4 ( .OUT(na33_2_i), .IN1(~na48_1), .IN2(~na33_2), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a33_5 ( .OUT(na33_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na33_2_i) );
// C_///AND/D      x71y113     80'h00_FE00_80_0000_0C08_FFC5
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a34_4 ( .OUT(na34_2_i), .IN1(~na48_1), .IN2(1'b1), .IN3(1'b1), .IN4(na59_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a34_5 ( .OUT(na34_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na34_2_i) );
// C_AND/D//AND/D      x74y125     80'h00_FA00_80_0000_0C88_A5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a36_1 ( .OUT(na36_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na9_1), .IN6(1'b1), .IN7(na75_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a36_2 ( .OUT(na36_1), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na36_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a36_4 ( .OUT(na36_2_i), .IN1(~na9_1), .IN2(1'b1), .IN3(1'b1), .IN4(na69_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a36_5 ( .OUT(na36_2), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na36_2_i) );
// C_AND/D//AND/D      x74y126     80'h00_FA00_80_0000_0C88_C5A5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a37_1 ( .OUT(na37_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na9_1), .IN6(1'b1), .IN7(1'b1), .IN8(na73_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a37_2 ( .OUT(na37_1), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na37_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a37_4 ( .OUT(na37_2_i), .IN1(~na9_1), .IN2(1'b1), .IN3(na71_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a37_5 ( .OUT(na37_2), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na37_2_i) );
// C_ORAND/D///      x77y115     80'h00_FA00_00_0000_0C88_5DFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a38_1 ( .OUT(na38_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na38_1), .IN6(na31_1), .IN7(~na30_2), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a38_2 ( .OUT(na38_1), .CLK(na84_1), .EN(na46_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na38_1_i) );
// C_AND////      x75y115     80'h00_0018_00_0000_0C88_53FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a40_1 ( .OUT(na40_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na31_1), .IN7(~na30_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x73y116     80'h00_FA00_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_1 ( .OUT(na41_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na40_1), .IN6(1'b1), .IN7(na80_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_2 ( .OUT(na41_1), .CLK(na84_1), .EN(na46_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a41_4 ( .OUT(na41_2_i), .IN1(na40_1), .IN2(1'b1), .IN3(na80_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a41_5 ( .OUT(na41_2), .CLK(na84_1), .EN(na46_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_2_i) );
// C_///AND/D      x74y112     80'h00_FA00_80_0000_0C08_FFCA
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a42_4 ( .OUT(na42_2_i), .IN1(na40_1), .IN2(1'b1), .IN3(1'b1), .IN4(na82_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a42_5 ( .OUT(na42_2), .CLK(na84_1), .EN(na46_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na42_2_i) );
// C_AND/D//AND/D      x73y123     80'h00_FA00_80_0000_0C88_F1C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_1 ( .OUT(na45_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na45_1), .IN6(~na155_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_2 ( .OUT(na45_1), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a45_4 ( .OUT(na45_2_i), .IN1(~na9_1), .IN2(1'b1), .IN3(1'b1), .IN4(na69_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a45_5 ( .OUT(na45_2), .CLK(na84_1), .EN(na48_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_2_i) );
// C_ORAND////      x74y112     80'h00_0018_00_0000_0C88_BAFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a46_1 ( .OUT(na46_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na48_2), .IN6(1'b0), .IN7(na152_2), .IN8(~na42_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x74y120     80'h00_0018_00_0000_0C88_F8FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a47_1 ( .OUT(na47_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na48_2), .IN6(na31_1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////D      x73y117     80'h00_FE18_00_0000_0888_A888
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a48_1 ( .OUT(na48_1), .IN1(na21_1), .IN2(na7_1), .IN3(na4_2), .IN4(na5_2), .IN5(na21_2), .IN6(na7_2), .IN7(na18_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a48_5 ( .OUT(na48_2), .CLK(na84_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na48_1) );
// C_ADDF2///ADDF2/      x70y119     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a51_1 ( .OUT(na51_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na18_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na67_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a51_4 ( .OUT(na51_2), .COUTY1(na51_4), .IN1(1'b0), .IN2(1'b0), .IN3(na18_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na18_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na67_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y120     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a53_1 ( .OUT(na53_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na51_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a53_4 ( .OUT(na53_2), .COUTY1(na53_4), .IN1(1'b1), .IN2(na16_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na16_2), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na51_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y121     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a55_1 ( .OUT(na55_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na14_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na53_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a55_4 ( .OUT(na55_2), .COUTY1(na55_4), .IN1(1'b0), .IN2(1'b0), .IN3(na14_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na14_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na53_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y122     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a57_1 ( .OUT(na57_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na12_2),
                    .CINX(1'b0), .CINY1(na55_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a57_4 ( .OUT(na57_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na12_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na12_2),
                    .CINX(1'b0), .CINY1(na55_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y114     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a59_1 ( .OUT(na59_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na33_2), .IN7(na158_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na68_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a59_4 ( .OUT(na59_2), .COUTY1(na59_4), .IN1(1'b1), .IN2(na33_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na33_2), .IN7(na158_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na68_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y115     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a61_1 ( .OUT(na61_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na26_2),
                    .CINX(1'b0), .CINY1(na59_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a61_4 ( .OUT(na61_2), .COUTY1(na61_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na26_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                    .IN8(na26_2), .CINX(1'b0), .CINY1(na59_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y116     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a63_1 ( .OUT(na63_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na1_2), .CINX(1'b0),
                    .CINY1(na61_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a63_4 ( .OUT(na63_2), .COUTY1(na63_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na1_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                    .IN8(na1_2), .CINX(1'b0), .CINY1(na61_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y117     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a65_1 ( .OUT(na65_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na22_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a65_4 ( .OUT(na65_2), .COUTY1(na65_4), .IN1(na22_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na22_2), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na63_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x70y118     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a67_1 ( .OUT(na67_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na21_1), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na65_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a67_4 ( .OUT(na67_2), .COUTY1(na67_4), .IN1(na21_2), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na21_1), .IN6(1'b1), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na65_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y113     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a68_2 ( .OUT(na68_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a68_6 ( .COUTY1(na68_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na68_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x72y122     80'h00_0078_00_0020_0C66_AAA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a69_1 ( .OUT(na69_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na45_1), .IN6(1'b1), .IN7(na161_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na76_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a69_4 ( .OUT(na69_2), .COUTY1(na69_4), .IN1(1'b0), .IN2(1'b0), .IN3(na36_2), .IN4(1'b1), .IN5(na45_1), .IN6(1'b1), .IN7(na161_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na76_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x72y123     80'h00_0078_00_0020_0C66_C00C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a71_1 ( .OUT(na71_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na37_2),
                    .CINX(1'b0), .CINY1(na69_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a71_4 ( .OUT(na71_2), .COUTY1(na71_4), .IN1(1'b1), .IN2(na8_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                    .IN8(na37_2), .CINX(1'b0), .CINY1(na69_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x72y124     80'h00_0078_00_0020_0C66_0CC0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a73_1 ( .OUT(na73_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na8_1), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                    .CINY1(na71_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a73_4 ( .OUT(na73_2), .COUTY1(na73_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na37_1), .IN5(1'b1), .IN6(na8_1), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na71_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x72y125     80'h00_0018_00_0010_0666_00A0
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a75_1 ( .OUT(na75_1), .IN1(1'b0), .IN2(1'b0), .IN3(na36_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na73_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x72y121     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a76_2 ( .OUT(na76_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a76_6 ( .COUTY1(na76_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na76_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x73y114     80'h00_0078_00_0020_0C66_AAFC
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a77_1 ( .OUT(na77_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na38_1), .IN6(1'b1), .IN7(na160_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na79_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a77_4 ( .OUT(na77_2), .IN1(1'b1), .IN2(na41_1), .IN3(1'b1), .IN4(1'b1), .IN5(na38_1), .IN6(1'b1), .IN7(na160_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na79_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x73y113     80'h00_3F00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a79_2 ( .OUT(na79_1), .CLK(1'b1), .EN(1'b0), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a79_6 ( .COUTY1(na79_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na79_1),
                    .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x72y113     80'h00_0078_00_0020_0C66_AA0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a80_1 ( .OUT(na80_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na38_1), .IN6(1'b1), .IN7(na160_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a80_4 ( .OUT(na80_2), .COUTY1(na80_4), .IN1(1'b1), .IN2(na41_1), .IN3(1'b0), .IN4(1'b0), .IN5(na38_1), .IN6(1'b1), .IN7(na160_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na129_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x72y114     80'h00_0018_00_0010_0666_00C0
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a82_1 ( .OUT(na82_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na42_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(na80_4), .PINX(1'b0), .PINY1(1'b0) );
GLBOUT     #(.GLBOUT_CFG (64'h0000_0000_0000_0010)) 
           _a84 ( .GLB0(na84_1), .GLB1(_d3), .GLB2(_d4), .GLB3(_d5), .CLK_FB0(_d6), .CLK_FB1(_d7), .CLK_FB2(_d8), .CLK_FB3(_d9), .CLK0_0(1'b0),
                  .CLK0_90(1'b0), .CLK0_180(1'b0), .CLK0_270(1'b0), .CLK0_BYP(na2_1), .CLK1_0(1'b0), .CLK1_90(1'b0), .CLK1_180(1'b0),
                  .CLK1_270(1'b0), .CLK1_BYP(1'b0), .CLK2_0(1'b0), .CLK2_90(1'b0), .CLK2_180(1'b0), .CLK2_270(1'b0), .CLK2_BYP(1'b0),
                  .CLK3_0(1'b0), .CLK3_90(1'b0), .CLK3_180(1'b0), .CLK3_270(1'b0), .CLK3_BYP(1'b0), .USR_GLB0(1'b0), .USR_GLB1(1'b0),
                  .USR_GLB2(1'b0), .USR_GLB3(1'b0), .USR_FB0(1'b0), .USR_FB1(1'b0), .USR_FB2(1'b0), .USR_FB3(1'b0) );
// C_AND/D///      x73y119     80'h00_FA00_00_0000_0C88_FAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a117_1 ( .OUT(na117_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na45_1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a117_2 ( .OUT(na117_1), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na117_1_i) );
// C_AND/D///      x73y122     80'h00_FA00_00_0000_0C88_FAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a118_1 ( .OUT(na118_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na45_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a118_2 ( .OUT(na118_1), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na118_1_i) );
// C_AND/D///      x74y121     80'h00_FA00_00_0000_0C88_AFFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a119_1 ( .OUT(na119_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na36_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a119_2 ( .OUT(na119_1), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na119_1_i) );
// C_///AND/D      x74y120     80'h00_FA00_80_0000_0C08_FFCF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a120_4 ( .OUT(na120_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na37_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0100)) 
           _a120_5 ( .OUT(na120_2), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na120_2_i) );
// C_///AND/D      x74y124     80'h00_FA00_80_0000_0C08_FFFC
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a121_4 ( .OUT(na121_2_i), .IN1(1'b1), .IN2(na8_2), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0100)) 
           _a121_5 ( .OUT(na121_2), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na121_2_i) );
// C_AND/D///      x74y123     80'h00_FA00_00_0000_0C88_FCFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a122_1 ( .OUT(na122_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na8_1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0000)) 
           _a122_2 ( .OUT(na122_1), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na122_1_i) );
// C_///AND/D      x73y122     80'h00_FA00_80_0000_0C08_FFCF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a123_4 ( .OUT(na123_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na37_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0100)) 
           _a123_5 ( .OUT(na123_2), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na123_2_i) );
// C_///AND/D      x73y121     80'h00_FA00_80_0000_0C08_FFAF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a124_4 ( .OUT(na124_2_i), .IN1(1'b1), .IN2(1'b1), .IN3(na36_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'bX_0000_0100)) 
           _a124_5 ( .OUT(na124_2), .CLK(na84_1), .EN(na47_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na124_2_i) );
// C_MX4b////      x75y116     80'h00_0018_00_0040_0AF0_00C5
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a125_1 ( .OUT(na125_1), .IN1(~na38_1), .IN2(1'b1), .IN3(1'b1), .IN4(na162_2), .IN5(na117_1), .IN6(na118_1), .IN7(na119_1),
                     .IN8(na120_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x75y117     80'h00_0018_00_0040_0AF0_003A
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a126_1 ( .OUT(na126_1), .IN1(na38_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na162_2), .IN5(na124_2), .IN6(na123_2), .IN7(na122_1),
                     .IN8(na121_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
CPE_IBF    #(.BUF_CFG (72'h000001000000000090)) 
           _a127 ( .Y(na127_1), .I(clk) );
CPE_OBF    #(.BUF_CFG (72'h000000000100010902)) 
           _a128 ( .O(tx), .A(na153_10) );
// C_/C_0_1///      x72y112     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a129_2 ( .OUT(na129_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a129_6 ( .COUTY1(na129_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na129_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_///OR/      x72y115     80'h00_0060_00_0000_0C0E_FFAE
C_OR       #(.CPE_CFG (9'b0_1000_0000)) 
           _a145_4 ( .OUT(na145_2), .IN1(na38_1), .IN2(na41_1), .IN3(na160_2), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x74y111     80'h00_0060_00_0000_0C08_FF53
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a152_4 ( .OUT(na152_2), .IN1(1'b1), .IN2(~na41_2), .IN3(~na159_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x107y128     80'h08_0060_00_0000_0C08_FFAF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a153_4 ( .OUT(na153_2), .IN1(1'b1), .IN2(1'b1), .IN3(na28_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_CPlines  #(.CPE_CFG (19'h0_0000)) 
           _a153_6 ( .RAM_O2(na153_10), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(1'b0),
                     .OUT2(na153_2), .COMP_OUT(1'b0) );
// C_////Bridge      x71y118     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a154_5 ( .OUT(na154_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na1_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x75y122     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a155_5 ( .OUT(na155_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na9_1), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x75y117     80'h00_00A1_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a156_5 ( .OUT(na156_2), .IN1(1'b0), .IN2(na16_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x76y119     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a157_5 ( .OUT(na157_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na26_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x72y111     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a158_5 ( .OUT(na158_2), .IN1(na34_2), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x76y113     80'h00_00A1_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a159_5 ( .OUT(na159_2), .IN1(1'b0), .IN2(na41_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x74y113     80'h00_00A5_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a160_5 ( .OUT(na160_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(na41_2), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x74y121     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a161_5 ( .OUT(na161_2), .IN1(na45_2), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x78y116     80'h00_00A5_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a162_5 ( .OUT(na162_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(na77_1), .IN7(1'b0), .IN8(1'b0) );
endmodule
