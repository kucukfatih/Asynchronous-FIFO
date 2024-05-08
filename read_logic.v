`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 12:00:08
// Design Name: 
// Module Name: read_logic
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


module read_logic#(parameter width = 32, parameter depth = 8, parameter adr_width = $clog2(depth))(

    input wire clk_r,
    input wire reset,
    input wire rd_en,
    input wire FIFO_empty,
    output wire read,
    output wire [adr_width : 0] read_adr

    );
    
    reg [adr_width : 0] address;
    
    assign en = !FIFO_empty && rd_en;
    
    assign read_adr = address;
    
    assign read = en;
    
    always @(posedge clk_r, posedge reset) begin
    
        if(reset) 
            address <= 0;
        else if (en)
            address <= address + 1;
        else 
            address <= address;
    end
    
endmodule