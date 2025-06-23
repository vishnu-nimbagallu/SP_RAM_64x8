`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 23:21:40
// Design Name: 
// Module Name: ram_64_8_tb
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
/////////////////////////////////////////////////////////////////////////////////
// Single Port RAM testbench
module ram_64_8_tb;
  reg [7:0] data;  // Input data
  reg [5:0] addr;  // Address
  reg we;          // Write enable
  reg clk;         // Clock
  wire [7:0] q;    // Output data
  
  // Instantiate the RAM module
  ram_64_8 uut (
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q)
  );
  // Clock generation (100 MHz)
  initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;  
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, ram_64_8_tb);
    
    // Test 1: Write values to addresses 0, 1, 2
    data = 8'h01;
    addr = 6'd0;
    we = 1'b1;
    #10;
    data = 8'h02;
    addr = 6'd1;
    #10;
    data = 8'h03;
    addr = 6'd2;
    #10;
    we = 1'b0;
    addr = 6'd0;
    #10;
    $display("Addr 0: q = %h (Expected: 01)", q);
    addr = 6'd1;
    #10;
    $display("Addr 1: q = %h (Expected: 02)", q);
    addr = 6'd2;
    #10;
    $display("Addr 2: q = %h (Expected: 03)", q);
    we = 1'b1;
    data = 8'h04;
    addr = 6'd1;
    #10;
    we = 1'b0;
    #10;
    $display("Addr 1 (after write): q = %h (Expected: 04)", q);
    #10 $finish;
  end
  initial begin
    $monitor("Time=%0t: addr=%d data=%h we=%b q=%h", 
             $time, addr, data, we, q);
  end
endmodule