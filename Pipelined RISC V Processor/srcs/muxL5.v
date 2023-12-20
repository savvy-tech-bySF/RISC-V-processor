`timescale 1ns / 1ps
//defining the multiplexer module
module muxL5(
    input [63:0] input_a,
    input [63:0] input_b,
    input selection_bit,
    input reset,
    output reg [63:0] out
    );
    //always block
    always @*
    begin
    if (reset)
        out <= 0;
    else
        begin
            case (selection_bit)
                1'b0: out <= input_a;   // if selection bit is 0, output input_a
                1'b1: out <= input_b;   // if selection bit is 1, output input_b
    endcase
        end
    end
endmodule
