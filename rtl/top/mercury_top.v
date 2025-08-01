module mercury_top(
  input logic clk,
  input logic rst
);

  logic        ifu_instA_valid;
  logic        ifu_instA_allowIn;
  logic [31:0] ifu_instA_data;
  logic        ifu_instB_valid;
  logic        ifu_instB_allowIn;
  logic [31:0] ifu_instB_data;
  logic        ifu_instC_valid;
  logic        ifu_instC_allowIn;
  logic [31:0] ifu_instC_data;
  logic        ifu_instD_valid;
  logic        ifu_instD_allowIn;
  logic [31:0] ifu_instD_data;

  ifu_top
  ifu (
    .clk              (),
    .rst              (),
    .ifu_instA_valid  (ifu_instA_valid),
    .ifu_instA_allowIn(ifu_instA_allowIn),
    .ifu_instA_data   (ifu_instA_data[31:0]),
    .ifu_instB_valid  (ifu_instB_valid),
    .ifu_instB_allowIn(ifu_instB_allowIn),
    .ifu_instB_data   (ifu_instB_data[31:0]),
    .ifu_instC_valid  (ifu_instC_valid),
    .ifu_instC_allowIn(ifu_instC_allowIn),
    .ifu_instC_data   (ifu_instC_data[31:0]),
    .ifu_instD_valid  (ifu_instD_valid),
    .ifu_instD_allowIn(ifu_instD_allowIn),
    .ifu_instD_data   (ifu_instD_data[31:0])
  );

  exu_top
  exu (
    .clk              (),
    .rst              (),
    .ifu_instA_valid  (ifu_instA_valid),
    .ifu_instA_allowIn(ifu_instA_allowIn),
    .ifu_instA_data   (ifu_instA_data[31:0]),
    .ifu_instB_valid  (ifu_instB_valid),
    .ifu_instB_allowIn(ifu_instB_allowIn),
    .ifu_instB_data   (ifu_instB_data[31:0]),
    .ifu_instC_valid  (ifu_instC_valid),
    .ifu_instC_allowIn(ifu_instC_allowIn),
    .ifu_instC_data   (ifu_instC_data[31:0]),
    .ifu_instD_valid  (ifu_instD_valid),
    .ifu_instD_allowIn(ifu_instD_allowIn),
    .ifu_instD_data   (ifu_instD_data[31:0])
  );

endmodule
