`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 05:39:08 PM
// Design Name: 
// Module Name: TFF_tb
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


module TFF_tb;   
// Inputs
  reg T;
  reg clk;
  reg reset;
  // Outputs
  wire Q;
  // Instantiate the TFlipFlop module
  TFF dut (
    .T(T),
    .clk(clk),
    .Q(Q),
    .reset(reset)
  );
  // Clock generation
  always #5 clk = ~clk;
  // Stimulus
  initial begin
    // Initialize inputs
    T = 1;
    clk = 0;
    reset = 1;
    #10 reset = 0;
    // Apply inputs
    #100 T = 1;
    #100 $finish;
  end

endmodule
