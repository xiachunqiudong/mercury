module ifu_fetch(
  input  logic        clk,
  input  logic        rst,
  output logic [31:0] fetch_instA,
  output logic [31:0] fetch_instB,
  output logic [31:0] fetch_instC,
  output logic [31:0] fetch_instD
);


  logic [63:0] pc_Q;
  logic [127:0] inst;

  assign fetch_instA[31:0] = inst[31:0];

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      pc_Q <= 'd0;
    end
    else begin
      pc_Q <= 'd0;
    end
  end


  rom
  u_rom(
    .raddr(pc_Q),
    .rdata(inst)
  );

endmodule