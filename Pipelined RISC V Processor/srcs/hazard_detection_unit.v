`timescale 1ns / 1ps

module hazard_detection_unit(
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] IDEX_rd,
    input IDEX_MemRead,
    input [6:0] opcode,
    output reg stall
    );
    initial
        begin
          stall = 1'b0;
        end
  
    always @(*)
        begin
          if (stall)
            stall = 1'b0;
          else if ((IDEX_MemRead == 1'b1 && ((IDEX_rd == rs1) || (IDEX_rd == rs2))) || opcode == 7'b1100011)
            stall = 1'b1;
          else
            stall = 1'b0;
        end
endmodule
