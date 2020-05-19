// mux2to1_dataflow.v
`timescale 1ns / 1ps

module mux2to1_dataflow(output out1,
                        input a,
                        input b,
                        input sel);
assign out1 = sel ? a: b;
endmodule
