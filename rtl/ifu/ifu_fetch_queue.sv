//=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// IFU INST QUEUE
// CACHE SIZE: 32
// Write ports: 8
// Read  ports: 4
//=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

module ifu_fetch_queue(
  input  logic        clk,
  input  logic        rst,
  input  logic [7:0]  input_inst_valid_num_dcd,
  input  logic        input_inst0_valid,
  input  logic [31:0] input_inst0,
  input  logic        input_inst1_valid,
  input  logic [31:0] input_inst1,
  input  logic        input_inst2_valid,
  input  logic [31:0] input_inst2,
  input  logic        input_inst3_valid,
  input  logic [31:0] input_inst3,
  input  logic        input_inst4_valid,
  input  logic [31:0] input_inst4,
  input  logic        input_inst5_valid,
  input  logic [31:0] input_inst5,
  input  logic        input_inst6_valid,
  input  logic [31:0] input_inst6,
  input  logic        input_inst7_valid,
  input  logic [31:0] input_inst7,
  output logic        output_inst0_valid,
  output logic [31:0] output_inst0,
  output logic        output_inst1_valid,
  output logic [31:0] output_inst1,
  output logic        output_inst2_valid,
  output logic [31:0] output_inst2,
  output logic        output_inst3_valid,
  output logic [31:0] output_inst3
);

  logic       bank_write_ptr_G;
  logic [7:0] bank_write_ptr_In;
  logic [7:0] bank_write_ptr_Q;
  logic       bank_read_ptr_G;
  logic [7:0] bank_read_ptr_In;
  logic [7:0] bank_read_ptr_Q;

  logic        bank0_inst_push;
  logic        bank1_inst_push;
  logic        bank2_inst_push;
  logic        bank3_inst_push;
  logic        bank4_inst_push;
  logic        bank5_inst_push;
  logic        bank6_inst_push;
  logic        bank7_inst_push;
  logic        bank0_inst_pop;
  logic        bank1_inst_pop;
  logic        bank2_inst_pop;
  logic        bank3_inst_pop;
  logic        bank4_inst_pop;
  logic        bank5_inst_pop;
  logic        bank6_inst_pop;
  logic        bank7_inst_pop;

  logic [31:0] bank0_inst_In;
  logic [31:0] bank1_inst_In;
  logic [31:0] bank2_inst_In;
  logic [31:0] bank3_inst_In;
  logic [31:0] bank4_inst_In;
  logic [31:0] bank5_inst_In;
  logic [31:0] bank6_inst_In;
  logic [31:0] bank7_inst_In;

  logic [31:0] bank0_inst_Q;
  logic [31:0] bank1_inst_Q;
  logic [31:0] bank2_inst_Q;
  logic [31:0] bank3_inst_Q;
  logic [31:0] bank4_inst_Q;
  logic [31:0] bank5_inst_Q;
  logic [31:0] bank6_inst_Q;
  logic [31:0] bank7_inst_Q;

  assign bank_write_ptr_In[7:0] = input_inst_valid_num_dcd[0] & {bank_write_ptr_Q[6:0], bank_write_ptr_Q[7]}   // 1 valid inst num
                                | input_inst_valid_num_dcd[1] & {bank_write_ptr_Q[5:0], bank_write_ptr_Q[7:6]} // 2 valid inst num
                                | input_inst_valid_num_dcd[2] & {bank_write_ptr_Q[4:0], bank_write_ptr_Q[7:5]} // 3 valid inst num
                                | input_inst_valid_num_dcd[3] & {bank_write_ptr_Q[3:0], bank_write_ptr_Q[7:4]} // 4 valid inst num
                                | input_inst_valid_num_dcd[4] & {bank_write_ptr_Q[2:0], bank_write_ptr_Q[7:3]} // 5 valid inst num
                                | input_inst_valid_num_dcd[5] & {bank_write_ptr_Q[1:0], bank_write_ptr_Q[7:2]} // 6 valid inst num
                                | input_inst_valid_num_dcd[6] & {bank_write_ptr_Q[0]  , bank_write_ptr_Q[7:1]};// 7 valid inst num

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      bank_write_ptr_Q[7:0] <= 8'b0000_0001;
    end
    else if (bank_write_ptr_G) begin
      bank_write_ptr_Q[7:0] <= bank_write_ptr_In[7:0];
    end
  end

  assign bank0_inst_push = bank_write_ptr_Q[0] & input_inst0_valid
                         | bank_write_ptr_Q[1] & input_inst7_valid
                         | bank_write_ptr_Q[2] & input_inst6_valid
                         | bank_write_ptr_Q[3] & input_inst5_valid
                         | bank_write_ptr_Q[4] & input_inst4_valid
                         | bank_write_ptr_Q[5] & input_inst3_valid
                         | bank_write_ptr_Q[6] & input_inst2_valid
                         | bank_write_ptr_Q[7] & input_inst1_valid;

  assign bank1_inst_push = bank_write_ptr_Q[0] & input_inst1_valid
                         | bank_write_ptr_Q[1] & input_inst0_valid
                         | bank_write_ptr_Q[2] & input_inst7_valid
                         | bank_write_ptr_Q[3] & input_inst6_valid
                         | bank_write_ptr_Q[4] & input_inst5_valid
                         | bank_write_ptr_Q[5] & input_inst4_valid
                         | bank_write_ptr_Q[6] & input_inst3_valid
                         | bank_write_ptr_Q[7] & input_inst2_valid;

  assign bank2_inst_push = bank_write_ptr_Q[0] & input_inst2_valid
                         | bank_write_ptr_Q[1] & input_inst1_valid
                         | bank_write_ptr_Q[2] & input_inst0_valid
                         | bank_write_ptr_Q[3] & input_inst7_valid
                         | bank_write_ptr_Q[4] & input_inst6_valid
                         | bank_write_ptr_Q[5] & input_inst5_valid
                         | bank_write_ptr_Q[6] & input_inst4_valid
                         | bank_write_ptr_Q[7] & input_inst3_valid;

  assign bank3_inst_push = bank_write_ptr_Q[0] & input_inst3_valid
                         | bank_write_ptr_Q[1] & input_inst2_valid
                         | bank_write_ptr_Q[2] & input_inst1_valid
                         | bank_write_ptr_Q[3] & input_inst0_valid
                         | bank_write_ptr_Q[4] & input_inst7_valid
                         | bank_write_ptr_Q[5] & input_inst6_valid
                         | bank_write_ptr_Q[6] & input_inst5_valid
                         | bank_write_ptr_Q[7] & input_inst4_valid;

  assign bank4_inst_push = bank_write_ptr_Q[0] & input_inst4_valid
                         | bank_write_ptr_Q[1] & input_inst3_valid
                         | bank_write_ptr_Q[2] & input_inst2_valid
                         | bank_write_ptr_Q[3] & input_inst1_valid
                         | bank_write_ptr_Q[4] & input_inst0_valid
                         | bank_write_ptr_Q[5] & input_inst7_valid
                         | bank_write_ptr_Q[6] & input_inst6_valid
                         | bank_write_ptr_Q[7] & input_inst5_valid;

  assign bank5_inst_push = bank_write_ptr_Q[0] & input_inst5_valid
                         | bank_write_ptr_Q[1] & input_inst4_valid
                         | bank_write_ptr_Q[2] & input_inst3_valid
                         | bank_write_ptr_Q[3] & input_inst2_valid
                         | bank_write_ptr_Q[4] & input_inst1_valid
                         | bank_write_ptr_Q[5] & input_inst0_valid
                         | bank_write_ptr_Q[6] & input_inst7_valid
                         | bank_write_ptr_Q[7] & input_inst6_valid;

  assign bank6_inst_push = bank_write_ptr_Q[0] & input_inst6_valid
                         | bank_write_ptr_Q[1] & input_inst5_valid
                         | bank_write_ptr_Q[2] & input_inst4_valid
                         | bank_write_ptr_Q[3] & input_inst3_valid
                         | bank_write_ptr_Q[4] & input_inst2_valid
                         | bank_write_ptr_Q[5] & input_inst1_valid
                         | bank_write_ptr_Q[6] & input_inst0_valid
                         | bank_write_ptr_Q[7] & input_inst7_valid;

  assign bank7_inst_push = bank_write_ptr_Q[0]& input_inst7_valid
                         | bank_write_ptr_Q[1]& input_inst6_valid
                         | bank_write_ptr_Q[2]& input_inst5_valid
                         | bank_write_ptr_Q[3]& input_inst4_valid
                         | bank_write_ptr_Q[4]& input_inst3_valid
                         | bank_write_ptr_Q[5]& input_inst2_valid
                         | bank_write_ptr_Q[6]& input_inst1_valid
                         | bank_write_ptr_Q[7]& input_inst0_valid;

  assign bank0_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst1[31:0];

  assign bank1_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst2[31:0];

  assign bank2_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst3[31:0];

  assign bank3_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst4[31:0];

  assign bank4_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst5[31:0];

  assign bank5_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst6[31:0];

  assign bank6_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst0[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst7[31:0];

  assign bank7_inst_In[31:0] = {32{bank_write_ptr_Q[0]}} & input_inst7[31:0]
                             | {32{bank_write_ptr_Q[1]}} & input_inst6[31:0]
                             | {32{bank_write_ptr_Q[2]}} & input_inst5[31:0]
                             | {32{bank_write_ptr_Q[3]}} & input_inst4[31:0]
                             | {32{bank_write_ptr_Q[4]}} & input_inst3[31:0]
                             | {32{bank_write_ptr_Q[5]}} & input_inst2[31:0]
                             | {32{bank_write_ptr_Q[6]}} & input_inst1[31:0]
                             | {32{bank_write_ptr_Q[7]}} & input_inst0[31:0];

endmodule