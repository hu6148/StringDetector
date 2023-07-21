`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/13 21:25:02
// Design Name: 
// Module Name: detector
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


module detector(
    input clk,
    input reset_n,
    input in,
    output out
    );

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, nextstate;

    initial state<=A;

    always@(*)begin
        case(state)
            A: nextstate=(in)?A:B;
            B: nextstate=(in)?C:B;
            C: nextstate=(in)?A:D;
            D: nextstate=(in)?C:B;
        endcase
    end

    always@(posedge clk or negedge reset_n)begin
        if(reset_n==0) state<=A;
        else state<=nextstate;
    end

    assign out=(state==D)?1:0;
    
endmodule
