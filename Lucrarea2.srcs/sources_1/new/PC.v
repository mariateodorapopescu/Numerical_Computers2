`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:34:30 PM
// Design Name: 
// Module Name: PC
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


module PC(input clk, res, write, 
          input [31:0] in, 
          output reg [31:0] out);
          
    always @(posedge clk)
        begin
        // Verifica daca semnalul de reset este activat
            if (res)
                out <= 32'b0;
        else 
            // Daca semnalul de scriere este activat
            if (write)
                out <= in;  
        end
        
endmodule








