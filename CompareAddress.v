`timescale 1 ps / 100 fs
module CompareAddress(equal,Addr1,Addr2);
// Compare Address
output equal;
wire equal;
input [4:0] Addr1,Addr2;
wire [4:0] Addr1,Addr2,xorAddress;
xor #(50) xorAddress4(xorAddress[4],Addr1[4],Addr2[4]);
xor #(50) xorAddress3(xorAddress[3],Addr1[3],Addr2[3]);
xor #(50) xorAddress2(xorAddress[2],Addr1[2],Addr2[2]);
xor #(50) xorAddress1(xorAddress[1],Addr1[1],Addr2[1]);
xor #(50) xorAddress0(xorAddress[0],Addr1[0],Addr2[0]);
or #(50) Orgate1(OrAddr,xorAddress[4],xorAddress[3],xorAddress[2],xorAddress[1],xorAddress[0]);
not #(50) notgate1(equal,OrAddr);
endmodule
