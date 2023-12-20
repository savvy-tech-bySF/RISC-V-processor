`timescale 1ns / 1ps
module ALU_64_bit(
    input [63:0] a,b,
    input [3:0]alu_op,
    output reg [63:0] result,
    output reg zero,
    output reg bge
    );
always @*
begin
    case(alu_op) //choosing operation based on alu_op
        4'b0000: result = a & b; // AND operation
        4'b0001: result = a | b; // OR operation
        4'b0010: result = a + b; // ADD operation
        4'b0110: result = a - b; // SUBTRACTION operation
        4'b1100: result = ~(a|b);// NOR operation
        4'b0011: result = a * (2 ** b);
        default: result = 64'b0; // Default case (zero)
    endcase
    // Calculating the ZERO output
    if (result == 64'b0) //if result is 1, zero output is 1 else 0
        begin
            zero = 1'b1;
            bge = 1'b1;
        end
    else if (result[63] == 1'b0)
        begin
            bge = 1'b1;
            zero = 1'b0;
        end
    else
        begin
            bge = 1'b0;
            zero = 1'b0;
        end
end
endmodule
