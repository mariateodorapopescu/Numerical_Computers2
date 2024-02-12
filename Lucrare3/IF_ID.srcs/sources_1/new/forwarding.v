`timescale 1ns / 1ps

module forwarding(
    input [4:0] rs1,          // RS1 address in the EX stage
    input [4:0] rs2,          // RS2 address in the EX stage
    input [4:0] ex_mem_rd,    // Register destination address in the MEM stage
    input [4:0] mem_wb_rd,    // Register destination address in the WB stage
    input ex_mem_regwrite,    // Control signal in the MEM stage
    input mem_wb_regwrite,    // Control signal in the WB stage
    output reg [1:0] forwardA, forwardB // Mux selection signals for data forwarding
);
    // Hazard in the EX stage
    always @* begin
    forwardA = 2'b00; // Implicit, nu se efectueaz? niciun forwarding pentru RS1
    forwardB = 2'b00; // Implicit, nu se efectueaz? niciun forwarding pentru RS2

    if (ex_mem_regwrite) begin
        if (ex_mem_rd != 5'b0) begin
            // Dac? exist? o scriere în registrul de memorie ?i adresa de destina?ie corespunde RS1 sau RS2,
            // atunci se activeaz? semnalele de forwarding corespunz?toare.
            if (ex_mem_rd == rs1) forwardA = 2'b10;
            else if (ex_mem_rd == rs2) forwardB = 2'b10;
        end
    end
end


    // Hazard in the MEM stage
    always @* begin
    if (mem_wb_regwrite) begin
        if (mem_wb_rd != 5'b0) begin
            // Dac? exist? o scriere în registrul WB ?i adresa de destina?ie nu corespunde unei scrieri anterioare din etapa EX,
            // ?i adresa de destina?ie corespunde RS1 sau RS2, atunci se activeaz? semnalele de forwarding corespunz?toare.
            if (!(ex_mem_regwrite && (ex_mem_rd != 5'b0) && (ex_mem_rd == rs1)) && (mem_wb_rd == rs1))
                forwardA = 2'b01;
            else if (!(ex_mem_regwrite && (ex_mem_rd != 5'b0) && (ex_mem_rd == rs2)) && (mem_wb_rd == rs2))
                forwardB = 2'b01;
        end
    end
end

endmodule