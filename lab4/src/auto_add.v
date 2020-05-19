module auto_add(clk,rst,start,DONE,sum_out);
input clk,rst,start;
output DONE;
output [31:0] sum_out;

wire NEXT_ZERO;
wire LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL;

datapath #(32) dp(clk, rst, SUM_SEL, NEXT_SEL, A_SEL, LD_SUM, LD_NEXT, NEXT_ZERO, sum_out);
FSM fsm(clk,rst,start,NEXT_ZERO, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);

endmodule
