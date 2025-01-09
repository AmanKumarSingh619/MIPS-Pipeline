`timescale 1 ps / 100 fs
module alu1bit(result,crrout,a,b,carryin,less,ALUControl);
output result,crrout;
input a,b,carryin,less;
input [1:0] ALUControl;
addsub add1(addsubOut,crrout,a,b,carryin,ALUControl[1]);
xor #(50) xor1(xorOut,a,b);
mux21 mux2(xorlessOut,xorOut,less,ALUControl[1]);
mux21 mux3(result,addsubOut,xorlessOut,ALUControl[0]);
endmodule