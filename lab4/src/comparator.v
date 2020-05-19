`timescale 1ns / 1ps

module comparator(is_greater,is_equal,is_less,a,b);
parameter WIDTH=8;

output is_greater,is_equal,is_less;
input [WIDTH-1:0] a,b;

assign is_equal = (a == b) ? 1'b1 : 1'b0;
assign is_greater = (a > b) ? 1'b1 : 1'b0;
assign is_less = (a < b) ? 1'b1 : 1'b0;

endmodule
