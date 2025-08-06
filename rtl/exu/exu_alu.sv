import mercury_pkg::*;

module exu_alu(
  input  logic        s0_valid,
  input  alu_op_t     s0_alu_op,
  input  logic [63:0] s0_alu_operandA,
  input  logic [63:0] s0_alu_operandB,
  output logic [63:0] s0_alu_result
);


  logic [63:0] s0_add_result;
  logic [63:0] s0_and_result;
  logic [63:0] s0_or_result;
  logic [63:0] s0_xor_result;
  logic [63:0] s0_sll_result;
  logic [63:0] s0_srl_result;
  logic [63:0] s0_sra_result;
  
  assign s0_add_result[63:0] = s0_alu_operandA[63:0] + s0_alu_operandB[63:0];
  assign s0_and_result[63:0] = s0_alu_operandA[63:0] & s0_alu_operandB[63:0];
  assign s0_or_result[63:0]  = s0_alu_operandA[63:0] | s0_alu_operandB[63:0];
  assign s0_xor_result[63:0] = s0_alu_operandA[63:0] ^ s0_alu_operandB[63:0];


endmodule