`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 01:38:54 AM
// Design Name: 
// Module Name: BCD
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


module BCD(input [15:0] in,output [3:0]D4,D3,D2,D1,D0);
wire y13,y12,y11,y10;
BCD_Stage s11(1'b0,in[15],in[14],in[13],y13,y12,y11,y10);
wire y23,y22,y21,y20;
BCD_Stage s21(y12,y11,y10,in[12],y23,y22,y21,y20);
wire y33,y32,y31,y30;

BCD_Stage s31(y22,y21,y20,in[11],y33,y32,y31,y30);
wire y431,y421,y411,y401;
BCD_Stage s41(1'b0,y13,y23,y33,y431,y421,y411,y401);
wire y432,y422,y412,y402;
BCD_Stage s42(y32,y31,y30,in[10],y432,y422,y412,y402);
wire y531,y521,y511,y501;
BCD_Stage s51(y421,y411,y401,y432,y531,y521,y511,y501);
wire y532,y522,y512,y502;
BCD_Stage s52(y422,y412,y402,in[9],y532,y522,y512,y502);


wire y631,y621,y611,y601;
BCD_Stage s61(y521,y511,y501,y532,y631,y621,y611,y601);
wire y632,y622,y612,y602;
BCD_Stage s62(y522,y512,y502,in[8],y632,y622,y612,y602);


wire y731,y721,y711,y701;
BCD_Stage s71(1'b0,y431,y531,y631,y731,y721,y711,y701);
wire y732,y722,y712,y702;
BCD_Stage s72(y621,y611,y601,y632,y732,y722,y712,y702);
wire y733,y723,y713,y703;
BCD_Stage s73(y622,y612,y602,in[7],y733,y723,y713,y703);



wire y831,y821,y811,y801;
BCD_Stage s81(y721,y711,y701,y732,y831,y821,y811,y801);
wire y832,y822,y812,y802;
BCD_Stage s82(y722,y712,y702,y733,y832,y822,y812,y802);
wire y833,y823,y813,y803;
BCD_Stage s83(y723,y713,y703,in[6], y833,y823,y813,y803);




wire y931,y921,y911,y901;
BCD_Stage s91(y821,y811,y801,y832,y931,y921,y911,y901);
wire y932,y922,y912,y902;
BCD_Stage s92(y822,y812,y802,y833, y932,y922,y912,y902);
wire y933,y923,y913,y903;
BCD_Stage s93(y823,y813,y803,in[5],y933,y923,y913,y903);



wire ya31,ya21,ya11,ya01;
BCD_Stage sa1(1'b0,y731,y831,y931,ya31,ya21,ya11,ya01);
wire ya32,ya22,ya12,ya02;
BCD_Stage sa2(y921,y911,y901,y932, ya32,ya22,ya12,ya02);
wire ya33,ya23,ya13,ya03;
BCD_Stage sa3(y922,y912,y902,y933,ya33,ya23,ya13,ya03);
wire ya34,ya24,ya14,ya04;
BCD_Stage sa4(y923,y913,y903,in[4],ya34,ya24,ya14,ya04);



wire yb31,yb21,yb11,yb01;
BCD_Stage sb1(ya21,ya11,ya01,ya32,yb31,yb21,yb11,yb01);
wire yb32,yb22,yb12,yb02;
BCD_Stage sb2(ya22,ya12,ya02,ya33, yb32,yb22,yb12,yb02);
wire yb33,yb23,yb13,yb03;
BCD_Stage sb3(ya23,ya13,ya03,ya34,yb33,yb23,yb13,yb03);
wire yb34,yb24,yb14,yb04;
BCD_Stage sb4(ya24,ya14,ya04,in[3],yb34,yb24,yb14,yb04);


wire yc31,yc21,yc11,yc01;
BCD_Stage sc1(yb21,yb11,yb01,yb32,yc31,yc21,yc11,yc01);
wire yc32,yc22,yc12,yc02;
BCD_Stage sc2(yb22,yb12,yb02,yb33, yc32,yc22,yc12,yc02);
wire yc33,yc23,yc13,yc03;
BCD_Stage sc3(yb23,yb13,yb03,yb34,yc33,yc23,yc13,yc03);
wire yc34,yc24,yc14,yc04;
BCD_Stage sc4(yb24,yb14,yb04,in[2],yc34,yc24,yc14,yc04);


wire yd31,yd21,yd11,yd01;
BCD_Stage sd1(1'b0,ya31,yb31,yc31,yd31,yd21,yd11,yd01);
wire yd32,yd22,yd12,yd02;
BCD_Stage sd2(yc21,yc11,yc01,yc32, yd32,yd22,yd12,yd02);
wire yd33,yd23,yd13,yd03;
BCD_Stage sd3(yc22,yc12,yc02,yc33,yd33,yd23,yd13,yd03);
wire yd34,yd24,yd14,yd04;
BCD_Stage sd4(yc23,yc13,yc03,yc34,yd34,yd24,yd14,yd04);
wire yd35,yd25,yd15,yd05;
BCD_Stage sd5(yc24,yc14,yc04,in[1],yd35,yd25,yd15,yd05);

assign D4={yd21,yd11,yd01,yd32};
assign D3={yd22,yd12,yd02,yd33};
assign D2={yd23,yd13,yd03,yd34};
assign D1={yd24,yd14,yd04,yd35};
assign D0={yd25,yd15,yd05,in[0]};


endmodule
