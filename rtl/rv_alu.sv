module rv_alu(
    input  logic [31:0] a_i, b_i,
    input  logic [3:0]  aluctrl_i, 
    output logic [31:0] result_o    
    );

  always_comb begin
    case (aluctrl_i) 
      4'b0000:  result_o = a_i - b_i;                                     // sub
      4'b0001:  result_o = a_i + b_i;                                     // add ,  addi
      4'b0010:  result_o = a_i << b_i[4:0];                               // sll ,  slli (unsigned) 
      4'b0011:  result_o = (signed'(a_i) < signed'(b_i)) ? 32'b1 : 32'b0; // slt ,  slti (  signed)
      4'b0100:  result_o = (a_i < b_i) ? 32'b1 : 32'b0;                   // sltu, sltiu (unsigned)
      4'b0101:  result_o = a_i ^ b_i;                                     // xor ,  xori
      4'b0110:  result_o = signed'(a_i) >>> b_i[4:0];                     // sra ,  srai (  signed)
      4'b0111:  result_o = a_i >> b_i[4:0];                               // srl ,  srli (unsigned)
      4'b1000:  result_o = a_i | b_i;                                     // or  ,   ori
      4'b1001:  result_o = a_i & b_i;                                     // and ,  andi
      default:  result_o = 32'bx;                                         // ???
    endcase
  end

endmodule





