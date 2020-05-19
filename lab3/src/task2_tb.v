`timescale 1ns / 1ps
`include "Register_synch_reset_load.v"
module task2_tb();
reg clk,en,rst;
reg [3:0] D;
reg [3:0] Q;

initial
  begin
    clk = 1'b0;
    en  = 1'b0;
    rst = 1'b0;
    D   = 3'b000;
    #200 $stop;
  end
initial
  begin
    #20 D = 4'b0101;
    #40 D = 4'b1001;
  end
always #10 clk = !clk;
always
  begin
    #40 en = 1;
    #20 en = 0;
  end
always
  begin
    #80 rst = 1;
    #50 rst = 0;
  end
Register_synch_reset_load R(D, clk, en, Q);

endmodule
