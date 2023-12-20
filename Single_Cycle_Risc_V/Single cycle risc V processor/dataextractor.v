`timescale 1ns / 1ps
module dataextractor(
    input [31:0]instruction,
    output reg [63:0] imm_data
    );
    wire [1:0] select;
    assign select = instruction[6:5]; // select bit assigned bit 6 and 5 of the instruction
    always @*
    case (select)
        2'b00: imm_data <= {{52{instruction[31]}}, instruction[31:20]}; // extend the 12 immediate bits in the instruction for I-type instruction
        2'b01: imm_data <= {{52{instruction[31]}}, instruction[31:25], instruction[11:7]}; // extend the 12 immediate bits for S-type instruction
        2'b11: imm_data <= {{52{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8]}; // extend the 12 immediate bits for SB-type instruction
    endcase    
endmodule
