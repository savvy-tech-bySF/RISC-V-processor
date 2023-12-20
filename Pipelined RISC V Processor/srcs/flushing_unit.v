`timescale 1ns / 1ps
module flushing_unit(
    input Branch,
    output reg flush
    );
    initial
        begin
          flush = 1'b0;
        end
  
    always @(*)
        begin
          if (Branch)
            flush = 1'b1;
          else
            flush = 1'b0;
        end
endmodule
