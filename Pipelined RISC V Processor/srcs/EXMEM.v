`timescale 1ns / 1ps

module EXMEM(
    input clk, reset,
    input Branch,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input RegWrite,
    input [63:0] PC_B,
    input [63:0] ReadData2,
    input [4:0] rd,
    input [63:0] ALU_Out,
    input zero,
    input bge,
    output reg EXMEM_Branch,
    output reg EXMEM_MemRead,
    output reg EXMEM_MemtoReg,
    output reg EXMEM_MemWrite,
    output reg EXMEM_RegWrite,
    output reg [63:0] EXMEM_PC,
    output reg [63:0] EXMEM_ReadData2,
    output reg [4:0] EXMEM_rd,
    output reg [63:0] EXMEM_ALU_Out,
    output reg EXMEM_zero,
    output reg EXMEM_bge
    );
        
        always @ (posedge clk)
        begin
            if (!reset)
                begin
                     EXMEM_Branch <= Branch;
                     EXMEM_MemRead <= MemRead;
                     EXMEM_MemtoReg <= MemtoReg;
                     EXMEM_MemWrite <= MemWrite;
                     EXMEM_RegWrite <= RegWrite;
                     EXMEM_ReadData2 <= ReadData2;
                     EXMEM_rd <= rd;
                     EXMEM_zero <= zero;
                     EXMEM_bge <= bge;
                     EXMEM_ALU_Out <= ALU_Out;
                     EXMEM_PC <= PC_B;
                end
            else
                begin
                     EXMEM_Branch <= 0;
                     EXMEM_MemRead <= 0;
                     EXMEM_MemtoReg <= 0;
                     EXMEM_MemWrite <= 0; 
                     EXMEM_RegWrite <= 0;
                     EXMEM_ReadData2 <= 0;
                     EXMEM_rd <= 0;
                     EXMEM_zero <= 0;
                     EXMEM_bge <= 0;
                     EXMEM_ALU_Out <= 0;
                     EXMEM_PC <= 0;
                end
        end
endmodule
