`timescale 1ns / 1ps

module Instruction_Fetch(
    input clk,
    input reset,
    output [31:0]Instruction
    );
    wire [63:0]PC_In;
    wire [63:0]PC_Out;
    Program_Counter m1(clk, reset, PC_In, PC_Out);
    Instruction_Memory m2(PC_Out, Instruction);
    Adder m3(PC_Out,4,PC_In);
endmodule
