`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2024 16:06:50
// Design Name: 
// Module Name: synch
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


module synch#(parameter K = 8)(
    
    input wire syn_clk,
    input wire [K-1:0] in,
    output wire [K-1:0] syn_out

    );
    
  (* ASYNC_REG = "TRUE" *) reg [K-1:0] syn_reg1,syn_reg2;
   
   always @(posedge syn_clk ) begin
        
           syn_reg1 <= in;
           syn_reg2 <= syn_reg1;
        
   end
   
   assign syn_out = syn_reg2;
   
endmodule
