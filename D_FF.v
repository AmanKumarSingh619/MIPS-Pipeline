`timescale 1 ps / 100 fs
module D_FF (q, d, reset, clk);
output q;
input d, reset, clk;
reg q; // Indicate that q is stateholding
 
always @(posedge clk or posedge reset)
if (reset)
q = 0; // On reset, set to 0
else
q = d; // Otherwise out = d 
endmodule