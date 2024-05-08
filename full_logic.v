`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 11:29:18
// Design Name: 
// Module Name: full_logic
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


module full_logic#(parameter depth = 8, parameter adr_width = $clog2(depth))(

    input wire [adr_width : 0] write_adr,
    input wire [adr_width : 0] read_adr,
    output wire FIFO_full

    );
    
    assign FIFO_full = (write_adr[adr_width-1:0] == read_adr[adr_width-1:0]) && (write_adr[adr_width] != read_adr[adr_width]);
    
endmodule
