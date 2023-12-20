`timescale 1ns / 1ps

module Data_Memory(
    input [63:0] Mem_Addr,
    input [63:0] Write_Data,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] Read_Data
    );
    reg [7:0] Memory [63:0];
    integer counter;
    initial begin
        for (counter = 0; counter < 64; counter = counter + 1)
            begin
                Memory[counter] = 0;
            end
    end
    
always @(posedge clk)
begin
    if (MemWrite)
    begin
        Memory[Mem_Addr] <= Write_Data[7:0];
        Memory[Mem_Addr+1] <= Write_Data[15:8];
        Memory[Mem_Addr+2] <= Write_Data[23:16];
        Memory[Mem_Addr+3] <= Write_Data[31:24];
        Memory[Mem_Addr+4] <= Write_Data[39:32];
        Memory[Mem_Addr+5] <= Write_Data[47:40];
        Memory[Mem_Addr+6] <= Write_Data[55:48];
        Memory[Mem_Addr+7] <= Write_Data[63:56];
        
    end
end

always @*
begin
    if (MemRead)
        begin
                Read_Data[7:0] <= Memory[Mem_Addr+7];
                Read_Data[15:8] <= Memory[Mem_Addr+6];
                Read_Data[23:16] <= Memory[Mem_Addr+5];
                Read_Data[31:24] <= Memory[Mem_Addr+4];
                Read_Data[39:32] <= Memory[Mem_Addr+3];
                Read_Data[47:40] <= Memory[Mem_Addr+2];
                Read_Data[55:48] <= Memory[Mem_Addr+1];
                Read_Data[63:56] <= Memory[Mem_Addr];
                
        end
end
endmodule