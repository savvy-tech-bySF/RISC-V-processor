`timescale 1ns / 1ps

module IDEX(
    input clk,
    input reset,
    input flush,
    input Branch,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input ALUsrc,
    input RegWrite,
    input [1:0] ALU_op,
    input [63:0] IFID_PC,
    input [63:0] ReadData1,
    input [63:0] ReadData2,
    input [63:0] Imm_data,
    input [3:0] funct,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    output reg [63:0] IDEX_PC,
    output reg IDEX_Branch,
    output reg IDEX_MemRead,
    output reg IDEX_MemtoReg,
    output reg IDEX_MemWrite,
    output reg IDEX_ALUsrc,
    output reg IDEX_RegWrite,
    output reg [1:0] IDEX_ALU_op,
    output reg [63:0] IDEX_ReadData1,
    output reg [63:0] IDEX_ReadData2,
    output reg [63:0] IDEX_Imm_data,
    output reg [3:0] IDEX_funct,
    output reg [4:0] IDEX_rd,
    output reg [4:0] IDEX_rs1,
    output reg [4:0] IDEX_rs2
    );
    
        always @ (posedge clk)
        begin
            if (!reset && !flush)
                begin
                     IDEX_PC <= IFID_PC;
                     IDEX_Branch <= Branch;
                     IDEX_MemRead <= MemRead;
                     IDEX_MemtoReg <= MemtoReg;
                     IDEX_MemWrite <= MemWrite;
                     IDEX_ALUsrc <= ALUsrc;
                     IDEX_RegWrite <= RegWrite;
                     IDEX_ALU_op <= ALU_op;
                     IDEX_ReadData1 <= ReadData1;
                     IDEX_ReadData2 <= ReadData2;
                     IDEX_Imm_data <= Imm_data;
                     IDEX_funct <= funct;
                     IDEX_rd <= rd;
                     IDEX_rs1 <= rs1;
                     IDEX_rs2 <= rs2;
                end
            else 
                begin
                     IDEX_PC <= 0; 
                     IDEX_Branch <= 0;
                     IDEX_MemRead <= 0;
                     IDEX_MemtoReg <= 0;
                     IDEX_MemWrite <= 0; 
                     IDEX_ALUsrc <= 0;
                     IDEX_RegWrite <= 0;
                     IDEX_ALU_op <= 0;
                     IDEX_ReadData1 <= 0;
                     IDEX_ReadData2 <= 0;
                     IDEX_Imm_data <= 0;
                     IDEX_funct <= 0;
                     IDEX_rd <= 0;
                     IDEX_rs1 <= 0;
                     IDEX_rs2 <= 0;
                end
        end
endmodule
