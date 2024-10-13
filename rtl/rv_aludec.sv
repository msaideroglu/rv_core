
module rv_aludec(
    input  logic       opb5_i,
    input  logic [2:0] funct3_i,
    input  logic       funct7b5_i, 
    output logic [3:0] aluctrl_o
    );

  logic  R_sub;
  assign R_sub = funct7b5_i & opb5_i; 

  always_comb begin
    case(funct3_i)
      3'b000: if (R_sub)      aluctrl_o = 4'b0000; // sub
              else            aluctrl_o = 4'b0001; // add ,  addi
      3'b001:                 aluctrl_o = 4'b0010; // sll ,  slli
      3'b010:                 aluctrl_o = 4'b0011; // slt ,  slti
      3'b011:                 aluctrl_o = 4'b0100; // sltu, sltiu
      3'b100:                 aluctrl_o = 4'b0101; // xor ,  xori
      3'b101: if (funct7b5_i) aluctrl_o = 4'b0110; // sra ,  srai
              else            aluctrl_o = 4'b0111; // srl ,  srli
      3'b110:                 aluctrl_o = 4'b1000; // or  ,   ori
      3'b111:                 aluctrl_o = 4'b1001; // and ,  andi
      default:                aluctrl_o = 4'bxxxx; // ???
    endcase
  end
    
endmodule

