`timescale 1ns / 1ps

module Instruction_Memory(
    input [63:0] Inst_Address,
    output reg [31:0] Instruction
    );
    reg [7:0] Memory [131:0];
    initial begin
        Memory[0] = 8'h93;
        Memory[1] = 8'h02;
        Memory[2] = 8'h00;
        Memory[3] = 8'h00;
        Memory[4] = 8'h13;
        Memory[5] = 8'h03;
        Memory[6] = 8'h60;
        Memory[7] = 8'h00;
        Memory[8] = 8'h13;
        Memory[9] = 8'h0e;
        Memory[10] = 8'h80;
        Memory[11] = 8'h00;
        Memory[12] = 8'ha3;
        Memory[13] = 8'ha3;
        Memory[14] = 8'hc2;
        Memory[15] = 8'h01;
        Memory[16] = 8'h13;
        Memory[17] = 8'h0e;
        Memory[18] = 8'h40;
        Memory[19] = 8'h00;
        Memory[20] = 8'ha3;
        Memory[21] = 8'ha7;
        Memory[22] = 8'hc2;
        Memory[23] = 8'h01;
        Memory[24] = 8'h13;
        Memory[25] = 8'h0e;
        Memory[26] = 8'h20;
        Memory[27] = 8'h00;
        Memory[28] = 8'ha3;
        Memory[29] = 8'hab;
        Memory[30] = 8'hc2;
        Memory[31] = 8'h01;
        Memory[32] = 8'h13;
        Memory[33] = 8'h0e;
        Memory[34] = 8'h60;
        Memory[35] = 8'h00;
        Memory[36] = 8'ha3;
        Memory[37] = 8'haf;
        Memory[38] = 8'hc2;
        Memory[39] = 8'h01;
        Memory[40] = 8'h13;
        Memory[41] = 8'h0e;
        Memory[42] = 8'h10;
        Memory[43] = 8'h00;
        Memory[44] = 8'ha3;
        Memory[45] = 8'ha3;
        Memory[46] = 8'hc2;
        Memory[47] = 8'h03;
        Memory[48] = 8'h13;
        Memory[49] = 8'h0e;
        Memory[50] = 8'hf0;
        Memory[51] = 8'h00;
        Memory[52] = 8'ha3;
        Memory[53] = 8'ha7;
        Memory[54] = 8'hc2;
        Memory[55] = 8'h03;
        Memory[56] = 8'h13;
        Memory[57] = 8'h0e;
        Memory[58] = 8'h00;
        Memory[59] = 8'h00;
        Memory[60] = 8'h13;
        Memory[61] = 8'h05;
        Memory[62] = 8'hf3;
        Memory[63] = 8'hff;
        Memory[64] = 8'h63;
        Memory[65] = 8'h52;
        Memory[66] = 8'hae;
        Memory[67] = 8'h04;
        Memory[68] = 8'hb3;
        Memory[69] = 8'h0e;
        Memory[70] = 8'hc3;
        Memory[71] = 8'h41;
        Memory[72] = 8'h93;
        Memory[73] = 8'h8e;
        Memory[74] = 8'hfe;
        Memory[75] = 8'hff;
        Memory[76] = 8'h13;
        Memory[77] = 8'h0f;
        Memory[78] = 8'h00;
        Memory[79] = 8'h00;
        Memory[80] = 8'h63;
        Memory[81] = 8'h56;
        Memory[82] = 8'hdf;
        Memory[83] = 8'h03;
        Memory[84] = 8'h93;
        Memory[85] = 8'h1f;
        Memory[86] = 8'h3f;
        Memory[87] = 8'h00;
        Memory[88] = 8'hb3;
        Memory[89] = 8'h84;
        Memory[90] = 8'hf2;
        Memory[91] = 8'h01;
        Memory[92] = 8'h93;
        Memory[93] = 8'h83;
        Memory[94] = 8'h84;
        Memory[95] = 8'h00;
        Memory[96] = 8'h03;
        Memory[97] = 8'ha9;
        Memory[98] = 8'h04;
        Memory[99] = 8'h00;
        Memory[100] = 8'h03;
        Memory[101] = 8'ha6;
        Memory[102] = 8'h03;
        Memory[103] = 8'h00;
        Memory[104] = 8'h63;
        Memory[105] = 8'h56;
        Memory[106] = 8'h26;
        Memory[107] = 8'h01;
        Memory[108] = 8'ha3;
        Memory[109] = 8'ha3;
        Memory[110] = 8'hc4;
        Memory[111] = 8'h00;
        Memory[112] = 8'ha3;
        Memory[113] = 8'ha3;
        Memory[114] = 8'h23;
        Memory[115] = 8'h01;
        Memory[116] = 8'h13;
        Memory[117] = 8'h0f;
        Memory[118] = 8'h1f;
        Memory[119] = 8'h00;
        Memory[120] = 8'he3;
        Memory[121] = 8'h0c;
        Memory[122] = 8'h00;
        Memory[123] = 8'hfc;
        Memory[124] = 8'h13;
        Memory[125] = 8'h0e;
        Memory[126] = 8'h1e;
        Memory[127] = 8'h00;
        Memory[128] = 8'he3;
        Memory[129] = 8'h00;
        Memory[130] = 8'h00;
        Memory[131] = 8'hfc;
        
    end
always @*
begin
    Instruction[7:0] <= Memory[Inst_Address];
    Instruction[15:8] <= Memory[Inst_Address+1];
    Instruction[23:16] <= Memory[Inst_Address+2];
    Instruction[31:24] <= Memory[Inst_Address+3];
end
endmodule
