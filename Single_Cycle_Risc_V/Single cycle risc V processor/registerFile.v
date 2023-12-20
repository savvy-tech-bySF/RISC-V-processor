`timescale 1ns / 1ps
module registerFile(
    input [63:0]WriteData,
    input [4:0]RS1,
    input [4:0]RS2,
    input [4:0]RD,
    input RegWrite,
    input clk,
    input reset,
    output reg [63:0]ReadData1,
    output reg [63:0]ReadData2
    );
    integer i;
    reg [63:0] Registers [31:0];
    initial begin
        Registers[0] = 0;
        for (i = 1; i < 32; i = i+1)
            begin
                Registers[i] = i+1;
            end
    end
    
    always @*
    begin
    ReadData1 <= Registers[RS1];
    ReadData2 <= Registers[RS2];
    if (reset)
        begin
            ReadData1 <= 0;
            ReadData2 <= 0;
        end
   end
   always @(posedge clk)
   begin
    if (RegWrite)
        begin
            Registers[RD] = WriteData;
        end
    end
endmodule
