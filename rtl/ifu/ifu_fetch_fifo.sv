import mercury_pkg::fetch_entry_t;

module ifu_fetch_fifo #(
  parameter ADDR_WIDTH = 2,
  parameter ARRAY_SIZE = 1 << ADDR_WIDTH
) (
  input  logic        clk,
  input  logic        rst,
  input  logic        push,
  input  logic        pop,
  input  logic [31:0] fetch_entry_In,
  output logic [31:0] fetch_entry_Q
);

  logic               [ADDR_WIDTH-1:0]        read_ptr_In;
  logic               [ADDR_WIDTH-1:0]        read_ptr_Q;
  logic               [ADDR_WIDTH-1:0]        write_ptr_In;
  logic               [ADDR_WIDTH-1:0]        write_ptr_Q;
  fetch_entry_t                               fetch_entry_array_In [ARRAY_SIZE-1:0];
  fetch_entry_t                               fetch_entry_array_Q  [ARRAY_SIZE-1:0];

//-----------------------------------------------------------------
//                    push entry into array
//-----------------------------------------------------------------
  assign write_ptr_In[ADDR_WIDTH-1:0] = write_ptr_Q[ADDR_WIDTH-1:0] + 'd1;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      write_ptr_Q[ADDR_WIDTH-1:0] <= 'd0;
    end
    else if(push) begin
      write_ptr_Q[ADDR_WIDTH-1:0] <= write_ptr_In[ADDR_WIDTH-1:0];
    end
  end

  always_comb begin
    fetch_entry_array_In = fetch_entry_array_Q;
    if (push) begin
      fetch_entry_array_In[write_ptr_Q] = fetch_entry_In;
    end
  end

  always_ff @(posedge clk) begin
    if (push) begin
      fetch_entry_array_Q <= fetch_entry_array_In;
    end
  end

// read
  assign read_ptr_In[ADDR_WIDTH-1:0] = read_ptr_Q[ADDR_WIDTH-1:0] + 'd1;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      read_ptr_Q[ADDR_WIDTH-1:0] <= 'd0;
    end
    else if(pop) begin
      read_ptr_Q[ADDR_WIDTH-1:0] <= read_ptr_In[ADDR_WIDTH-1:0];
    end
  end

  assign fetch_entry_Q = fetch_entry_array_Q[read_ptr_Q];

endmodule