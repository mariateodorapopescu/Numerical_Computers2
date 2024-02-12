`timescale 1ns / 1ps
// implementeaz? o etap? în pipeline-ul unui procesor. 
// Se ocup? de datele care provin din memoria principal? 
// ?i sunt preg?tite pentru a fi scrise în registrul de 

// de ce se folosesc op nonblocante?
// 1. crea modele de simulare mai precise
// 2.  reduce dependen?a de ordinea în care sunt scrise instruc?iunile în cod.
// 3. preveni deadlock
// 4. permit amânarea evalu?rii pân? la sfâr?itul ciclului de ceas
// în EX_MEM, MEM_WB, evenimentele sunt tratate în cadrul blocurilor always @(posedge clk), 
// unde actualiz?rile de stare apar pe baza unui semnal de ceas.
// în hazard_detection, unde always @* reprezint? orice modificare a oric?rui semnal din list?, 
// ?i opera?iile sunt evaluate în paralel.
module MEM_WB(input clk,
              input reset,
              input write,
              
              input [31:0] read_data_MEM,
              input [31:0] address_MEM,
              input [4:0] RD_MEM,
              input RegWrite_MEM,
              input MemtoReg_MEM,
             
              output reg [31:0] read_data_WB,
              output reg [31:0] address_WB,
              output reg [4:0] RD_WB,
              output reg RegWrite_WB,
              output reg MemtoReg_WB);
    
     always@(posedge clk) begin
        if (reset) begin 
        // Dac? semnalul de reset este activat, se reseteaz? valorile Write Back
        // operatii nonblocante
         read_data_WB <= 0;
         address_WB <= 0;
         RD_WB <= 0;
         RegWrite_WB <= 0;
         MemtoReg_WB <= 0;
        end 
        else begin 
           if (write)
           // Dac? semnalul de scriere este activat, se încarc? datele din etapa MEM în etapa Write Back
           begin 
             read_data_WB <= read_data_MEM;
             address_WB <= address_MEM;
             RD_WB <= RD_MEM;
             RegWrite_WB <= RegWrite_MEM;
             MemtoReg_WB <= MemtoReg_MEM;
           end
        end 
     end         
endmodule