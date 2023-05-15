`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 07:34:18 PM
// Design Name: 
// Module Name: clockDivider_tb
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


module clockDivider_tb;
parameter n = 500000;
reg clk;
reg rst;
wire clk_out;

clockDivider #(n) dut (
    .clk(clk),
    .rst(rst),
    .clk_out(clk_out)
  );
initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #10 rst = 0;
    
    #100000000000 rst = 1;
    #10 $finish;
end 
endmodule
