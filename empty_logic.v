`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 12:03:21
// Design Name: 
// Module Name: empty_logic
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


module empty_logic#(parameter depth = 8, parameter adr_width = $clog2(depth))(

    input wire [adr_width : 0] write_adr,
    input wire [adr_width : 0] read_adr,
    output wire FIFO_empty

    );
    
    assign FIFO_empty = (write_adr == read_adr);
    
endmodule
