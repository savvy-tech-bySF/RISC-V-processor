`timescale 1ns / 1ps
module RISC_V_PIPELINED(
    input clk,
    input reset
    );
    wire [63:0] PC_In, PC_Out, PC_A, PC_B, IFID_PC, IDEX_PC, EXMEM_PC, Imm_data, ReadData1, ReadData2,IDEX_ReadData1, IDEX_ReadData2, 
                EXMEM_ReadData2, IDEX_Imm_data, MEMWB_Read_Data, MEMWB_WriteData, WriteData, ALU_mux, ALU_Out, EXMEM_ALU_Out, MEMWB_ALU_Out, Read_Data;
    wire [31:0] Instruction, IFID_Instruction;
    wire [6:0] opcode, funct7;
    wire [4:0] rd, IDEX_rd, EXMEM_rd, MEMWB_rd, rs1, rs2;
    wire [2:0] funct3;
    wire [3:0] funct,IDEX_funct, Operation;
    wire stall,flush;
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, bge;
    wire IDEX_Branch, IDEX_MemRead, IDEX_MemtoReg, IDEX_MemWrite, IDEX_ALUSrc, IDEX_RegWrite;
    wire EXMEM_Branch,EXMEM_MemRead, EXMEM_MemtoReg,EXMEM_MemWrite,EXMEM_RegWrite, EXMEM_zero, EXMEM_bge;
    wire MEMWB_MemtoReg, MEMWB_RegWrite;
    wire[1:0] ALU_op, IDEX_ALU_op;
    wire [1:0] ForwardA, ForwardB;
    wire [63:0] mux1_out, mux2_out;
    wire [4:0] IDEX_rs1, IDEX_rs2;
    
    flushing_unit x3(IDEX_Branch,flush);
    muxL5 m0 (PC_A, PC_B, (IDEX_Branch && (zero||bge) ), reset, PC_In); 
    Program_Counter m1 (clk, reset, stall,flush, PC_In, PC_Out);
    Instruction_Memory m3 (PC_Out, Instruction);
    Adder m2 (PC_Out, 4, PC_A);

    IFID m4 (clk, reset, flush,stall, Instruction, PC_Out, IFID_Instruction, IFID_PC);
    
    assign funct = {IFID_Instruction[30], IFID_Instruction[14:12]};
    parser m5 (IFID_Instruction, opcode, rd, funct3, rs1, rs2, funct7);
    dataextractor m6 (IFID_Instruction, Imm_data);
    hazard_detection_unit hazard(rs1, rs2, IDEX_rd,IDEX_MemRead,opcode, stall);         
    Control_Unit m7 (reset,stall,flush,opcode, Branch,MemRead, MemtoReg, ALU_op, MemWrite, ALUSrc, RegWrite);
    registerFile m8 (MEMWB_WriteData, rs1, rs2, MEMWB_rd, MEMWB_RegWrite, clk, reset, ReadData1, ReadData2);
     
    IDEX m9 (clk, reset,flush, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALU_op, IFID_PC, ReadData1, 
             ReadData2, Imm_data, funct,rs1,rs2, rd, IDEX_PC, IDEX_Branch, IDEX_MemRead, IDEX_MemtoReg, IDEX_MemWrite,
             IDEX_ALUSrc, IDEX_RegWrite, IDEX_ALU_op, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm_data, IDEX_funct, IDEX_rd, IDEX_rs1, IDEX_rs2);
             
    ALU_control m10 (IDEX_ALU_op, funct, Operation);
    mux_3to1 x0(IDEX_ReadData1, MEMWB_WriteData,EXMEM_ALU_Out, ForwardA, mux1_out);
    mux_3to1 x1(IDEX_ReadData2, MEMWB_WriteData,EXMEM_ALU_Out, ForwardB, mux2_out);
    muxL5 m11 (mux2_out, IDEX_Imm_data, IDEX_ALUSrc,reset, ALU_mux);
    ALU_64_bit m12 (mux1_out, ALU_mux, Operation, ALU_Out, zero, bge);
    Adder m13 (IDEX_Imm_data*2, IDEX_PC, PC_B);
    
    EXMEM m14(clk, reset, IDEX_Branch, IDEX_MemRead, IDEX_MemtoReg,IDEX_MemWrite, IDEX_RegWrite,
              PC_B, mux2_out, IDEX_rd, ALU_Out,zero,bge, EXMEM_Branch, EXMEM_MemRead, 
              EXMEM_MemtoReg,EXMEM_MemWrite,EXMEM_RegWrite,EXMEM_PC,EXMEM_ReadData2,EXMEM_rd,EXMEM_ALU_Out,EXMEM_zero, EXMEM_bge);
              
    Data_Memory m15 (EXMEM_ALU_Out, EXMEM_ReadData2, clk, EXMEM_MemWrite, EXMEM_MemRead, Read_Data);
    
    MEMWB m16(clk, reset,EXMEM_MemtoReg, EXMEM_RegWrite, Read_Data,EXMEM_rd, EXMEM_ALU_Out,
              MEMWB_MemtoReg,MEMWB_RegWrite,MEMWB_Read_Data,MEMWB_rd,MEMWB_ALU_Out);
              
    muxL5 m17(MEMWB_ALU_Out, MEMWB_Read_Data, MEMWB_MemtoReg, reset, MEMWB_WriteData);
    forwarding_unit m18(IDEX_rs1, IDEX_rs2,EXMEM_rd,MEMWB_rd, MEMWB_RegWrite,EXMEM_RegWrite,ForwardA,ForwardB);
    //Good luck sweetheart, I know you'll do your best, I am proud of you!

    
    
endmodule
