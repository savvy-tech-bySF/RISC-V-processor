`timescale 1ns / 1ps
module IFID(
    input clk,
    input reset,
    input flush,
    input stall,
    input [31:0] Instruction,
    input [63:0] PC,
    output reg [31:0] p_Instruction,
    output reg [63:0] p_PC
    );
    always @ (posedge clk)
        begin
        if (reset)
                begin
                    p_Instruction <= 0;
                    p_PC <= 0;
                end
            else if (!stall)
                begin
                    p_Instruction <= Instruction;
                    p_PC <= PC;
                end
        end

    endmodule
