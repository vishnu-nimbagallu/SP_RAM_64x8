`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 23:13:40
// Design Name: 
// Module Name: ram_64_8
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

//Single port RAM 64*8 bit
module ram_64_8(
    input [7:0] data,       //We storing 8 bit data in 64 loctions
    input [5:0] addr,     //6-bits are sufficient to address (2^6=64)
    input we,               //we (Write Enable),if it is high(1) we are writing in a RAM, if Low (0) reading from RAM
    input clk,
    output [7:0] q             //8-bit data port for output
);
    reg [7:0] ram[63:0];
    reg [5:0] addr_reg;
    
    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= data;  // Write operation
            addr_reg <= addr;   
        end
        else begin
            addr_reg <= addr;   
        end
    end
    assign q = ram[addr_reg];   
endmodule