module mux32to1(Out, In , Select);
output Out;
input [31:0] In; 
input [4:0] Select; 
wire [31:0] OE,f; // OE = Output Enable
dec5to32 dec1(OE,Select);

 and  #(50) g_0(f[0],OE[0],In[0]);
 and  #(50) g_1(f[1],OE[1],In[1]);
 and  #(50) g_2(f[2],OE[2],In[2]);
 and  #(50) g_3(f[3],OE[3],In[3]);
 and  #(50) g_4(f[4],OE[4],In[4]);
 and  #(50) g_5(f[5],OE[5],In[5]);
 and  #(50) g_6(f[6],OE[6],In[6]);
 and  #(50) g_7(f[7],OE[7],In[7]);
 and  #(50) g_8(f[8],OE[8],In[8]);
 and  #(50) g_9(f[9],OE[9],In[9]);
 and  #(50) g_10(f[10],OE[10],In[10]);
 and  #(50) g_11(f[11],OE[11],In[11]);
 and  #(50) g_12(f[12],OE[12],In[12]);
 and  #(50) g_13(f[13],OE[13],In[13]);
 and  #(50) g_14(f[14],OE[14],In[14]);
 and  #(50) g_15(f[15],OE[15],In[15]);
 and  #(50) g_16(f[16],OE[16],In[16]);
 and  #(50) g_17(f[17],OE[17],In[17]);
 and  #(50) g_18(f[18],OE[18],In[18]);
 and  #(50) g_19(f[19],OE[19],In[19]);
 and  #(50) g_20(f[20],OE[20],In[20]);
 and  #(50) g_21(f[21],OE[21],In[21]);
 and  #(50) g_22(f[22],OE[22],In[22]);
 and  #(50) g_23(f[23],OE[23],In[23]);
 and  #(50) g_24(f[24],OE[24],In[24]);
 and  #(50) g_25(f[25],OE[25],In[25]);
 and  #(50) g_26(f[26],OE[26],In[26]);
 and  #(50) g_27(f[27],OE[27],In[27]);
 and  #(50) g_28(f[28],OE[28],In[28]);
 and  #(50) g_29(f[29],OE[29],In[29]);
 and  #(50) g_30(f[30],OE[30],In[30]);
 and  #(50) g_31(f[31],OE[31],In[31]);

 

 or #(50) gate3(g3,f[0],f[1],f[2],f[3]);
 or #(50) gate4(g4,f[4],f[5],f[6],f[7]);
 or #(50) gate5(g5,f[8],f[9],f[10],f[11]);
 or #(50) gate6(g6,f[12],f[13],f[14],f[15]);
 or #(50) gate7(g7,f[16],f[17],f[18],f[19]);
 or #(50) gate8(g8,f[20],f[21],f[22],f[23]);
 or #(50) gate9(g9,f[24],f[25],f[26],f[27]);
 or #(50) gate10(g10,f[28],f[29],f[30],f[31]);
 or #(50) gate11(g11,g3,g4,g5,g6);
 or #(50) gate12(g12,g7,g8,g9,10);
 or #(50) gate(Out,g11,g12);
 endmodule
