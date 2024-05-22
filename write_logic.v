`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 10:40:10
// Design Name: 
// Module Name: write_logic
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


module write_logic#(parameter width = 32, parameter depth = 8, parameter adr_width = $clog2(depth))(

    input wire clk_w,
    input wire reset,
    input wire wr_en,
    input wire FIFO_full,
    output wire write,
    output wire [adr_width : 0] write_adr

    );
    
    reg [adr_width : 0] address;
    
    assign en = !FIFO_full && wr_en;
    
    assign write_adr = address;
    
    assign write = en;
    
    always @(posedge clk_w, negedge reset) begin
    
        if(!reset) 
            address <= 0;
        else if (en)
            address <= address + 1;
        else 
            address <= address;
    end
    
endmodule
