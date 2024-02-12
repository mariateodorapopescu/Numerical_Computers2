`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:40:19 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(input [31:0] pc_in, Instruction_IF,
            input write, clk, reset,
            output reg [31:0] PC_out, Instruction_out);
        
  always@(posedge clk) begin 
    if (reset)
        begin
             // Dac? semnalul de reset este activat, reset?m registrul
            Instruction_out <= 32'b0;
            PC_out <= 32'b0;
        end     
    else   
        if (write)
            begin
            // Dac? semnalul de scriere este activat, actualiz?m registrul cu noile date
                Instruction_out <= Instruction_IF;
                PC_out <= pc_in;
            end
    end
endmodule

