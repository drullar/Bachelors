//  (c) Cologne Chip AG
//  FPGA Verilog netlist writer     Version: Version 4.2 (1 January 2025)
//  Compile Time: 2025-06-13 08:36:44
//  Program Run:  2025-12-26 11:57:15
//  Program Call: C:\Users\anton\Documents\NBU\Bachelors\docs\manufacturer\cc-toolchain-win\bin\p_r\p_r.exe -i net/blink_synth.v -o blink -ccf src/blink.ccf -cCP 
//  File Type:    Verilog

// Gatecount:    120
module blink (CLK_10M_IN ,
       TX_DATA_OUT 
       ) ;

input  CLK_10M_IN;

output TX_DATA_OUT;



wire na1_2;
wire na2_2;
wire na3_1;
wire na4_1;
wire na5_1;
wire na7_1;
wire na8_1;
wire na9_1;
wire na9_1_i;
wire na10_2;
wire na12_1;
wire na12_1_i;
wire na12_2;
wire na12_2_i;
wire na13_1;
wire na13_2;
wire na15_1;
wire na15_1_i;
wire na15_2;
wire na15_2_i;
wire na16_1;
wire na16_1_i;
wire na16_2;
wire na16_2_i;
wire na18_2;
wire na19_1;
wire na19_1_i;
wire na19_2;
wire na19_2_i;
wire na20_1;
wire na20_1_i;
wire na20_2;
wire na20_2_i;
wire na22_1;
wire na22_1_i;
wire na23_1;
wire na24_1;
wire na24_2;
wire na25_2;
wire na26_1;
wire na26_1_i;
wire na30_1;
wire na33_1;
wire na33_2;
wire na35_1;
wire na35_2;
wire na39_1;
wire na39_2;
wire na40_2;
wire na40_2_i;
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
wire na47_1;
wire na47_1_i;
wire na47_2;
wire na47_2_i;
wire na49_1;
wire na49_1_i;
wire na49_2;
wire na49_2_i;
wire na51_1;
wire na51_1_i;
wire na51_2;
wire na51_2_i;
wire na53_1;
wire na53_1_i;
wire na53_2;
wire na53_2_i;
wire na55_1;
wire na55_1_i;
wire na55_2;
wire na55_2_i;
wire na57_1;
wire na57_1_i;
wire na57_2;
wire na57_2_i;
wire na58_1;
wire na58_1_i;
wire na60_1;
wire na60_1_i;
wire na60_2;
wire na60_2_i;
wire na61_2;
wire na61_2_i;
wire na62_1;
wire na66_1;
wire na68_1;
wire na68_2;
wire na70_2;
wire na72_1;
wire na73_1;
wire na74_1;
wire na75_2;
wire na76_1;
wire na87_4;
wire na89_4;
wire na91_4;
wire na93_4;
wire na94_4;
wire na96_4;
wire na98_4;
wire na100_4;
wire na102_4;
wire na103_1;
wire na103_4;
wire na104_1;
wire na104_2;
wire na104_4;
wire na106_1;
wire na107_1;
wire na107_4;
wire na109_1;
wire na109_2;
wire na109_4;
wire na111_1;
wire na111_2;
wire na111_4;
wire na113_1;
wire na113_2;
wire na113_4;
wire na115_1;
wire na115_2;
wire na115_4;
wire na117_1;
wire na118_1;
wire na118_2;
wire na118_4;
wire na120_1;
wire na120_2;
wire na120_4;
wire na122_1;
wire na122_2;
wire na122_4;
wire na124_1;
wire na124_2;
wire na124_4;
wire na126_1;
wire na126_2;
wire na126_4;
wire na127_1;
wire na127_4;
wire na128_1;
wire na128_2;
wire na128_4;
wire na130_1;
wire na131_1;
wire na131_4;
wire na132_1;
wire na132_2;
wire na132_4;
wire na134_1;
wire na134_2;
wire na134_4;
wire na136_1;
wire na136_2;
wire na136_4;
wire na138_1;
wire na138_2;
wire na138_4;
wire na140_1;
wire na142_1;
wire na181_1;
wire na182_1;
wire na183_1;
wire na184_1;
wire na185_1;
wire na186_1;
wire na188_2;
wire na188_3;
wire na188_4;
wire na188_5;
wire na188_6;
wire na189_2;
wire na190_1;
wire na191_1;
wire na193_2;
wire na194_1;
wire na196_1;
wire na197_1;
wire na197_4;
wire na198_1;
wire na216_2;
wire na218_1;
wire na219_1;
wire na220_1;
wire na221_2;
wire na222_2;
wire na223_2;
wire na224_2;
wire na225_2;
wire na226_2;
wire na227_2;
wire na228_2;
wire na229_2;
wire na230_2;
wire na231_2;
wire na232_2;
wire na233_2;
wire na234_2;
wire na235_2;
wire na236_2;
wire na237_2;
wire na238_2;
wire na239_2;
wire na240_2;
wire na241_2;
wire na242_2;
wire na243_2;
wire na221_10;
wire CLK_10M_IN;
wire TX_DATA_OUT;

// C_///AND/      x69y114     80'h00_0060_00_0000_0C08_FF5A
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a1_4 ( .OUT(na1_2), .IN1(na61_2), .IN2(1'b1), .IN3(~na12_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x67y114     80'h00_0060_00_0000_0C08_FF52
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a2_4 ( .OUT(na2_2), .IN1(na16_2), .IN2(~na3_1), .IN3(~na15_2), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX2b////      x65y112     80'h00_0018_00_0040_0A55_00C0
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a3_1 ( .OUT(na3_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na238_2), .IN5(~na181_1), .IN6(1'b0), .IN7(~na182_1), .IN8(1'b0),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x70y114     80'h00_0018_00_0000_0C88_A5FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a4_1 ( .OUT(na4_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na61_2), .IN6(1'b1), .IN7(na12_1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x67y112     80'h00_0018_00_0000_0888_A351
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a5_1 ( .OUT(na5_1), .IN1(~na61_2), .IN2(~na60_1), .IN3(~na12_1), .IN4(1'b1), .IN5(1'b1), .IN6(~na60_2), .IN7(na12_2), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x68y114     80'h00_0018_00_0000_0C88_7CFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a7_1 ( .OUT(na7_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(na60_1), .IN7(~na8_1), .IN8(~na239_2),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x68y113     80'h00_0018_00_0000_0C88_AAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a8_1 ( .OUT(na8_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na61_2), .IN6(1'b1), .IN7(na12_1), .IN8(1'b1),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX2b/D///      x71y119     80'h00_FA00_00_0040_0A50_0050
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a9_1 ( .OUT(na9_1_i), .IN1(1'b0), .IN2(1'b0), .IN3(~na130_1), .IN4(1'b1), .IN5(na10_2), .IN6(1'b0), .IN7(na185_1), .IN8(1'b0),
                   .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a9_2 ( .OUT(na9_1), .CLK(na142_1), .EN(na73_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na9_1_i) );
// C_///OR/      x65y113     80'h00_0060_00_0000_0C0E_FF0E
C_OR       #(.CPE_CFG (9'b0_1000_0000)) 
           _a10_4 ( .OUT(na10_2), .IN1(na61_2), .IN2(na190_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x68y111     80'h00_F600_80_0000_0C88_C3C3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_1 ( .OUT(na12_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_1), .IN7(1'b1), .IN8(na132_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a12_2 ( .OUT(na12_1), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a12_4 ( .OUT(na12_2_i), .IN1(1'b1), .IN2(~na13_1), .IN3(1'b1), .IN4(na132_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a12_5 ( .OUT(na12_2), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na12_2_i) );
// C_AND////D      x71y118     80'h00_FA18_00_0000_0888_33FA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a13_1 ( .OUT(na13_1), .IN1(na24_2), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_2), .IN7(1'b1), .IN8(~na39_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a13_5 ( .OUT(na13_2), .CLK(na142_1), .EN(na76_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na13_1) );
// C_AND/D//AND/D      x70y113     80'h00_F600_80_0000_0C88_A3C3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_1 ( .OUT(na15_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_1), .IN7(na138_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a15_2 ( .OUT(na15_1), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a15_4 ( .OUT(na15_2_i), .IN1(1'b1), .IN2(~na13_1), .IN3(1'b1), .IN4(na136_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a15_5 ( .OUT(na15_2), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na15_2_i) );
// C_AND/D//AND/D      x67y113     80'h00_F600_80_0000_0C88_A3C3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_1 ( .OUT(na16_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_1), .IN7(na138_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a16_2 ( .OUT(na16_1), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a16_4 ( .OUT(na16_2_i), .IN1(1'b1), .IN2(~na13_1), .IN3(1'b1), .IN4(na136_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a16_5 ( .OUT(na16_2), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na16_2_i) );
// C_///AND/      x69y109     80'h00_0060_00_0000_0C08_FF24
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a18_4 ( .OUT(na18_2), .IN1(~na228_2), .IN2(na227_2), .IN3(na20_2), .IN4(~na19_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D//AND/D      x72y112     80'h00_FE00_80_0000_0C88_A535
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a19_1 ( .OUT(na19_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na18_2), .IN6(1'b1), .IN7(na104_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a19_2 ( .OUT(na19_1), .CLK(na142_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na19_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a19_4 ( .OUT(na19_2_i), .IN1(~na18_2), .IN2(1'b1), .IN3(1'b1), .IN4(~na19_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a19_5 ( .OUT(na19_2), .CLK(na142_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na19_2_i) );
// C_AND/D//AND/D      x72y111     80'h00_FE00_80_0000_0C88_A5C5
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a20_1 ( .OUT(na20_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na18_2), .IN6(1'b1), .IN7(na104_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a20_2 ( .OUT(na20_1), .CLK(na142_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na20_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a20_4 ( .OUT(na20_2_i), .IN1(~na18_2), .IN2(1'b1), .IN3(1'b1), .IN4(na106_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a20_5 ( .OUT(na20_2), .CLK(na142_1), .EN(1'b1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na20_2_i) );
// C_ICOMP/D///      x72y118     80'h00_FA00_00_0000_0888_F953
C_ICOMP    #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_1 ( .OUT(na22_1_i), .IN1(1'b0), .IN2(na13_1), .IN3(na23_1), .IN4(1'b0), .IN5(na9_1), .IN6(na25_2), .IN7(1'b0), .IN8(1'b0),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a22_2 ( .OUT(na22_1), .CLK(na142_1), .EN(na74_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na22_1_i) );
// C_AND////      x72y117     80'h00_0018_00_0000_0C88_CAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a23_1 ( .OUT(na23_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na24_1), .IN6(1'b1), .IN7(1'b1), .IN8(na39_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////D      x69y115     80'h00_FA18_00_0000_0888_F5F3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a24_1 ( .OUT(na24_1), .IN1(1'b1), .IN2(~na13_2), .IN3(1'b1), .IN4(1'b1), .IN5(~na24_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a24_5 ( .OUT(na24_2), .CLK(na142_1), .EN(na76_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na24_1) );
// C_///ORAND/      x73y114     80'h00_0060_00_0000_0C08_FF5B
C_ORAND    #(.CPE_CFG (9'b0_1000_0000)) 
           _a25_4 ( .OUT(na25_2), .IN1(na193_2), .IN2(~na226_2), .IN3(~na20_2), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND/D///      x69y118     80'h00_F600_00_0000_0C88_C3FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_1 ( .OUT(na26_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_1), .IN7(1'b1), .IN8(na140_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a26_2 ( .OUT(na26_1), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na26_1_i) );
// C_ORAND////      x64y125     80'h00_0018_00_0000_0C88_ECFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a30_1 ( .OUT(na30_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(na189_2), .IN7(na198_1), .IN8(na196_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND///AND/      x65y121     80'h00_0078_00_0000_0C88_1111
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a33_1 ( .OUT(na33_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na237_2), .IN6(~na58_1), .IN7(~na49_2), .IN8(~na57_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a33_4 ( .OUT(na33_2), .IN1(~na43_2), .IN2(~na232_2), .IN3(~na40_2), .IN4(~na53_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND///AND/      x68y121     80'h00_0078_00_0000_0C88_1124
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a35_1 ( .OUT(na35_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na51_2), .IN6(~na235_2), .IN7(~na49_1), .IN8(~na53_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a35_4 ( .OUT(na35_2), .IN1(~na47_1), .IN2(na41_1), .IN3(na45_2), .IN4(~na55_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////D      x68y118     80'h00_FA18_00_0000_0888_FC3F
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_1 ( .OUT(na39_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_2), .IN5(1'b1), .IN6(na13_2), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a39_5 ( .OUT(na39_2), .CLK(na142_1), .EN(na76_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na39_1) );
// C_///AND/D      x72y117     80'h00_FA00_80_0000_0C08_FFAC
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a40_4 ( .OUT(na40_2_i), .IN1(1'b1), .IN2(na118_1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a40_5 ( .OUT(na40_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na40_2_i) );
// C_AND/D//AND/D      x65y114     80'h00_FA00_80_0000_0C88_ACA3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_1 ( .OUT(na41_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na118_2), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a41_2 ( .OUT(na41_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a41_4 ( .OUT(na41_2_i), .IN1(1'b1), .IN2(~na41_2), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a41_5 ( .OUT(na41_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na41_2_i) );
// C_AND/D//AND/D      x65y115     80'h00_FA00_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a43_1 ( .OUT(na43_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na120_2), .IN6(1'b1), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a43_2 ( .OUT(na43_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na43_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a43_4 ( .OUT(na43_2_i), .IN1(na120_1), .IN2(1'b1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a43_5 ( .OUT(na43_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na43_2_i) );
// C_AND/D//AND/D      x68y117     80'h00_FA00_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_1 ( .OUT(na45_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na122_2), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a45_2 ( .OUT(na45_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a45_4 ( .OUT(na45_2_i), .IN1(1'b1), .IN2(na122_1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a45_5 ( .OUT(na45_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na45_2_i) );
// C_AND/D//AND/D      x65y119     80'h00_FA00_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a47_1 ( .OUT(na47_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na124_2), .IN6(1'b1), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a47_2 ( .OUT(na47_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na47_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a47_4 ( .OUT(na47_2_i), .IN1(na124_1), .IN2(1'b1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a47_5 ( .OUT(na47_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na47_2_i) );
// C_AND/D//AND/D      x70y121     80'h00_FA00_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a49_1 ( .OUT(na49_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na126_2), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a49_2 ( .OUT(na49_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na49_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a49_4 ( .OUT(na49_2_i), .IN1(1'b1), .IN2(na126_1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a49_5 ( .OUT(na49_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na49_2_i) );
// C_AND/D//AND/D      x69y121     80'h00_FA00_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a51_1 ( .OUT(na51_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na109_2), .IN6(1'b1), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a51_2 ( .OUT(na51_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na51_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a51_4 ( .OUT(na51_2_i), .IN1(na109_1), .IN2(1'b1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a51_5 ( .OUT(na51_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na51_2_i) );
// C_AND/D//AND/D      x68y122     80'h00_FA00_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a53_1 ( .OUT(na53_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na111_2), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a53_2 ( .OUT(na53_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na53_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a53_4 ( .OUT(na53_2_i), .IN1(1'b1), .IN2(na111_1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a53_5 ( .OUT(na53_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na53_2_i) );
// C_AND/D//AND/D      x64y120     80'h00_FA00_80_0000_0C88_AAAA
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a55_1 ( .OUT(na55_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na113_2), .IN6(1'b1), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a55_2 ( .OUT(na55_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na55_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a55_4 ( .OUT(na55_2_i), .IN1(na113_1), .IN2(1'b1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a55_5 ( .OUT(na55_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na55_2_i) );
// C_AND/D//AND/D      x68y124     80'h00_FA00_80_0000_0C88_ACAC
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a57_1 ( .OUT(na57_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(na115_2), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a57_2 ( .OUT(na57_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na57_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a57_4 ( .OUT(na57_2_i), .IN1(1'b1), .IN2(na115_1), .IN3(na194_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a57_5 ( .OUT(na57_2), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na57_2_i) );
// C_AND/D///      x69y124     80'h00_FA00_00_0000_0C88_AAFF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a58_1 ( .OUT(na58_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na117_1), .IN6(1'b1), .IN7(na194_1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a58_2 ( .OUT(na58_1), .CLK(na142_1), .EN(na62_1), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na58_1_i) );
// C_AND/D//AND/D      x69y112     80'h00_F600_80_0000_0C88_A3A3
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a60_1 ( .OUT(na60_1_i), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(~na13_1), .IN7(na134_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0000)) 
           _a60_2 ( .OUT(na60_1), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na60_1_i) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a60_4 ( .OUT(na60_2_i), .IN1(1'b1), .IN2(~na13_1), .IN3(na134_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a60_5 ( .OUT(na60_2), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na60_2_i) );
// C_///AND/D      x69y113     80'h00_F600_80_0000_0C08_FFF1
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a61_4 ( .OUT(na61_2_i), .IN1(~na61_2), .IN2(~na13_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_D        #(.CPE_CFG (9'b0_0000_0100)) 
           _a61_5 ( .OUT(na61_2), .CLK(na142_1), .EN(~na75_2), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN(na61_2_i) );
// C_ORAND////      x69y119     80'h00_0018_00_0000_0C88_BCFF
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a62_1 ( .OUT(na62_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(na216_2), .IN7(na218_1), .IN8(~na39_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x69y111     80'h00_0018_00_0000_0888_152C
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a66_1 ( .OUT(na66_1), .IN1(1'b1), .IN2(na60_2), .IN3(na8_1), .IN4(~na19_1), .IN5(~na229_2), .IN6(1'b1), .IN7(~na20_1), .IN8(~na19_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND///AND/      x70y119     80'h00_0078_00_0000_0C88_C83A
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a68_1 ( .OUT(na68_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na24_1), .IN6(na219_1), .IN7(1'b1), .IN8(na39_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a68_4 ( .OUT(na68_2), .IN1(na24_1), .IN2(1'b1), .IN3(1'b1), .IN4(~na39_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x65y120     80'h00_0060_00_0000_0C08_FF88
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a70_4 ( .OUT(na70_2), .IN1(na43_2), .IN2(na232_2), .IN3(na40_2), .IN4(na53_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x65y120     80'h00_0018_00_0000_0C88_44FF
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a72_1 ( .OUT(na72_1), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(~na47_2), .IN6(na41_2), .IN7(~na45_1), .IN8(na55_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x71y113     80'h00_0018_00_0000_0888_134F
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a73_1 ( .OUT(na73_1), .IN1(1'b1), .IN2(1'b1), .IN3(~na20_2), .IN4(na39_1), .IN5(1'b1), .IN6(~na227_2), .IN7(~na20_1), .IN8(~na19_1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ANDXOR////      x72y120     80'h00_0018_00_0000_0C66_CEFF
C_ANDXOR   #(.CPE_CFG (9'b0_0000_0000)) 
           _a74_1 ( .OUT(na74_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(~na24_2), .IN6(~na13_2), .IN7(1'b1), .IN8(~na39_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x70y115     80'h00_0060_00_0000_0C08_FFF1
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a75_4 ( .OUT(na75_2), .IN1(~na73_1), .IN2(~na13_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ORAND////      x68y120     80'h00_0018_00_0000_0888_DFB3
C_ORAND    #(.CPE_CFG (9'b0_0000_0000)) 
           _a76_1 ( .OUT(na76_1), .IN1(1'b0), .IN2(~na241_2), .IN3(na218_1), .IN4(~na39_1), .IN5(1'b1), .IN6(1'b1), .IN7(~na68_2), .IN8(na230_2),
                    .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y121     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a87_1 ( .OUT(na87_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na53_2),
                    .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a87_4 ( .OUT(na87_2), .COUTY1(na87_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na53_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na53_2), .CINX(1'b0), .CINY1(na102_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y122     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a89_1 ( .OUT(na89_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na55_2),
                    .CINX(1'b0), .CINY1(na87_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a89_4 ( .OUT(na89_2), .COUTY1(na89_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na55_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na55_2), .CINX(1'b0), .CINY1(na87_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y123     80'h00_0078_00_0020_0C66_CFCF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a91_1 ( .OUT(na91_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(na57_2),
                    .CINX(1'b0), .CINY1(na89_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a91_4 ( .OUT(na91_2), .COUTY1(na91_4), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na57_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na57_2), .CINX(1'b0), .CINY1(na89_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x66y124     80'h00_0018_00_0010_0666_00FC
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a93_1 ( .OUT(na93_1), .COUTY1(na93_4), .IN1(1'b1), .IN2(na58_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0),
                    .IN8(1'b0), .CINX(1'b0), .CINY1(na91_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y116     80'h00_0078_00_0020_0C66_CAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a94_1 ( .OUT(na94_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b1), .IN8(na231_2),
                    .CINX(1'b0), .CINY1(na103_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a94_4 ( .OUT(na94_2), .COUTY1(na94_4), .IN1(na43_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na43_2), .IN6(1'b1), .IN7(1'b1),
                    .IN8(na231_2), .CINX(1'b0), .CINY1(na103_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y117     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a96_1 ( .OUT(na96_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b1), .IN7(na45_2), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na94_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a96_4 ( .OUT(na96_2), .COUTY1(na96_4), .IN1(1'b0), .IN2(1'b1), .IN3(na45_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b1), .IN7(na45_2),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na94_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y118     80'h00_0078_00_0020_0C66_FAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a98_1 ( .OUT(na98_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na47_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                    .CINX(1'b0), .CINY1(na96_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a98_4 ( .OUT(na98_2), .COUTY1(na98_4), .IN1(na47_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na47_2), .IN6(1'b1), .IN7(1'b1),
                    .IN8(1'b1), .CINX(1'b0), .CINY1(na96_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y119     80'h00_0078_00_0020_0C66_AFAF
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a100_1 ( .OUT(na100_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(1'b1), .IN7(na49_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na98_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a100_4 ( .OUT(na100_2), .COUTY1(na100_4), .IN1(1'b1), .IN2(1'b1), .IN3(na49_1), .IN4(1'b1), .IN5(1'b1), .IN6(1'b1), .IN7(na49_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na98_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y120     80'h00_0078_00_0020_0C66_FAFA
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a102_1 ( .OUT(na102_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na51_2), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a102_4 ( .OUT(na102_2), .COUTY1(na102_4), .IN1(na51_1), .IN2(1'b1), .IN3(1'b1), .IN4(1'b1), .IN5(na51_2), .IN6(1'b1), .IN7(1'b1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na100_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x66y115     80'h00_3F00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a103_2 ( .OUT(na103_1), .CLK(1'b1), .EN(1'b0), .SR(1'b1), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a103_6 ( .COUTY1(na103_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na103_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x70y111     80'h00_0078_00_0020_0C66_CAC0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a104_1 ( .OUT(na104_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na228_2), .IN6(1'b1), .IN7(1'b1), .IN8(na19_2),
                     .CINX(1'b0), .CINY1(na107_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a104_4 ( .OUT(na104_2), .COUTY1(na104_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na19_1), .IN5(na228_2), .IN6(1'b1), .IN7(1'b1),
                     .IN8(na19_2), .CINX(1'b0), .CINY1(na107_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x70y112     80'h00_0018_00_0010_0666_00A0
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a106_1 ( .OUT(na106_1), .IN1(1'b0), .IN2(1'b0), .IN3(na20_2), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na104_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y110     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a107_2 ( .OUT(na107_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a107_6 ( .COUTY1(na107_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na107_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x67y121     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a109_1 ( .OUT(na109_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na51_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na126_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a109_4 ( .OUT(na109_2), .COUTY1(na109_4), .IN1(na51_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na51_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na126_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y122     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a111_1 ( .OUT(na111_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na53_2),
                     .CINX(1'b0), .CINY1(na109_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a111_4 ( .OUT(na111_2), .COUTY1(na111_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na53_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na53_2), .CINX(1'b0), .CINY1(na109_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y123     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a113_1 ( .OUT(na113_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na55_2),
                     .CINX(1'b0), .CINY1(na111_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a113_4 ( .OUT(na113_2), .COUTY1(na113_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na55_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na55_2), .CINX(1'b0), .CINY1(na111_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y124     80'h00_0078_00_0020_0C66_C0C0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a115_1 ( .OUT(na115_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1), .IN8(na57_2),
                     .CINX(1'b0), .CINY1(na113_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a115_4 ( .OUT(na115_2), .COUTY1(na115_4), .IN1(1'b0), .IN2(1'b0), .IN3(1'b1), .IN4(na57_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b1),
                     .IN8(na57_2), .CINX(1'b0), .CINY1(na113_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x67y125     80'h00_0018_00_0010_0666_000C
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a117_1 ( .OUT(na117_1), .IN1(1'b1), .IN2(na58_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na115_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y116     80'h00_0078_00_0020_0C66_AC0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a118_1 ( .OUT(na118_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na41_2), .IN7(na40_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na127_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a118_4 ( .OUT(na118_2), .COUTY1(na118_4), .IN1(1'b1), .IN2(na41_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na41_2), .IN7(na40_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na127_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y117     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a120_1 ( .OUT(na120_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na118_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a120_4 ( .OUT(na120_2), .COUTY1(na120_4), .IN1(na43_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na43_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na118_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y118     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a122_1 ( .OUT(na122_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na45_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na120_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a122_4 ( .OUT(na122_2), .COUTY1(na122_4), .IN1(1'b0), .IN2(1'b0), .IN3(na45_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na45_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na120_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y119     80'h00_0078_00_0020_0C66_0A0A
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a124_1 ( .OUT(na124_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na47_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na122_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a124_4 ( .OUT(na124_2), .COUTY1(na124_4), .IN1(na47_1), .IN2(1'b1), .IN3(1'b0), .IN4(1'b0), .IN5(na47_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na122_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x67y120     80'h00_0078_00_0020_0C66_A0A0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a126_1 ( .OUT(na126_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na49_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na124_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a126_4 ( .OUT(na126_2), .COUTY1(na126_4), .IN1(1'b0), .IN2(1'b0), .IN3(na49_1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(na49_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na124_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x67y115     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a127_2 ( .OUT(na127_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a127_6 ( .COUTY1(na127_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na127_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x70y116     80'h00_0078_00_0020_0C66_5550
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a128_1 ( .OUT(na128_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(~na16_1), .IN6(1'b1), .IN7(~na15_2), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na131_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a128_4 ( .OUT(na128_2), .COUTY1(na128_4), .IN1(1'b0), .IN2(1'b0), .IN3(~na15_1), .IN4(1'b1), .IN5(~na16_1), .IN6(1'b1), .IN7(~na15_2),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na131_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x70y117     80'h00_0018_00_0010_0666_00F3
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a130_1 ( .OUT(na130_1), .IN1(1'b1), .IN2(~na26_1), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na128_4), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x70y115     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a131_2 ( .OUT(na131_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a131_6 ( .COUTY1(na131_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na131_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_ADDF2///ADDF2/      x66y110     80'h00_0078_00_0020_0C66_AAA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a132_1 ( .OUT(na132_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na61_2), .IN6(1'b1), .IN7(na12_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(na197_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a132_4 ( .OUT(na132_2), .COUTY1(na132_4), .IN1(1'b0), .IN2(1'b0), .IN3(na12_2), .IN4(1'b1), .IN5(na61_2), .IN6(1'b1), .IN7(na12_1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(na197_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y111     80'h00_0078_00_0020_0C66_0C0C
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a134_1 ( .OUT(na134_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na60_2), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na132_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a134_4 ( .OUT(na134_2), .COUTY1(na134_4), .IN1(1'b1), .IN2(na60_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b1), .IN6(na60_2), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na132_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y112     80'h00_0078_00_0020_0C66_0AA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a136_1 ( .OUT(na136_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na16_2), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na134_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a136_4 ( .OUT(na136_2), .COUTY1(na136_4), .IN1(1'b0), .IN2(1'b0), .IN3(na15_2), .IN4(1'b1), .IN5(na16_2), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na134_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF2///ADDF2/      x66y113     80'h00_0078_00_0020_0C66_0AA0
C_ADDF2    #(.CPE_CFG (9'b0_0010_0000)) 
           _a138_1 ( .OUT(na138_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na16_1), .IN6(1'b1), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na136_4), .PINX(1'b0), .PINY1(1'b0) );
C_ADDF2    #(.CPE_CFG (9'b0_1000_0000)) 
           _a138_4 ( .OUT(na138_2), .COUTY1(na138_4), .IN1(1'b0), .IN2(1'b0), .IN3(na15_1), .IN4(1'b1), .IN5(na16_1), .IN6(1'b1), .IN7(1'b0),
                     .IN8(1'b0), .CINX(1'b0), .CINY1(na136_4), .PINX(1'b0), .PINY1(1'b0) );
// C_ADDF////      x66y114     80'h00_0018_00_0010_0666_000C
C_ADDF     #(.CPE_CFG (9'b0_0010_0000)) 
           _a140_1 ( .OUT(na140_1), .IN1(1'b1), .IN2(na26_1), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(na138_4), .PINX(1'b0), .PINY1(1'b0) );
GLBOUT     #(.GLBOUT_CFG (64'h0000_0000_0000_0014)) 
           _a142 ( .GLB0(na142_1), .GLB1(_d0), .GLB2(_d1), .GLB3(_d2), .CLK_FB0(_d3), .CLK_FB1(_d4), .CLK_FB2(_d5), .CLK_FB3(_d6),
                   .CLK0_0(na188_6), .CLK0_90(na188_5), .CLK0_180(na188_4), .CLK0_270(na188_3), .CLK0_BYP(1'b0), .CLK1_0(1'b0), .CLK1_90(1'b0),
                   .CLK1_180(1'b0), .CLK1_270(1'b0), .CLK1_BYP(1'b0), .CLK2_0(1'b0), .CLK2_90(1'b0), .CLK2_180(1'b0), .CLK2_270(1'b0),
                   .CLK2_BYP(1'b0), .CLK3_0(1'b0), .CLK3_90(1'b0), .CLK3_180(1'b0), .CLK3_270(1'b0), .CLK3_BYP(1'b0), .USR_GLB0(1'b0),
                   .USR_GLB1(1'b0), .USR_GLB2(1'b0), .USR_GLB3(1'b0), .USR_FB0(1'b0), .USR_FB1(1'b0), .USR_FB2(1'b0), .USR_FB3(1'b0) );
// C_MX4b////      x65y111     80'h00_0018_00_0040_0AEE_005C
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a181_1 ( .OUT(na181_1), .IN1(1'b1), .IN2(na60_2), .IN3(~na12_2), .IN4(1'b1), .IN5(1'b0), .IN6(~na222_2), .IN7(~na12_1), .IN8(~na4_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x68y109     80'h00_0018_00_0040_0AF7_00C3
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a182_1 ( .OUT(na182_1), .IN1(1'b1), .IN2(~na223_2), .IN3(1'b1), .IN4(na239_2), .IN5(~na61_2), .IN6(~na1_2), .IN7(~na8_1),
                     .IN8(na240_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x71y109     80'h00_0018_00_0040_0AF0_0033
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a183_1 ( .OUT(na183_1), .IN1(1'b1), .IN2(~na60_2), .IN3(1'b1), .IN4(~na238_2), .IN5(na61_2), .IN6(na1_2), .IN7(na12_1), .IN8(na4_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x72y113     80'h00_0018_00_0040_0ABC_00AA
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a184_1 ( .OUT(na184_1), .IN1(na16_2), .IN2(1'b1), .IN3(na15_2), .IN4(1'b1), .IN5(na183_1), .IN6(na5_1), .IN7(1'b1), .IN8(~na7_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX4b////      x74y115     80'h00_0018_00_0040_0A60_00C3
C_MX4b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a185_1 ( .OUT(na185_1), .IN1(1'b1), .IN2(~na243_2), .IN3(1'b1), .IN4(na128_2), .IN5(1'b0), .IN6(na2_2), .IN7(na184_1), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
CPE_IBF    #(.BUF_CFG (72'h000001000000000090)) 
           _a186 ( .Y(na186_1), .I(CLK_10M_IN) );
CPE_OBF    #(.BUF_CFG (72'h000000000100010902)) 
           _a187 ( .O(TX_DATA_OUT), .A(na221_10) );
CC_PLL     #(.PLL_CFG (96'h01_CB_01_10_64_00_04_02_08_08_28_82),
             .REF_CLK(10.00),
             .OUT_CLK(100.00),
             .LOW_JITTER(1),
             .CI_FILTER_CONST(2),
             .CP_FILTER_CONST(4)) 
           _a188 ( .USR_PLL_LOCKED_STDY(_d7), .USR_PLL_LOCKED(na188_2), .CLK270(na188_3), .CLK180(na188_4), .CLK90(na188_5), .CLK0(na188_6),
                   .CLK_REF_OUT(_d8), .CLK_REF(na191_1), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0), .USR_LOCKED_STDY_RST(1'b0), .USR_SET_SEL(1'b0) );
// C_////RAM_I2      x1y128     80'h02_0000_00_0000_0C00_FFFF
C_RAM_I2   #(.CPE_CFG (9'bX_1000_0000)) 
           _a189_5 ( .OUT(na189_2), .CLK(1'b0), .EN(1'b0), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(na188_2), .CP_O(1'b0) );
// C_AND////      x71y112     80'h00_0018_00_0000_0888_5C58
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a190_1 ( .OUT(na190_1), .IN1(na16_2), .IN2(na60_1), .IN3(~na12_2), .IN4(1'b1), .IN5(1'b1), .IN6(na60_2), .IN7(~na12_1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
CLKIN      #(.CLKIN_CFG (32'h0000_0000)) 
           _a191 ( .PCLK0(na191_1), .PCLK1(_d9), .PCLK2(_d10), .PCLK3(_d11), .CLK0(na186_1), .CLK1(1'b0), .CLK2(1'b0), .CLK3(1'b0),
                   .SER_CLK(1'b0), .SPI_CLK(1'b0), .JTAG_CLK(1'b0) );
// C_///AND/      x73y113     80'h00_0060_00_0000_0C08_FF1F
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a193_4 ( .OUT(na193_2), .IN1(1'b1), .IN2(1'b1), .IN3(~na20_1), .IN4(~na19_2), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_MX2b////      x64y121     80'h00_0018_00_0040_0ACC_00F3
C_MX2b     #(.CPE_CFG (9'b0_0000_0000)) 
           _a194_1 ( .OUT(na194_1), .IN1(1'b1), .IN2(~na242_2), .IN3(1'b1), .IN4(1'b1), .IN5(1'b0), .IN6(1'b0), .IN7(~na30_1), .IN8(~na39_1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x64y124     80'h00_0018_00_0000_0888_2822
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a196_1 ( .OUT(na196_1), .IN1(na33_1), .IN2(~na41_2), .IN3(na35_1), .IN4(~na55_1), .IN5(na33_2), .IN6(na233_2), .IN7(na35_2),
                     .IN8(~na234_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_/C_0_1///      x66y109     80'h00_CF00_12_0800_0C00_FFFF
C_C_0_1    #(.CPE_CFG (9'bX_0000_0000)) 
           _a197_2 ( .OUT(na197_1), .CLK(1'b1), .EN(1'b1), .SR(1'b0), .CINY2(1'b0), .PINY2(1'b0), .RAM_I(1'b0), .CP_O(1'b0), .D_IN() );
C_CPlines  #(.CPE_CFG (19'h1_2080)) 
           _a197_6 ( .COUTY1(na197_4), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(na197_1),
                     .OUT2(1'b0), .COMP_OUT(1'b0) );
// C_Route1////      x66y125     80'h00_0018_00_0050_0C66_0000
C_Route1   #(.CPE_CFG (9'b0_0001_0000)) 
           _a198_1 ( .OUT(na198_1), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0), .CINX(1'b0),
                     .CINY1(na93_4), .PINX(1'b0), .PINY1(1'b0) );
// C_///OR/      x69y118     80'h00_0060_00_0000_0C0E_FFEC
C_OR       #(.CPE_CFG (9'b0_1000_0000)) 
           _a216_4 ( .OUT(na216_2), .IN1(1'b0), .IN2(na242_2), .IN3(na68_1), .IN4(na39_1), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x68y115     80'h00_0018_00_0000_0888_8812
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a218_1 ( .OUT(na218_1), .IN1(na66_1), .IN2(~na224_2), .IN3(~na15_1), .IN4(~na225_2), .IN5(na16_2), .IN6(na26_1), .IN7(na12_2),
                     .IN8(na238_2), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_OR////      x69y122     80'h00_0018_00_0000_0EEE_3373
C_OR       #(.CPE_CFG (9'b0_0000_0000)) 
           _a219_1 ( .OUT(na219_1), .IN1(1'b0), .IN2(~na236_2), .IN3(~na49_2), .IN4(~na57_2), .IN5(1'b0), .IN6(~na58_1), .IN7(1'b0),
                     .IN8(~na220_1), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_AND////      x70y118     80'h00_0018_00_0000_0888_5424
C_AND      #(.CPE_CFG (9'b0_0000_0000)) 
           _a220_1 ( .OUT(na220_1), .IN1(~na51_2), .IN2(na70_2), .IN3(na35_2), .IN4(~na53_2), .IN5(~na51_1), .IN6(na72_1), .IN7(~na49_1),
                     .IN8(1'b1), .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
// C_///AND/      x101y128     80'h08_0060_00_0000_0C08_FFCF
C_AND      #(.CPE_CFG (9'b0_1000_0000)) 
           _a221_4 ( .OUT(na221_2), .IN1(1'b1), .IN2(1'b1), .IN3(1'b1), .IN4(na22_1), .IN5(1'b1), .IN6(1'b1), .IN7(1'b1), .IN8(1'b1),
                     .CINX(1'b0), .CINY1(1'b0), .PINX(1'b0), .PINY1(1'b0) );
C_CPlines  #(.CPE_CFG (19'h0_0000)) 
           _a221_6 ( .RAM_O2(na221_10), .CINX(1'b0), .CINY1(1'b0), .CINY2(1'b0), .PINX(1'b0), .PINY1(1'b0), .PINY2(1'b0), .OUT1(1'b0),
                     .OUT2(na221_2), .COMP_OUT(1'b0) );
// C_////Bridge      x67y110     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a222_5 ( .OUT(na222_2), .IN1(1'b0), .IN2(1'b0), .IN3(na8_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x69y110     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a223_5 ( .OUT(na223_2), .IN1(1'b0), .IN2(1'b0), .IN3(na12_2), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x71y116     80'h00_00A6_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a224_5 ( .OUT(na224_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na15_2), .IN8(1'b0) );
// C_////Bridge      x72y116     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a225_5 ( .OUT(na225_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na16_1), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x75y114     80'h00_00A7_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a226_5 ( .OUT(na226_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(na19_1) );
// C_////Bridge      x71y112     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a227_5 ( .OUT(na227_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na19_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x71y109     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a228_5 ( .OUT(na228_2), .IN1(1'b0), .IN2(1'b0), .IN3(na20_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x71y111     80'h00_00A6_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a229_5 ( .OUT(na229_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na20_2), .IN8(1'b0) );
// C_////Bridge      x70y120     80'h00_00A6_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a230_5 ( .OUT(na230_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(na30_1), .IN8(1'b0) );
// C_////Bridge      x68y116     80'h00_00A5_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a231_5 ( .OUT(na231_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(na41_1), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x63y118     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a232_5 ( .OUT(na232_2), .IN1(na43_1), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x65y124     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a233_5 ( .OUT(na233_2), .IN1(1'b0), .IN2(1'b0), .IN3(na45_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x66y124     80'h00_00A0_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a234_5 ( .OUT(na234_2), .IN1(na47_2), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x65y122     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a235_5 ( .OUT(na235_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na51_1), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x71y122     80'h00_00A7_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a236_5 ( .OUT(na236_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(na57_1) );
// C_////Bridge      x63y119     80'h00_00A3_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a237_5 ( .OUT(na237_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(na57_2), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x70y110     80'h00_00A5_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a238_5 ( .OUT(na238_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(na60_1), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x70y112     80'h00_00A1_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a239_5 ( .OUT(na239_2), .IN1(1'b0), .IN2(na60_2), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x70y108     80'h00_00A4_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a240_5 ( .OUT(na240_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(na61_2), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x69y120     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a241_5 ( .OUT(na241_2), .IN1(1'b0), .IN2(1'b0), .IN3(na68_1), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x65y118     80'h00_00A2_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a242_5 ( .OUT(na242_2), .IN1(1'b0), .IN2(1'b0), .IN3(na68_2), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(1'b0) );
// C_////Bridge      x75y116     80'h00_00A7_00_0000_0C00_FFFF
C_Bridge   #(.CPE_CFG (9'bX_0000_1001)) 
           _a243_5 ( .OUT(na243_2), .IN1(1'b0), .IN2(1'b0), .IN3(1'b0), .IN4(1'b0), .IN5(1'b0), .IN6(1'b0), .IN7(1'b0), .IN8(na128_1) );
endmodule
