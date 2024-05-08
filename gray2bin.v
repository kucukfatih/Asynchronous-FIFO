`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 10:05:49
// Design Name: 
// Module Name: gray2bin
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


module gray2bin#(parameter K = 8)(

    input wire [K-1:0] data_in,
    output reg [K-1:0] data_out

    );
  integer i;  
  
    always @(*) begin 
        for(i = 0; i < K; i = i + 1) begin 
        
        data_out[i] = ^ (data_in >> i);
        
        end
    end
endmodule
