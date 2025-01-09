module mux32x32to32(ReadData,In0, In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23, In24,In25,In26,In27,In28,In29,In30,In31,ReadRegister);

input [31:0] In0, In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31;
input [4:0] ReadRegister;
output [31:0] ReadData;
reg [31:0] ArrayReg [0:31];
integer j;
always @(*)
begin
for (j=0;j<=31;j=j+1)
          ArrayReg[j] = {In31[j], In30[j],In29[j],In28[j],In27[j],In26[j],In25[j],In24[j],In23[j],In22[j],In21[j],
       In20[j],In19[j],In18[j],In17[j],In16[j],In15[j],In14[j],In13[j],In12[j],In11[j],
       In10[j],In9[j],In8[j],In7[j],In6[j],In5[j],In4[j],In3[j],In2[j],In1[j],In0[j]};
   
end
mux32to1  mux0(ReadData[0],ArrayReg[0],ReadRegister);
mux32to1  mux1(ReadData[1],ArrayReg[1],ReadRegister);
mux32to1  mux2(ReadData[2],ArrayReg[2],ReadRegister);
mux32to1  mux3(ReadData[3],ArrayReg[3],ReadRegister);
mux32to1  mux4(ReadData[4],ArrayReg[4],ReadRegister);
mux32to1  mux5(ReadData[5],ArrayReg[5],ReadRegister);
mux32to1  mux6(ReadData[6],ArrayReg[6],ReadRegister);
mux32to1  mux7(ReadData[7],ArrayReg[7],ReadRegister);
mux32to1  mux8(ReadData[8],ArrayReg[8],ReadRegister);
mux32to1  mux9(ReadData[9],ArrayReg[9],ReadRegister);
mux32to1  mux10(ReadData[10],ArrayReg[10],ReadRegister);
mux32to1  mux11(ReadData[11],ArrayReg[11],ReadRegister); 
mux32to1  mux12(ReadData[12],ArrayReg[12],ReadRegister);
mux32to1  mux13(ReadData[13],ArrayReg[13],ReadRegister);
mux32to1  mux14(ReadData[14],ArrayReg[14],ReadRegister);
mux32to1  mux15(ReadData[15],ArrayReg[15],ReadRegister); 
mux32to1  mux16(ReadData[16],ArrayReg[16],ReadRegister);
mux32to1  mux17(ReadData[17],ArrayReg[17],ReadRegister);
mux32to1  mux18(ReadData[18],ArrayReg[18],ReadRegister);
mux32to1  mux19(ReadData[19],ArrayReg[19],ReadRegister);
mux32to1  mux20(ReadData[20],ArrayReg[20],ReadRegister);
mux32to1  mux21(ReadData[21],ArrayReg[21],ReadRegister);
mux32to1  mux22(ReadData[22],ArrayReg[22],ReadRegister);
mux32to1  mux23(ReadData[23],ArrayReg[23],ReadRegister);
mux32to1  mux24(ReadData[24],ArrayReg[24],ReadRegister);
mux32to1  mux25(ReadData[25],ArrayReg[25],ReadRegister);
mux32to1  mux26(ReadData[26],ArrayReg[26],ReadRegister);
mux32to1  mux27(ReadData[27],ArrayReg[27],ReadRegister);
mux32to1  mux28(ReadData[28],ArrayReg[28],ReadRegister);
mux32to1  mux29(ReadData[29],ArrayReg[29],ReadRegister);
mux32to1  mux30(ReadData[30],ArrayReg[30],ReadRegister);
mux32to1  mux31(ReadData[31],ArrayReg[31],ReadRegister);

endmodule