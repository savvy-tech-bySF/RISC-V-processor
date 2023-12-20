`timescale 1ns / 1ps

  module RISC_V_Processor(
    input clk,
    input reset
    );
    wire [63:0] PC_In, PC_Out, PC_A, PC_B, Imm_data, ReadData1, ReadData2, WriteData, ALU_mux, ALU_Out, Read_Data;
    wire [31:0] Instruction;
    wire [6:0] opcode, funct7;
    wire [4:0] rd, rs1, rs2;
    wire [2:0] funct3;
    wire [3:0] funct, Operation;
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, bge;
    Program_Counter m1 (clk, reset, PC_In, PC_Out);
    Adder m2 (PC_Out, 4, PC_A);
    Instruction_Memory m3 (PC_Out, Instruction);
    parser m4 (Instruction, opcode, rd, funct3, rs1, rs2, funct7);
    dataextractor m5 (Instruction, Imm_data);
    assign funct = {Instruction[30], Instruction[14:12]};
    top_Control m6 (opcode, funct, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Operation);
    Adder m7 (PC_Out, Imm_data*2, PC_B);
    registerFile m8 (WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1, ReadData2);
    muxL5 m9 (ReadData2, Imm_data, ALUSrc,reset, ALU_mux);
    ALU_64_bit m10 (ReadData1, ALU_mux, Operation, ALU_Out, zero, bge);
    muxL5 m12 (PC_A, PC_B, ((zero || bge)&&Branch), reset, PC_In);
    Data_Memory m13 (ALU_Out, ReadData2, clk, MemWrite, MemRead, Read_Data);
    muxL5 m14 (ALU_Out, Read_Data, MemtoReg, reset, WriteData);
endmodule
