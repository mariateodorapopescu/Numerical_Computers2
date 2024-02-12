`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:45:42 PM
// Design Name: 
// Module Name: IF
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


module IF(input clk, reset, PCSrc, PC_write, 
          input [31:0] PC_Branch, 
          output [31:0] PC_IF, INSTRUCTION_IF);
        
    wire [31:0] PC_IF_4;
    wire [31:0] PC_mux;
    wire [31:0] four = 4;
    
    PC pc(clk, reset, PC_write, PC_mux, PC_IF);
    
    mux2_1 mux(PC_Branch, PC_IF_4, PCSrc, PC_mux);
    
    adder addr(PC_IF, four, PC_IF_4);
    
    instruction_memory mem(PC_IF[11:2], INSTRUCTION_IF );
    
endmodule





