`timescale 1 ps / 100 fs
module dec5to32(Out,Adr);
input [4:0] Adr; // Adr=Address of register
output [31:0] Out;
not #(50) Inv4(Nota, Adr[4]);
not #(50) Inv3(Notb, Adr[3]);
not #(50) Inv2(Notc, Adr[2]);
not #(50) Inv1(Notd, Adr[1]);
not #(50) Inv0(Note, Adr[0]);

andmore a0(Out[0],  Nota,Notb,Notc,Notd,Note); // 00000
andmore a1(Out[1],  Nota,Notb,Notc,Notd,Adr[0]); // 00001
andmore a2(Out[2],  Nota,Notb,Notc,Adr[1],Note); //00010
andmore a3(Out[3],  Nota,Notb,Notc,Adr[1],Adr[0]);
andmore a4(Out[4],  Nota,Notb,Adr[2],Notd,Note);
andmore a5(Out[5],  Nota,Notb,Adr[2],Notd,Adr[0]);
andmore a6(Out[6],  Nota,Notb,Adr[2],Adr[1],Note);
andmore a7(Out[7],  Nota,Notb,Adr[2],Adr[1],Adr[0]);
andmore a8(Out[8],    Nota,Adr[3],Notc,Notd,Note);
andmore a9(Out[9],    Nota,Adr[3],Notc,Notd,Adr[0]);
andmore a10(Out[10],  Nota,Adr[3],Notc,Adr[1],Note);
andmore a11(Out[11],  Nota,Adr[3],Notc,Adr[1],Adr[0]);
andmore a12(Out[12],  Nota,Adr[3],Adr[2],Notd,Note);
andmore a13(Out[13],  Nota,Adr[3],Adr[2],Notd,Adr[0]);
andmore a14(Out[14],  Nota,Adr[3],Adr[2],Adr[1],Note);
andmore a15(Out[15],  Nota,Adr[3],Adr[2],Adr[1],Adr[0]);
andmore a16(Out[16],  Adr[4],Notb,Notc,Notd,Note);
andmore a17(Out[17],  Adr[4],Notb,Notc,Notd,Adr[0]);
andmore a18(Out[18],  Adr[4],Notb,Notc,Adr[1],Note);
andmore a19(Out[19],  Adr[4],Notb,Notc,Adr[1],Adr[0]);
andmore a20(Out[20],  Adr[4],Notb,Adr[2],Notd,Note);
andmore a21(Out[21],  Adr[4],Notb,Adr[2],Notd,Adr[0]);
andmore a22(Out[22],  Adr[4],Notb,Adr[2],Adr[1],Note);
andmore a23(Out[23],  Adr[4],Notb,Adr[2],Adr[1],Adr[0]);
andmore a24(Out[24],  Adr[4],Adr[3],Notc,Notd,Note);
andmore a25(Out[25],  Adr[4],Adr[3],Notc,Notd,Adr[0]);
andmore a26(Out[26],  Adr[4],Adr[3],Notc,Adr[1],Note);
andmore a27(Out[27],  Adr[4],Adr[3],Notc,Adr[1],Adr[0]);
andmore a28(Out[28],  Adr[4],Adr[3],Adr[2],Notd,Note);
andmore a29(Out[29],  Adr[4],Adr[3],Adr[2],Notd,Adr[0]);
andmore a30(Out[30],  Adr[4],Adr[3],Adr[2],Adr[1],Note);
andmore a31(Out[31],  Adr[4],Adr[3],Adr[2],Adr[1],Adr[0]); // 11111
endmodule