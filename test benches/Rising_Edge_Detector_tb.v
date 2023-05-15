`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 06:05:43 PM
// Design Name: 
// Module Name: Rising_Edge_Detector_tb
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


module Rising_Edge_Detector_tb;
reg clock;
reg reset; 
reg w;
wire z;

Rising_Edge_Detector dut(.clock(clock), .reset(reset), .w(w), .z(z));

  always #5 clock = ~clock;
  
  initial begin
  clock = 0;
  reset = 1;
  w = 0;
  #10 reset = 0;
  #10 w = 1;
  #10 w = 0;
  #10 w = 1;
  #10 w = 0;
  #10 w = 0;
  #10 w = 1;
  #10 $finish;
  end 
endmodule
