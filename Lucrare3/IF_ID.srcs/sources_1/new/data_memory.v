`timescale 1ns / 1ps

module data_memory(
    input clk,
    input mem_read,      // Signal to enable memory read
    input mem_write,     // Signal to enable memory write
    input [31:0] address, // Address for read/write
    input [31:0] write_data, // Data to be written to memory
    output reg [31:0] read_data // Data read from memory
);

    reg [31:0] mem [0:1023];
    integer i;

    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            mem[i] = 32'b0;
        end
    end

    // Asynchronous read
//    Dac? mem_read este activ, datele de 
//la adresa specificat? (address[11:2]) sunt citite ?i stocate în read_data.
    always @(posedge clk or posedge mem_read or posedge address) begin
        if (mem_read) begin
            read_data <= mem[address[11:2]];
        end
    end

    // Synchronous write
//    Dac? mem_write este activ, datele de la 
//adresa specificat? (address[11:2]) sunt actualizate cu valorile din write_data.
    always @(posedge clk) begin
        if (mem_write) begin
            mem[address[11:2]] <= write_data;
        end
    end

endmodule