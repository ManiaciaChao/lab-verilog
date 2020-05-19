module D_latch(input clk,
               input D,
               output reg Q);
always @ (clk or D)
  begin
    if (clk)
      begin
        Q <= D;
      end
  end
endmodule

