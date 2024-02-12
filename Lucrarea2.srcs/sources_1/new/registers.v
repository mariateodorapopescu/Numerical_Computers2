`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:34:30 PM
// Design Name: 
// Module Name: registers
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


module registers(input clk, reg_write,
                 input [4:0] read_reg1, read_reg2, write_reg,
                 input [31:0] write_data,
                 output [31:0] read_data1, read_data2);
    
    reg [31:0] regs [31:0];

     // Scrie in registrul specificat daca semnalul de scriere este activat
    always @(posedge clk)  
        begin
            if (reg_write == 1)  
                regs[write_reg] <= write_data;
        end
        
    // Initializarea registrilor 
    initial begin
        for (integer i = 0; i < 32; i = i + 1)
            regs[i] <= i;
        end
        
    // Citirea datelor din cele 2 registre    
    assign read_data1 = regs[read_reg1];
    assign read_data2 = regs[read_reg2];
    
endmodule











