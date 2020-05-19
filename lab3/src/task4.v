`timescale 1ns / 1ps
module CNT4_synch_reset_enable(input clk,
                               input rst,
                               input en,
                               output reg [3:0] Q);
reg [3:0] Q1;

always @(posedge clk)
  begin
    if (rst)
      Q = 4'b0000;
    else if(!en)
      Q <= Q + 1;
  end
endmodule
