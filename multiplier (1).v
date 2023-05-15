`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 05:11:48 PM
// Design Name: 
// Module Name: multiplier
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
//module signed_mr (
 //   input [15:0] md,
 //  input [7:0] mr,
 //  input start,
 // output [15:0] product
  //  );
//endmodule
//multiplier (.md(), .mr()., .start(), .product())


module multiplier(
    input [7:0] md,
    input [7:0] mr,
    input reset, //connected to TFF reset
    input start, //30 ms
    input clk,
    output reg [15:0] product
    );
    wire [15:0] md_reg;
    assign md_reg[7:0] = md;
    assign md_reg[15:8] = 8'b0;
    
    wire iterator; //posedge section1 , negedge section 2 executed

    TFF tff1(.T(1), .clk(clk), .Q(iterator));
    wire started;
    Pushbutton btn(clk,reset,start, started); //start push button 
    reg [7:0] shifted_mr;
    reg [15:0] shifted_md;
    //load mr and md regs
    always @(  start  ) begin
  
        if(start)begin 
            product <= 0;
            shifted_mr <= mr;
            shifted_md <= md_reg;
            product <= 0;
        end
    end
    //section 1 
    always @ (posedge iterator) begin 
          
            //shift shifted_mr
            shifted_mr[6:0] <= shifted_mr[7:1];
            shifted_mr[7] <= 0;
            //shift  shifted_md 
            shifted_md[15:1]<= shifted_md[14:0];
            shifted_md[0] = 0;    
    end
    //section 2
    always @ (negedge  iterator) begin 
            if(shifted_mr[0])begin 
                product <= product + shifted_md;
            end else product <= product;
        
    end
endmodule
