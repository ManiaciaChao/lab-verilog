`timescale 1ns / 1ps
module auto_add_tb();

reg clk,rst,start;
wire DONE,sum_out;

initial
  begin
    clk = 1'b0;
    rst = 1'b1;
    start = 1'b0;
    #200 $stop;
  end

always #10 clk = !clk;
initial
  #15 rst = !rst;
initial
  #20 start =!start;

auto_add a(clk,rst,start,DONE,sum_out);

endmodule
