`timescale 1ns / 1ps
module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);
//Se combina aceste semnale �ntr-un singur cuv�nt de control (controlSignals).
// ia instr, da afara inputul, gen da codarea speciala ptr ALU
always@(ALUop, funct7, funct3) 
begin
    casex({ALUop, funct7, funct3}) 
    // deci, casex indica faptul ca nu conteaza daca bitul cu x e 0 sau 1
        // casez indica faptul ac e 0 sau 1
        // eventual depinde cum pun x-ii, gen ori ma int inceputul si finalul, ori ce e in int
        12'b00xxxxxxxxxx: ALUinput = 4'b0010; // ld, sd
        12'b100000000000: ALUinput = 4'b0010; // add
        12'b100100000000: ALUinput = 4'b0110; // sub
        12'b100000000111: ALUinput = 4'b0000; // and
        12'b1x0000000110: ALUinput = 4'b0001; // or
        12'b100000000100: ALUinput = 4'b0011; // xor
        12'b100000000101: ALUinput = 4'b0101; // srl, srli
        12'b100000000001: ALUinput = 4'b0100; // sll, slli
        12'b100100000101: ALUinput = 4'b1001; // sra, srai
        12'b100000000011: ALUinput = 4'b0111; // sltu
        12'b100000000010: ALUinput = 4'b1000; // slt
        12'b01xxxxxxx00x: ALUinput = 4'b0110; // beq, bne
        12'b01xxxxxxx10x: ALUinput = 4'b1000; // blt, bge
        12'b01xxxxxxx11x: ALUinput = 4'b0111; // bltu, bgeu
    endcase
end
endmodule