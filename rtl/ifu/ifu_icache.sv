//=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ICACHE
// CACHE SIZE: 32KB
// WAY:        2 way
// CACHELINE:  128bit x 2
// SET NUM:    512
//=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

module ifu_icache (
  input logic        clk,
  input logic        rst,
  input logic        icache_read_req,
  input logic [31:5] icache_read_addr
);

  // cacheline data array way0 bank0
  // cacheline data array way0 bank1
  // cacheline data array way1 bank0
  // cacheline data array way1 bank1


endmodule