`timescale 1ns / 1ps

module adder(cout,sum,a,b);

parameter WIDTH=8;
output cout;
output [WIDTH-1:0] sum;
input [WIDTH-1:0] a,b;

assign {cout,sum} = a+b;

endmodule
