`timescale 1ns / 1ps
//reflect? opera?iunile specifice stadiului EX_MEM �ntr-un pipeline 
// �n care datele de la stadiul de execu?ie sunt transferate c?tre stadiul de memorie.
module EX_MEM(input clk,
              input reset,
              input write,
              
              input ZERO_EX,
              input [31:0] ALU_OUT_EX,
              input [31:0] PC_Branch_EX,
              input [31:0] REG_DATA2_EX_FINAL,
              input [4:0] RD_EX,
              input RegWrite_EX,
              input MemtoReg_EX,
              input MemRead_EX,
              input MemWrite_EX,
              input [1:0] ALUop_EX,
              input ALUSrc_EX,
              input Branch_EX,
              
              output reg ZERO_MEM,
              output reg [31:0] ALU_OUT_MEM,
              output reg [31:0] PC_Branch_MEM,
              output reg [31:0] REG_DATA2_MEM_FINAL,
              output reg [4:0] RD_MEM,
              output reg RegWrite_MEM,
              output reg MemtoReg_MEM,
              output reg MemRead_MEM,
              output reg MemWrite_MEM,
              output reg [1:0] ALUop_MEM,
              output reg ALUSrc_MEM,
              output reg Branch_MEM);
     
     always@(posedge clk) begin
//     se verific? dac? semnalul de reset este activat (reset). 
        if (reset) begin 
        // La semnalul de reset, toate ie?irile sunt resetate la valorile implicite.
         ZERO_MEM <= 0;
         ALU_OUT_MEM <= 0;
         PC_Branch_MEM <= 32'b0;
         REG_DATA2_MEM_FINAL <= 32'b0;
         RD_MEM <= 0;
         RegWrite_MEM <= 0;
         MemtoReg_MEM <= 0;
         MemRead_MEM <= 0;
         MemWrite_MEM <= 0;
         ALUop_MEM <= 0;
         ALUSrc_MEM <= 0;
         Branch_MEM <= 0;
        end 
        else begin 
           if (write)
           // La fiecare margine pozitiv? a semnalului de ceas ?i c�nd semnalul write este activat,
         // se actualizeaz? ie?irile cu valorile provenite de la stadiul de execu?ie.
        
           begin 
             ZERO_MEM <= ZERO_EX;
             ALU_OUT_MEM <= ALU_OUT_EX;
             PC_Branch_MEM <= PC_Branch_EX;
             REG_DATA2_MEM_FINAL <= REG_DATA2_EX_FINAL;
             RD_MEM <= RD_EX;
             RegWrite_MEM <= RegWrite_EX;
             MemtoReg_MEM <= MemtoReg_EX;
             MemRead_MEM <= MemRead_EX;
             MemWrite_MEM <= MemWrite_EX;
             ALUop_MEM <= ALUop_EX;
             ALUSrc_MEM <= ALUSrc_EX;
             Branch_MEM <= Branch_EX;
           end
        end 
     end         
     
endmodule
