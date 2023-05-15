`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 07:40:39 PM
// Design Name: 
// Module Name: counter_n
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


module counter_n #(parameter x=4,n=3)( input clk, input reset, input en,output reg[x-1:0]count);
 
always @(posedge clk, posedge reset) begin

 if (reset == 1)
 count <= 0; // non-blocking assignment  // initialize flip flop here
 else begin
 if(en) 
        begin
       if(count== n -1)
        count <= 0;
        else count <= count + 1; // non-blocking assignment  // normal operation
        end    
    end
end
endmodule


