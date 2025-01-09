`timescale 1 ps / 100 fs
module addsub(Out,cout,a,b,cin,select);
input a,b,cin,select;
output Out,cout; // the result and carry out
not #(50) not1(notb,b);
mux21 mux1(b1,b,notb,select);

adder adder1(Out,cout,a,b1,cin);
endmodule