// Simulation stub for CC_PLL (Cologne Chip)
module CC_PLL #(
    parameter REF_CLK = "10.0",
    parameter OUT_CLK = "100.0",
    parameter PERF_MD = "ECONOMY",
    parameter LOW_JITTER = 1,
    parameter CI_FILTER_CONST = 2,
    parameter CP_FILTER_CONST = 4
)(
    input CLK_REF,
    input USR_CLK_REF,
    input CLK_FEEDBACK,
    input USR_LOCKED_STDY_RST,
    output USR_PLL_LOCKED_STDY,
    output USR_PLL_LOCKED,
    output CLK0,
    output CLK90,
    output CLK180,
    output CLK270,
    output CLK_REF_OUT
);
    assign CLK0 = CLK_REF;       // Pass-through for simulation
    assign CLK90 = CLK_REF;
    assign CLK180 = CLK_REF;
    assign CLK270 = CLK_REF;
    assign CLK_REF_OUT = CLK_REF;
    assign USR_PLL_LOCKED_STDY = 1'b1;
    assign USR_PLL_LOCKED = 1'b1;
endmodule
