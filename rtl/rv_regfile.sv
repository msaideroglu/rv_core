module rv_regfile(
    input  logic        clk_i, 

    input  logic        write_en_i,
    input  logic [31:0] write_data_i,  
    input  logic [ 4:0] write_addr_i,

    input  logic [ 4:0] read_addr1_i, 
    input  logic [ 4:0] read_addr2_i,  
    output logic [31:0] read_data1_o, 
    output logic [31:0] read_data2_o
    );

  logic [31:0] regs [0:31];

  always_ff @(posedge clk_i) begin
    if (write_en_i) begin 
      regs[write_addr_i] <= write_data_i;
    end
  end	

  assign read_data1_o = (read_addr1_i != 5'b0) ? regs[read_addr1_i] : 32'b0;
  assign read_data2_o = (read_addr2_i != 5'b0) ? regs[read_addr2_i] : 32'b0;

endmodule






