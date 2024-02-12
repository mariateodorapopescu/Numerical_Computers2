`timescale 1ns / 1ps

module EX(
    input [31:0] IMM_EX,
    input [31:0] REG_DATA1_EX,
    input [31:0] REG_DATA2_EX,
    input [31:0] PC_EX,
    input [2:0] FUNCT3_EX,
    input [6:0] FUNCT7_EX,
    input [4:0] RD_EX,
    input [4:0] RS1_EX,
    input [4:0] RS2_EX,
    input RegWrite_EX,
    input MemtoReg_EX,
    input MemRead_EX,
    input MemWrite_EX,
    input [1:0] ALUop_EX,
    input ALUSrc_EX,
    input Branch_EX,
    input [1:0] forwardA,
    input [1:0] forwardB,
    input [31:0] ALU_DATA_WB,
    input [31:0] ALU_OUT_MEM,
    output ZERO_EX,
    output [31:0] ALU_OUT_EX,
    output [31:0] PC_Branch_EX,
    output [31:0] REG_DATA2_EX_FINAL
);

    wire [31:0] MUX_OUT_1, MUX_OUT_2, MUX_OUT_3;
    wire [3:0] ALU_control_output;

    always @* begin
        $display("Initial Values: REG_DATA1_EX: %h, REG_DATA2_EX: %h, ALU_DATA_WB: %h, ALU_OUT_MEM: %h", 
                 REG_DATA1_EX, REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM);
    end


    mux4_1 MUX1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardA, MUX_OUT_1);
    mux4_1 MUX2(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardB, MUX_OUT_2);

    always @* begin
        $display("Values after 4-to-1 MUX: MUX_OUT_1: %h, MUX_OUT_2: %h", MUX_OUT_1, MUX_OUT_2);
        $display("Immediate value and ALUSrc: IMM_EX: %h, ALUSrc_EX: %b", IMM_EX, ALUSrc_EX);
        $display("2-to-1 MUX Output: MUX_OUT_3: %h", MUX_OUT_3);
    end

    mux2_1 MUX3_2_1(MUX_OUT_2, IMM_EX, ALUSrc_EX, MUX_OUT_3);

    ALUcontrol ALU_control_unit(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALU_control_output);
    ALU ALU_unit(ALU_control_output, MUX_OUT_1, MUX_OUT_3, ZERO_EX, ALU_OUT_EX);

   always @* begin
        $display("ALU Operation Results: Control Output: %h, MUX_OUT_1: %h, MUX_OUT_3: %b, ALU_OUT_EX: %h", 
                 ALU_control_output, MUX_OUT_1, MUX_OUT_3, ALU_OUT_EX);
    end

    adder ADDER(PC_EX, IMM_EX, PC_Branch_EX);

    assign REG_DATA2_EX_FINAL = MUX_OUT_2;

endmodule