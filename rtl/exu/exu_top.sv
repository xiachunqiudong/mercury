module exu_top(
  input  logic        clk,
  input  logic        rst,
  input  logic        ifu_instA_valid,
  output logic        ifu_instA_allowIn,
  input  logic [31:0] ifu_instA_data,
  input  logic        ifu_instB_valid,
  output logic        ifu_instB_allowIn,
  input  logic [31:0] ifu_instB_data,
  input  logic        ifu_instC_valid,
  output logic        ifu_instC_allowIn,
  input  logic [31:0] ifu_instC_data,
  input  logic        ifu_instD_valid,
  output logic        ifu_instD_allowIn,
  input  logic [31:0] ifu_instD_data
);

  exu_decoder
  laneA_decoder(
    .inst (ifu_instA_data),
    .lsrc1(),
    .lsrc2(),
    .ldst ()
  );






endmodule