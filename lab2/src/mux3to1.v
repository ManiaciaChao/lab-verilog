`timescale 1ns / 1ps

module mux3to1(output m,
               input u,
               input v,
               input w,
               input s0,
               input s1);
wire y;
mux2to1_dataflow m1(y,u,v,s0);
mux2to1_dataflow m2(m,y,w,s1);
endmodule
