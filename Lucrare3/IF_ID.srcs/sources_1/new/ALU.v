module ALU(
    input [3:0] ALUop,
    input [31:0] ina,
    input [31:0] inb,
    output zero,
    output reg [31:0] out
);

    always @(ALUop or ina or inb) begin
        if (ALUop == 4'b0000) out = ina & inb;
        else if (ALUop == 4'b0001) out = ina | inb;
        else if (ALUop == 4'b0010) out = ina + inb;
        else if (ALUop == 4'b0011) out = ina ^ inb;
        else if (ALUop == 4'b0100) out = ina << inb;
        else if (ALUop == 4'b0101) out = ina >> inb;
        else if (ALUop == 4'b0110) out = ina - inb;
        else if (ALUop == 4'b0111) begin
            if (ina < inb)
                out = 32'b1;
            else
                out = 32'b0;
        end
        else if (ALUop == 4'b1000) begin
            if ($signed(ina) < $signed(inb))
                out = 32'b1;
            else
                out = 32'b0;
        end
        else if (ALUop == 4'b1001) out = ina >>> inb; // Assuming logical right shift
        else
            out = 32'b0;
    end

    assign zero = (out == 32'b0) ? 1'b1 : 1'b0;

endmodule