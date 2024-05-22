`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 13:37:40
// Design Name: 
// Module Name: FIFO_asn
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


module FIFO_asn#(parameter width = 16, parameter depth = 8, parameter adr_width = $clog2(depth))(

    input wire clk_w,
    input wire clk_r,
    input wire wr_en,
    input wire rd_en,
    input wire reset,
    input wire [width-1:0] data_in,
    output wire [width-1:0] data_out,
    output wire FIFO_full,
    output wire FIFO_empty

    );
    
    wire wr_syn_rst;
    wire rd_syn_rst;
    wire FIFO_full_int;
    wire FIFO_empty_int;
    wire write_int;
    wire read_int;
    wire [adr_width:0] read_adr_int;
    wire [adr_width:0] read_adr_gray;
    wire [adr_width:0] read_adr_gray_syn;
    wire [adr_width:0] read_adr_syn;
    wire [adr_width:0] write_adr_int;
    wire [adr_width:0] write_adr_gray;
    wire [adr_width:0] write_adr_gray_syn;
    wire [adr_width:0] write_adr_syn;
    
    assign FIFO_full = FIFO_full_int;
    assign FIFO_empty = FIFO_empty_int;

    memory #(width,depth,adr_width) memory1 (.data_in(data_in),
    .w_adr(write_adr_int[adr_width-1:0]),
    .r_adr(read_adr_int[adr_width-1:0]),
    .load(write_int),
    .read(read_int),
    .clk_w(clk_w),
    .data_out(data_out));
    
    rst_synch wr_rst_syn (.clk_sync(clk_w),
     .async_rst(reset),
     .sync_rst(wr_syn_rst));
     
     
     
     rst_synch rd_rst_syn (.clk_sync(clk_r),
     .async_rst(reset),
     .sync_rst(rd_syn_rst));
     
    write_logic #(width,depth,adr_width) write (.clk_w(clk_w),
     .reset(wr_syn_rst),
     .wr_en(wr_en),
     .FIFO_full(FIFO_full_int),
     .write(write_int),
     .write_adr(write_adr_int));
     
     bin2gray #(adr_width+1) convwr (.data_in(write_adr_int),
     .data_out(write_adr_gray));
     
     gray2bin #(adr_width+1) convrd_full (.data_in(write_adr_gray_syn),
     .data_out(write_adr_syn));
     
     synch #(adr_width+1) synrd2wr (.syn_clk(clk_w),
     .in(write_adr_gray),
     .syn_out(write_adr_gray_syn));
     
     full_logic #(depth,adr_width) full (.write_adr(write_adr_int),
     .read_adr(read_adr_syn),
     .FIFO_full(FIFO_full_int));
     
     read_logic #(width,depth,adr_width) read (.clk_r(clk_r),
     .reset(rd_syn_rst),
     .rd_en(rd_en),
     .FIFO_empty(FIFO_empty_int),
     .read(read_int),
     .read_adr(read_adr_int));
     
     bin2gray #(adr_width+1) convrd (.data_in(read_adr_int),
     .data_out(read_adr_gray));
     
     gray2bin #(adr_width+1) convwr_empty (.data_in(read_adr_gray_syn),
     .data_out(read_adr_syn));
     
     synch #(adr_width+1) synwr2rd (.syn_clk(clk_r),
     .in(read_adr_gray),
     .syn_out(read_adr_gray_syn));
     
     empty_logic #(depth,adr_width) empty (.write_adr(write_adr_syn),
     .read_adr(read_adr_int),
     .FIFO_empty(FIFO_empty_int));
     
endmodule
