`timescale 1ns / 1ps 
module parser( 
    input [31:0] instruction,                                 //input instruction 32 bit 
    output reg [6:0] opcode,                                // opcode 7 bit 
    output reg [4:0] rd,                                        //output register 5 bit 
    output reg [2:0] funct3,                                 //function 3 bit 
    output reg [4:0] rs1,                                      // register 1 5 bit 
    output reg [4:0] rs2,                                      // register 2 5 bit 
    output reg [6:0] funct7                                 // function 7 bit 
    ); 
    always @* 
    begin 
    opcode <= instruction[6:0];       // Extract bits 0-6 for opcode 
    rd <= instruction[11:7];             // Extract bits 7-11 for destination register 
    funct3 <= instruction[14:12];    // Extract bits 12-14 for function3 
    rs1 <= instruction[19:15];         // Extract bits 15-19 for source register 1                                        
    rs2 <= instruction[24:20];         // Extract bits 20-24 for source register 2
    funct7 <= instruction[31:25];    // Extract bits 25-31 for function7
    end 
endmodule 
