`timescale 1ns / 1ps

module mux_3to1(
    input[63:0] a,
    input[63:0] b,
    input[63:0] c,
    input [1:0] selection_bit,
    output reg [63:0] mux_out
    );
    always @(*)
        begin
          case(selection_bit)
            2'b00: mux_out = a;
            2'b01: mux_out = b;
            2'b10: mux_out = c;
          endcase
        end
endmodule
