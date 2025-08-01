module sim_tb;

  logic clk;
  logic rst;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
    #10 rst = 1'b0;
  end

  always begin
    #5 clk = ~clk;
  end

  mercury_top 
  mercury (
    .clk(clk),
    .rst(rst)
  );

  initial begin
    $fsdbDumpfile("sim.fsdb");
    $fsdbDumpvars(0, sim_tb);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpon;
    #10000
    $fsdbDumpoff;
    $finish;
  end

endmodule