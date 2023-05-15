`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:23:57 PM
// Design Name: 
// Module Name: multiplier_regs_loading_tb
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


module multiplier_regs_loading_tb;
    reg [7:0] md = 8'b00001111;
    reg [7:0] mr = 8'b00001000;
    reg reset = 0;
    reg start = 0;
    reg clk = 0;
    wire [15:0] product;
    multiplier dut (
        .md(md),
        .mr(mr),
       .reset(reset),
        .start(start),
        .clk(clk),
        .product(product)
    );

    // Generate a clock signal
    always #5 clk = ~clk;

    // Apply stimulus to the inputs
    initial begin
        start = 0;
        reset =1;
        #100 reset=1; 
        #100   start=1;
       #100 
       start = 0;
       reset =1;
       #100
       start =1;
        #1000 $finish;
    end
    // Dump waveform
    initial begin
        $dumpfile("multiplier_regs_loading_tb.vcd");
        $dumpvars(0, dut);
    end
endmodule
