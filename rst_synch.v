`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 08:38:34
// Design Name: 
// Module Name: rst_synch
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


module rst_synch(

    input clk_sync,
    input async_rst,
    output sync_rst

    );
    
    (* ASYNC_REG = "TRUE" *) reg syn_reg1,syn_reg2;
    
    always @(posedge clk_sync,negedge  async_rst) begin 
    
        if(!async_rst) 
            syn_reg1 <= 0;
        else
            syn_reg1 <= 1;
    
    end
    
    always @(posedge clk_sync,negedge  async_rst) begin 
    
        if(!async_rst) 
            syn_reg2 <= 0;
        else
            syn_reg2 <= syn_reg1;    
    
    end    
    assign sync_rst = syn_reg2;
    
endmodule
