`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 06:04:36 PM
// Design Name: 
// Module Name: Rising_Edge_Detector
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


module Rising_Edge_Detector(input clock,input reset,input w, output reg z);
reg [1:0] CurrentState, NextState;
parameter [1:0] A=2'b00, B=2'b01, C=2'b10;
always @ (w or CurrentState)
begin
case (CurrentState)
A: if (w==0)
NextState = A;
else
NextState = B;
B: if (w==0)
NextState = A;
else
NextState = C;
C: if (w==0)
NextState = A;
else
NextState = C;
default: NextState = A;
endcase
end
always @ (posedge clock or posedge reset)
begin
if (reset==1)
begin
CurrentState <= A;
z <= 1'b0;
end
else
begin
CurrentState <= NextState;
if (w == 1 && CurrentState == A && NextState == B)
begin
z <= 1'b1;
end
else begin
z <= 1'b0;
end
end
end
endmodule
