//--------------------------------------
// ROM SIZE   : 4M
// DATA WIDTH : 128 bit
//--------------------------------------
module rom #(
  parameter DATA_WIDTH = 128,
  parameter ADDR_WIDTH = 25
) (
  input  logic [ADDR_WIDTH-1:0] raddr,
  output logic [DATA_WIDTH-1:0] rdata
);

  parameter DATA_ADDR_WIDTH  = $clog2(DATA_WIDTH);
  parameter ARRAY_ADDR_WIDTH = ADDR_WIDTH - DATA_ADDR_WIDTH;
  parameter ARRAY_SIZE       = 1 << ARRAY_ADDR_WIDTH;

  logic [DATA_WIDTH-1:0] mem [ARRAY_SIZE-1:0];

  assign rdata[DATA_WIDTH-1:0] = mem[raddr[ADDR_WIDTH-1:DATA_ADDR_WIDTH]];

  string rom_init_filename = "/home/host/project/mercury/sim/case/demo/demo.hex";

  initial begin
    $readmemh(rom_init_filename, mem);
  end

endmodule