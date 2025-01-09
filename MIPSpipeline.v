`timescale 1 ps / 100 fs
module MIPSpipeline(clk, reset, WB_Data_Out);
    input clk, reset;
    output [31:0] WB_Data_Out; // Added output to observe the Write Back stage data
    
    wire [31:0] PC, PCin;
    wire [31:0] PC4, ID_PC4, EX_PC4;
    wire [31:0] PCbne, PC4bne, PCj, PC4bnej, PCjr; // PC signals in MUX
    wire [31:0] Instruction, ID_Instruction, EX_Instruction; // Output of Instruction Memory
    wire [5:0] Opcode, Function; // Opcode, Function

    // Extend
    wire [15:0] imm16; // immediate in I type instruction
    wire [31:0] Im16_Ext, EX_Im16_Ext;
    wire [31:0] sign_ext_out, zero_ext_out;

    // Regfile
    wire [4:0] rs, rt, rd, EX_rs, EX_rt, EX_rd, EX_WriteRegister, MEM_WriteRegister, WB_WriteRegister;
    wire [31:0] WB_WriteData, ReadData1, ReadData2, ReadData1Out, ReadData2Out, EX_ReadData1, EX_ReadData2;

    // ALU
    wire [31:0] Bus_A_ALU, Bus_B_ALU, Bus_B_forwarded;
    wire [31:0] EX_ALUResult, MEM_ALUResult, WB_ALUResult;
    wire ZeroFlag, OverflowFlag, CarryFlag, NegativeFlag, notZeroFlag;

    wire [31:0] WriteDataOfMem, MEM_ReadDataOfMem, WB_ReadDataOfMem;

    // Control signals 
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, SignZero, JRControl;
    wire ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_Branch, ID_JRControl;
    wire EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_Branch, EX_JRControl;
    wire MEM_MemtoReg, MEM_RegWrite, MEM_MemRead, MEM_MemWrite;
    wire WB_MemtoReg, WB_RegWrite;
    wire [1:0] ALUOp, ID_ALUOp, EX_ALUOp;
    wire [1:0] ALUControl;
    wire bneControl, notbneControl;
    wire JumpControl, JumpFlush;
    wire [1:0] ForwardA, ForwardB;

    // Flush
    wire IF_flush, IFID_flush, notIFID_flush, Stall_flush, flush;

    // Shift left
    wire [31:0] shiftleft2_bne_out, shiftleft2_jump_out; // shift left output

    // PC Write Enable, IF/ID Write Enable
    wire PC_WriteEn, IFID_WriteEn;

    //====== PC register======
    register PC_Reg(PC, PCin, PC_WriteEn, reset, clk);
    Add Add1(PC4, PC, {29'b0, 3'b100}); // PC4 = PC + 4

    InstructionMem InstructionMem1(Instruction, PC);

    // Register IF/ID
    register IFID_PC4(ID_PC4, PC4, IFID_WriteEn, reset, clk);
    register IFID_Instruction(ID_Instruction, Instruction, IFID_WriteEn, reset, clk);
    RegBit IF_flush_bit(IFID_flush, IF_flush, IFID_WriteEn, reset, clk);

    //========= ID STAGE===========
    assign Opcode = ID_Instruction[31:26];
    assign Function = ID_Instruction[5:0];
    assign rs = ID_Instruction[25:21];
    assign rt = ID_Instruction[20:16];
    assign rd = ID_Instruction[15:11];
    assign imm16 = ID_Instruction[15:0];

    // Main Control
    Control MainControl(
        RegDst,
        ALUSrc,
        MemtoReg,
        RegWrite,
        MemRead,
        MemWrite,
        Branch,
        ALUOp,
        Jump,
        SignZero,
        Opcode
    );

    // Regfile
    regfile Register_File(
        ReadData1,
        ReadData2,
        WB_WriteData,
        rs,
        rt,
        WB_WriteRegister,
        WB_RegWrite,
        reset,
        clk
    );

    // Forward Read Data if Write and Read at the same time
    WB_forward WB_forward_block(ReadData1Out, ReadData2Out, ReadData1, ReadData2, rs, rt, WB_WriteRegister, WB_WriteData, WB_RegWrite);

    // Sign-extend
    sign_extend sign_extend1(sign_ext_out, imm16);

    // Zero-extend
    zero_extend zero_extend1(zero_ext_out, imm16);

    // Immediate extend: sign or zero
    mux2x32to32 muxSignZero(Im16_Ext, sign_ext_out, zero_ext_out, SignZero);

    // Output assignment for observation
    assign WB_Data_Out = WB_WriteData; // Assign the Write Back data to the output
    
endmodule