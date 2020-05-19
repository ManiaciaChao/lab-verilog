// mux2to1_behaviour.v
`timescale 1ns / 1ps

module mux2to1_behaviour(output reg out1,
                         input a,
                         input b,
                         input sel);
always @ (sel,a,b)
  begin
    if (sel)
      out1 = b;
    else
      out1 = a;
  end
endmodule
