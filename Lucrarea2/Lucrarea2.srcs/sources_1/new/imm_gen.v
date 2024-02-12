`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 12:34:30 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(input [31:0] in,
               output reg [31:0] out);
    
    wire [9:0] switch; 
    assign switch = {in[14:12], in[6:0]};
    
    always @ (*) 
        begin
        case(switch)        
            // instructiuni finalizate
            10'bXXXXXXXXXX:out <= 32'bX;
            
            // instructiune de tip I 
            // lw
            10'b0100000011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // addi
            10'b0000010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // andi
            10'b1110010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // ori
            10'b1100010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // xori
            10'b1000010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // slti
            10'b0100010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            // sltiu
            10'b0110010011: out <=  {{21 {in[31]}}, in[30:25], in[24:21], in[20]};      
            
            // instructiune de tip S 
            // srli, srai
            10'b1010010011: out <=  {{21 {in[31]}}, in[30:25], in[11:8], in[7]};        
            // slli
            10'b0010100011: out <=  {{21 {in[31]}}, in[30:25], in[11:8], in[7]};        
            // sw
            10'b0100100011: out <=  {{21 {in[31]}}, in[30:25], in[11:8], in[7]};        
            
            // instructiune de tip B 
            // beq
            10'b0001100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            // bne
            10'b0011100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            // blt
            10'b1001100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            // bge
            10'b1011100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            // bltu
            10'b1101100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            // bgeu
            10'b1111100011: out <=  {{20 {in[31]}}, in[7], in[30:25], in[11:8], 1'b0};  
            
            // fara instructiune
            default: out <= 32'b0;
        endcase
        end
endmodule








