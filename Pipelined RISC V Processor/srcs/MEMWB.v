`timescale 1ns / 1ps
module MEMWB(
    input clk, reset,
    input MemtoReg,
    input RegWrite,
    input [63:0] ReadData,
    input [4:0] rd,
    input [63:0] ALU_Out,
    output reg MEMWB_MemtoReg,
    output reg MEMWB_RegWrite,
    output reg [63:0] MEMWB_ReadData,
    output reg [4:0] MEMWB_rd,
    output reg [63:0] MEMWB_ALU_Out
    );
    always @ (posedge clk)
        begin
            if (!reset)
                begin
                     MEMWB_MemtoReg <= MemtoReg;
                     MEMWB_RegWrite <= RegWrite;
                     MEMWB_ReadData <= ReadData;
                     MEMWB_rd <= rd;
                     MEMWB_ALU_Out <= ALU_Out;
                end
            else
                begin
                     MEMWB_MemtoReg <= 0;
                     MEMWB_RegWrite <= 0;
                     MEMWB_ReadData <= 0;
                     MEMWB_rd <= 0;
                     MEMWB_ALU_Out <= 0;
                end
        end
endmodule
