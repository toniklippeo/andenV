// file: defines
`ifndef _defines
`define _defines
package defines;


   typedef enum [4:0] {
                       ALU_X,
                       ALU_ADD,
                       ALU_SUB,
                       ALU_SLL,
                       ALU_SRL,
                       ALU_SRA,
                       ALU_SLT,
                       ALU_SLTU,
                       ALU_AND,
                       ALU_OR,
                       ALU_XOR,
                       ALU_COPY_1,
                       ALU_COPY_2
                       } alu_op_type;
                       
                       
                       
  typedef struct  packed {
      logic [31:0] addr;
      logic [31:0] data;
      logic [2:0]  type_m;
   } MemoryRequest;
 

endpackage // defines
`endif
