`timescale 1ns / 1ps
module pipelined_tb();
reg clk, reset;
RISC_V_PIPELINED r1(clk, reset);
initial begin
clk = 0; reset = 1;
#5
    reset = 0;
end

always #5
clk = ~clk;

endmodule