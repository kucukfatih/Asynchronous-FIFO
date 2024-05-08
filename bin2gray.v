`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 11:51:43
// Design Name: 
// Module Name: bin2gray
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


module bin2gray#(parameter K = 8)(

    input wire [K-1:0] data_in,
    output reg [K-1:0] data_out

    );
    
    always @(*) begin 
        
        data_out =  (data_in >> 1) ^ data_in;
        
    end
endmodule
