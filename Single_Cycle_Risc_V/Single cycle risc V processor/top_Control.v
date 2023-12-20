`timescale 1ns / 1ps

module top_Control(
    input [6:0] Opcode,
    input [3:0] Funct,
    output Branch,
    output MemRead,
    output MemtoReg,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    output [3:0]Operation
    );
    wire [1:0] ALUOp;
    Control_Unit m1(Opcode, Branch,MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    ALU_control m2(ALUOp, Funct, Operation);
endmodule
