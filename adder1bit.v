`timescale 1 ps / 100 fs
module adder1bit(sum,cout,a,b,cin);
input   a,b,cin;
output  cout,sum;
// sum = a xor b xor cin
xor #(50) (sum,a,b,cin);
// carry out = a.b + cin.(a+b)
and #(50) and1(c1,a,b);
or #(50) or1(c2,a,b);
and #(50) and2(c3,c2,cin);
or #(50) or2(cout,c1,c3);
endmodule 