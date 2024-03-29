`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:41:06 PM
// Design Name: 
// Module Name: RISC_V_IF_ID
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_V_IF_ID(input clk, reset,         
                    input IF_ID_write,           
                    input PCSrc, PC_write,       
                    input [31:0] PC_Branch,      
                    input RegWrite_WB,           
                    input [31:0] ALU_DATA_WB,   
                    input [4:0] RD_WB,           
                   
                    output [31:0] PC_ID,         
                    output [31:0] INSTRUCTION_ID,
                    output [31:0] IMM_ID,        
                    output [31:0] REG_DATA1_ID,  
                    output [31:0] REG_DATA2_ID,  
                    
                    output [2:0] FUNCT3_ID,      
                    output [6:0] FUNCT7_ID,      
                    output [6:0] OPCODE_ID,     
                    output [4:0] RD_ID,          
                    output [4:0] RS1_ID,         
                    output [4:0] RS2_ID);        

    wire[31:0] PC_out;
    wire[31:0] INSTRUCTION_out;
    
    IF ifetch(clk, reset, PCSrc, PC_write, PC_Branch, PC_out, INSTRUCTION_out);
    
    IF_ID pipe(PC_out, INSTRUCTION_out, PC_write, clk, reset, PC_ID, INSTRUCTION_ID);
  
    ID insd(clk, PC_ID, INSTRUCTION_ID, RegWrite_WB, ALU_DATA_WB, RD_WB, IMM_ID, REG_DATA1_ID, REG_DATA2_ID, FUNCT3_ID, FUNCT7_ID, OPCODE_ID, RD_ID, RS1_ID, RS2_ID);
       
endmodule