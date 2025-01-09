`timescale 1 ps / 100 fs
module andmore(g,a,b,c,d,e);
  output g;
  input a,b,c,d,e;
  and #(50) and1(f1,a,b,c,d),
            and2(g,f1,e);
endmodule