`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 07:42:51 PM
// Design Name: 
// Module Name: counter_n_tb
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


module counter_n_tb;
parameter n = 32;
parameter x = 500000;
reg clk;
reg reset;
reg en;
wire [n-1:0]count;

  counter_n #(n, x) dut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .count(count)
  );
  
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    en = 0;
    #100 reset = 0;
    en = 1;
    #1000 $finish;
  end
endmodule
