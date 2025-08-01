module ifu_top(
  input               clk,
  input               rst,
  output logic        ifu_instA_valid,
  input  logic        ifu_instA_allowIn,
  output logic [31:0] ifu_instA_data,
  output logic        ifu_instB_valid,
  input  logic        ifu_instB_allowIn,
  output logic [31:0] ifu_instB_data,
  output logic        ifu_instC_valid,
  input  logic        ifu_instC_allowIn,
  output logic [31:0] ifu_instC_data,
  output logic        ifu_instD_valid,
  input  logic        ifu_instD_allowIn,
  output logic [31:0] ifu_instD_data
);


endmodule