package mercury_pkg;

  typedef enum {
    NONE,
    LUI,
    AUIPC,
    JAL, JALR,
    BEQ, BNE, BLT, BGE, BLTU, BGEU,
    LB, LH, LW, LBU, LHU, LWU, LD,
    SB, SH, SW, SD,
    ADDI, ADDIW, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SLLIW, SRLI, SRLIW, SRAI, SRAIW,
    ADD, ADDW, SUB, SUBW, SLL, SLLW, SLT, SLTU, XOR, SRL, SRLW, SRA, SRAW, OR, AND,
    FENCE, FENCE_TSO,
    PAUSE,
    ENV
  } opcode1_t;

  typedef enum {
    NONE,
    LUI,
    AUIPC,
    JAL, JALR, BRANCH,
    LOAD, STORE,
    FENCE,
    ECALL, EBREAK
  } opcode_t;

  typedef enum {
    ADD, SUB,
    AND, OR, XOR,
    SLT, SLTU,
    SLL, SRL, SRA
  } alu_op_t;

  typedef struct packed {
    logic [4:0] lsrc1;
    logic [4:0] lsrc2;
    logic [4:0] ldst;
  } uop_info_t;

endpackage