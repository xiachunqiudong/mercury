import mercury_pkg::*;

module exu_decoder(
  input  logic [31:0] inst,
  output logic [4:0]  lsrc1,
  output logic [4:0]  lsrc2,
  output logic [4:0]  ldst
);

  logic [6:0] inst_opcode;
  logic [2:0] inst_func3;

  opcode_t uop_opcode;

  assign inst_opcode[6:0] = inst[6:0];
  assign inst_func3[2:0]  = inst[14:12];

  always_comb begin
    case(inst_opcode[6:0])
      7'b011_0111: uop_opcode = LUI;
      7'b001_0111: uop_opcode = AUIPC;
      7'b110_1111: uop_opcode = JAL;
      7'b110_0111: uop_opcode = JALR;
      7'b110_0011: uop_opcode = BRANCH;
      7'b000_0011: uop_opcode = LOAD;
      7'b010_0011: uop_opcode = STORE;
      7'b001_0011: uop_opcode = ALUI;
      7'b011_0011: uop_opcode = ALU;
      7'b000_1111: uop_opcode = FENCE;
      7'b111_0011: uop_opcode = ENV;
      default:     uop_opcode = NONE;
    endcase
  end

endmodule