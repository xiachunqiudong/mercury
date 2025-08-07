import mercury_pkg::*;

module exu_alu(
  input  logic        s0_valid,
  input  alu_op_t     s0_alu_op,
  input  logic [63:0] s0_alu_operandA,
  input  logic [63:0] s0_alu_operandB,
  output logic [63:0] s0_alu_result
);

  logic        s0_lt;
  logic        s0_ltu;

  logic        s0_adder_cin;
  logic        s0_adder_cout;
  logic [63:0] s0_adder_operandB;
  logic [63:0] s0_adder_result;

  logic [63:0] s0_and_result;
  logic [63:0] s0_or_result;
  logic [63:0] s0_xor_result;

  logic [63:0] s0_slt_result;
  logic [63:0] s0_sltu_result;

  logic [5:0]  s0_shamt;
  logic [63:0] s0_sll_result;
  logic [63:0] s0_srl_result;
  logic [63:0] s0_sra_result;

//--------------------------------------------------------
//                    S0 CTRL INFO
//--------------------------------------------------------
  assign s0_need_sub = s0_alu_op inside {SUB, SLT, SLTU};

  assgin s0_adder_operandB[63:0] = s0_need_sub ? ~s0_alu_operandB[63:0]
                                               :  s0_alu_operandB[63:0];

  assign {s0_adder_cout, s0_adder_result[63:0]} = s0_alu_operandA[63:0] + s0_adder_operandB[63:0] + s0_need_sub;

  assign s0_lt = s0_alu_operandA[63] & ~s0_alu_operandB[63]
               | ~(s0_alu_operandA[63] ^ s0_alu_operandB[63]) & s0_adder_result[63];

  assign s0_ltu = ~s0_adder_cout;

  assign s0_and_result[63:0]  = s0_alu_operandA[63:0] & s0_alu_operandB[63:0];
  assign s0_or_result[63:0]   = s0_alu_operandA[63:0] | s0_alu_operandB[63:0];
  assign s0_xor_result[63:0]  = s0_alu_operandA[63:0] ^ s0_alu_operandB[63:0];
  assign s0_slt_result[63:0]  = {63'b0, s0_lt};
  assign s0_sltu_result[63:0] = {63'b0, s0_ltu};
  assign s0_sll_result[63:0]  = s0_alu_operandA[63:0] << s0_shamt[5:0];
  assign s0_srl_result[63:0]  = s0_alu_operandA[63:0] >> s0_shamt[5:0];
  assign s0_sra_result[63:0]  = $signed(s0_alu_operandA[63:0]) >>> s0_shamt[5:0];

  // result mux
  always_comb begin
    case(s0_alu_op)
      ADD     : s0_alu_result[63:0] = s0_adder_result[63:0];
      AND     : s0_alu_result[63:0] = s0_and_result[63:0];
      OR      : s0_alu_result[63:0] = s0_or_result[63:0];
      XOR     : s0_alu_result[63:0] = s0_xor_result[63:0];
      SLT     : s0_alu_result[63:0] = s0_slt_result[63:0];
      SLTU    : s0_alu_result[63:0] = s0_sltu_result[63:0];
      SLL     : s0_alu_result[63:0] = s0_sll_result[63:0];
      SRL     : s0_alu_result[63:0] = s0_srl_result[63:0];
      SRA     : s0_alu_result[63:0] = s0_sra_result[63:0];
      default : s0_alu_result[63:0] = 64'b0;
    endcase
  end

endmodule