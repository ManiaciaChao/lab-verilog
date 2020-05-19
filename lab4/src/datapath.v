`timescale 1ns / 1ps

module datapath(clk, rst, SUM_SEL, NEXT_SEL, A_SEL, LD_SUM, LD_NEXT, NEXT_ZERO, sum_out);
parameter WIDTH = 8;

input clk,rst;
input SUM_SEL,NEXT_SEL,A_SEL;
input LD_SUM,LD_NEXT;
output NEXT_ZERO;
output [WIDTH-1:0] sum_out;

wire [WIDTH-1:0] q2,d1,d2,s1,s2;
wire [WIDTH-1:0] data,addr;


ram #(WIDTH) ram1(data, addr);

adder #(WIDTH) adder1(.sum(s1),.a(q1),.b(data));
adder #(WIDTH) adder2(.sum(s2),.a(q2),.b(1));

mux2_1 #(WIDTH) mux1(.out(d1),.a(s1),.b(0),.sel(SUM_SEL));
mux2_1 #(WIDTH) mux2(.out(d2),.a(data),.b(0),.sel(NEXT_SEL));
mux2_1 #(WIDTH) mux3(.out(addr),.a(s2),.b(q2),.sel(A_SEL));

register #(WIDTH) reg1(clk, rst, LD_SUM, d1, sum_out);
register #(WIDTH) reg2(clk, rst, LD_NEXT, d2, q2);

comparator #(WIDTH) com(.is_equal(NEXT_ZERO),.a(d2),.b(0));

endmodule
