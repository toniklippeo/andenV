`include "defines.sv"
module alu(

input   logic [31:0] op1,
input   logic [31:0] op2,
input    defines::alu_op_type alu_type,

output  logic [31:0] data
 );
   always_comb begin
   case (alu_type) inside
     defines::ALU_ADD: 
       alu_out.data = alu_in.op1 + alu_in.op2;
     defines::ALU_SUB:
       alu_out.data = alu_in.op1 - alu_in.op2;
     defines::ALU_AND:
       alu_out.data = alu_in.op1 & alu_in.op2;
     defines::ALU_OR:
       alu_out.data = alu_in.op1 | alu_in.op2;
     defines::ALU_XOR:
       alu_out.data = alu_in.op1 ^ alu_in.op2;
     defines::ALU_SLT:
       alu_out.data = {31'b0, alu_in.op1 < alu_in.op2};
     defines::ALU_SLTU:
       alu_out.data = {31'b0, alu_in.op1 < alu_in.op2};
     defines::ALU_SLL:
       alu_out.data = alu_in.op1 << alu_in.op2[4:0];
     defines::ALU_SRA:
       alu_out.data = alu_in.op1 >> alu_in.op2[4:0];
     defines::ALU_SRL:
       alu_out.data = alu_in.op1 >> alu_in.op2;
     defines::ALU_COPY_1:
       alu_out.data = alu_in.op1;
     defines::ALU_COPY_2:
       alu_out.data = alu_in.op2;
     default:
       alu_out.data = 32'bx;
   endcase // case (alu_in.fun)
   end
endmodule // alu
