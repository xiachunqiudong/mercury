module rom(
  input  logic [31:7]  raddr,
  output logic [127:0] rdata
);

  logic [127:0] mem [1024:0];

  assign rdata = mem[raddr[16:7]];

  initial begin
    
  end

endmodule