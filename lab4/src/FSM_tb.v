`timescale 1ns / 1ps
module FSM_tb();

reg clk,rst,start,next_zero;
wire LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE;
initial
  begin
    clk = 1'b0;
    rst = 1'b1;
    start= 1'b0;
    next_zero= 1'b0;
    #200 $stop;
  end

always
  #10 clk = !clk;
initial
  #15 rst = !rst;
initial
  #120 next_zero = !next_zero;
initial
  begin
    #35 start = !start;
    #105 start = !start;
  end

FSM fsm(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);

endmodule
