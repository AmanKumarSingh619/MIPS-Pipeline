`timescale 1 ps / 100 fs
module Discard_Instr(ID_flush,IF_flush,jump,bne,jr);
output ID_flush,IF_flush;
input jump,bne,jr;
or #50 OR1(IF_flush,jump,bne,jr);
or #50 OR2(ID_flush,bne,jr);
endmodule