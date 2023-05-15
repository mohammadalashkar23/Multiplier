`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 10:06:41 PM
// Design Name: 
// Module Name: Pushbutton_tb
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


module Pushbutton_tb;
reg clk, rst, in;
wire out;

    // Instantiate the DUT (Device Under Test)
    Pushbutton DUT (
        clk,
        rst,
        in,
        out
    );
    // Clock generator
    always begin
        #5 clk = ~clk; // Change state every 5 time units
    end

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        in  = 0;
        #100 rst = 0;
        #100 in = 1;
        #100 in = 0;
        
    end
endmodule
