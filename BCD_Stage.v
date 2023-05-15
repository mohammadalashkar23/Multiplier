`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 01:39:41 AM
// Design Name: 
// Module Name: BCD_Stage
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

module FA(
input a,b,cin,
output cout ,s
    );
    assign cout =a&cin|a&b|b&cin;
    assign s=a^b^cin;
endmodule

module rca_4(input [3:0]a,[3:0]b,input cin, output [3:0]s,output cout );
wire [3:1]w;
    FA fa1(.a(a[0]),.b(b[0]),.cin(cin),.cout(w[1]),.s(s[0]));
    FA fa2(.a(a[1]),.b(b[1]),.cin(w[1]),.cout(w[2]),.s(s[1]));
    FA fa3(.a(a[2]),.b(b[2]),.cin(w[2]),.cout(w[3]),.s(s[2]));
    FA fa4(.a(a[3]),.b(b[3]),.cin(w[3]),.cout(cout),.s(s[3]));
endmodule

module mux(input [3:0]a, input [3:0] b,input s,output [3:0]z);

 assign z[0]= ~s&&a[0] || s&&b[0];
 assign z[1]= ~s&&a[1] || s&&b[1];
 assign z[2]= ~s&&a[2] || s&&b[2];
 assign z[3]= ~s&&a[3] || s&&b[3];
 
  endmodule

module BCD_Stage(input in3,in2,in1,in0,output out3,out2,out1,out0);
wire [3:0] adderout;
wire  addercarry;
rca_4 add({in3,in2,in1,in0},4'b0011,0,adderout , addercarry );
//assign adderout ={,,,,in3,in2,in1,in0} +3;
wire outgate1;
wire outgate2;
assign outgate1=in0 && in2;
assign outgate2=in1 && in2;
wire outgate3;
assign outgate3= outgate1|| outgate2||in3;
mux m1({in3,in2,in1,in0},adderout,outgate3,{out3,out2,out1,out0});
endmodule
