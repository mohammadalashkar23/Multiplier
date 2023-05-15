`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:41:47 PM
// Design Name: 
// Module Name: Pushbutton
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



module Pushbutton(input clk, rst, in, output out);
wire w,w2,clk2;
clockDivider c(clk,rst,clk2);
debouncer d(clk2, rst, in, w);
Asy a(w,clk2,w2); 
Rising_Edge_Detector r( clk2, rs, w2, out);
endmodule
