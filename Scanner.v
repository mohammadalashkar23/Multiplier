`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 01:38:04 AM
// Design Name: 
// Module Name: Scanner
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






module Scanner(input clk, input [7:0] mr,md, input push_button, output [6:0] segments, output  [3:0] anode_active, output [15:0]product);
    wire clk_out;
    wire w200;
    wire [1:0] s;
    wire [13:0] c;
    reg [3:0] seg_value;
    wire [3:0] D4,D3,D2,D1,D0;
    //wire [15:0]product;
    wire out;
    Pushbutton p1(clk, 0, push_button, out);
    //Pushbutton p2(clk, 0, push_button2, out2);
    clock_divider #(50000000) divider(clk, 0, clk_out);
    clock_divider #(250000) divider_200Hz(clk, 0, w200);
    multiplier( md,mr, out, clk,product);
    
    
    BCD bcd(product,D4,D3,D2,D1,D0);
    wire o = product[0]||product[1]||product[2]||product[3]||product[4]||product[5]||product[6]||product[7]||product[8]||product[9]||product[10]||product[11]||product[12]||product[13]||product[14]||product[15];
    assign o = ~o;
    counter_n #(2, 4) m4(w200, 0, 1'b1, s);
    //Shift shif(clk, D4,D3,D2,D1,D0, push_button,d4,d3,d2,d1,d0);
    always @ (s) begin
        case (s)
            2'b00: seg_value = D0;  
            2'b01: seg_value = D1;  
            2'b10: seg_value = D2;  
            2'b11: seg_value = D3;  
        endcase
    end
        SevenSegDecWithEn seg (s, seg_value, segments, anode_active);
endmodule
