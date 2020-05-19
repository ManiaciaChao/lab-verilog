// mux2to1_structure.v
`timescale 1ns / 1ps

module mux2to1_structure(output out1,
                         input a,
                         input b,
                         input sel);
wire sel_,a1,b1;
not (sel_,sel);
and (a1, a, sel_);
and (b1, b, sel);
or (out1, a1, b1);
endmodule
