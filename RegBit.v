`timescale 1 ps / 100 fs
module RegBit(BitOut, BitData, WriteEn,reset, clk);
output BitOut; // 1 bit of register
input BitData, WriteEn; 
input reset,clk;
wire d,f1, f2; // input of D Flip-Flop
wire reset;
//assign reset=0;
and #(50) U1(f1, BitOut, (~WriteEn));
and #(50) U2(f2, BitData, WriteEn);
or  #(50) U3(d, f1, f2);
D_FF DFF0(BitOut, d, reset, clk);
endmodule