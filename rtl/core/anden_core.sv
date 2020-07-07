




module anden_core(
input clk,
input rst_n,


output logic memout

);

 typedef struct packed {
      logic [31:0] pc; // program counter
   } InstructionFetchState;

   typedef struct packed {
      logic [31:0] pc;   // program  counter
      logic [31:0] inst; // instruction
   } InstructionDecodeState;
/*
   typedef struct packed {
      logic [31:0]              pc;           // program counter
      logic [31:0]              inst;         // instruction
      logic [4:0]               wb_addr;      // write back address
      logic [4:0]               rs1_addr;     // address of source register 1
      logic [4:0]               rs2_addr;     // address of source register 2
      logic [31:0]              op1_data;     // operand 1 data
      logic [31:0]              op2_data;     // operand 2 data
      logic [31:0]              rs2_data;     // source register 2 data
      Bundle::BranchType        ctrl_br_type; // control branch type
      Bundle::Op2Sel            ctrl_op2_sel; // control operand 2 select
      Bundle::AluFun            ctrl_alu_fun; // control alu function
      Bundle::WriteBackSelect   ctrl_wb_sel;  // control writeback select
      logic                     ctrl_rf_wen;  // control register file write enable
      logic                     ctrl_mem_val; // control memory value
      Bundle::MemoryWriteSignal ctrl_mem_fcn; // control memory function
      Bundle::MemoryMaskType    ctrl_mem_typ; // control memory type
      Bundle::ControlRegisterCommand  ctrl_csr_cmd; // control condition state register command
   } ExecuteState;

   typedef struct packed {
      logic [31:0]              pc;           // program counter
      logic [31:0]              inst;         // instruction
      logic [31:0]              alu_out;      // alu out
      logic [4:0]               wb_addr;      // write back address
      logic [4:0]               rs1_addr;     // address of source register 1
      logic [4:0]               rs2_addr;     // address of source register 2
      logic [31:0]              op1_data;     // operand 1 data
      logic [31:0]              op2_data;     // operand 2 data
      logic [31:0]              rs2_data;     // source register 2 data
      logic                     ctrl_rf_wen;  // control register file write enable
      logic                     ctrl_mem_val; // control memory value
      Bundle::MemoryWriteSignal ctrl_mem_fcn; // control memory function
      Bundle::MemoryMaskType    ctrl_mem_typ; // control memory type
      Bundle::WriteBackSelect   ctrl_wb_sel;  // control writeback select
      Bundle::ControlRegisterCommand ctrl_csr_cmd; // control condition state register command
   } MemoryState;
*/
   typedef struct packed {
      logic [4:0]  wb_addr;     // writeback address
      logic [31:0] wb_data;     // writeback data
      logic        ctrl_rf_wen; // control register file write enable
   } WriteBackState;

// These structures capture the whole state of
   // the fixed point pipeline
   InstructionFetchState  ifs, ifsn;
   InstructionDecodeState ids, idsn;
  // ExecuteState           es, esn;
  // MemoryState            ms, msn;
  // WriteBackState         wbs, wbsn;

/// Instruction Fetch stage
   /*always_comb begin
      // default assignment
      ifsn = ifs;
      if ((!ctl.dec_stall && !ctl.cmiss_stall) || ctl.pipeline_kill) begin
	 ifsn.pc = (ctl.exe_pc_sel == Bundle::PC_4) ? ifs.pc + 32'd4 :
		   (ctl.exe_pc_sel == Bundle::PC_BRJMP) ? exe_brjmp_target :
		   (ctl.exe_pc_sel == Bundle::PC_JALR) ? exe_jump_reg_target :
		   exception_target;
      end
   end*/
   always_ff @(posedge clk) begin
      if (!rst_n) begin
	 ifs <= '0;
      end else begin
	 ifs <= ifsn;
      end
   end

  //assign imem_in.req.addr = ifs.pc;
  // assign imem_in.req_valid = 1'b1;
  // assign if_instruction = imem_out.res.data;

endmodule;



