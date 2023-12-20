`timescale 1ns / 1ps

module top(
    input [31:0]instruction,
    input clk,
    input reset,
    output[63:0] ReadData1,
    output [63:0] ReadData2
    );
    wire [6:0] opcode, funct7;
    wire [4:0] rs1, rs2, rd;
    wire [2:0] funct3;
    wire [63:0] writedata = 0;
    wire regwrite = 0;
parser p1(instruction, opcode, rd, funct3, rs1, rs2, funct7);
registerFile r1(writedata, rs1, rs2, rd, regwrite, clk, reset, ReadData1, ReadData2); 
endmodule
