`timescale 1ns / 1ps

module mux2_1(out,a,b,sel);

parameter WIDTH = 8;
output [WIDTH-1:0] out;
input [WIDTH-1:0] a,b;
input sel;

assign out = sel ? a: b;

endmodule
