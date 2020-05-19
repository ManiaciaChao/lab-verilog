`timescale 1ns / 1ps
`include "task4.v"
module lab3_4_tb();
reg clk,en,rst;
reg [3:0] Q;

initial
  begin
    clk = 1'b0;
    en  = 1'b0;
    rst = 1'b0;
    Q   = 3'b0000;
    #300 $stop;
  end

always #10 clk = ~clk;

initial
  begin
    #40 rst =1;
    #20 rst =0;
  end

initial
  begin
    #20 en =1;
    #150 en =0;
    #40 en =1;
  end

CNT4_synch_reset_enable c(clk,rst,en,Q);

endmodule
