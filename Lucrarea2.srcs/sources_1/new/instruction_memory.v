`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:34:30 PM
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(input [9:0] address, 
                          output reg[31:0] instruction);

  reg [31:0] codeMemory [0:1023];
  
  initial $readmemh("code_stud.mem", codeMemory);
  
   always @(address) begin
        if (address >= 0 && address <= 1023)
            instruction <= codeMemory[address];
        else
            // Valoare implicita pentru adrese invalide
            instruction <= 32'hFFFFFFFF; 
    end
        
endmodule





