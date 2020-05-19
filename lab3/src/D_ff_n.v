module D_ff_n(input clk,
              input D,
              output reg Q);
always @ (negedge clk)
  begin
    Q <= D;
  end
endmodule
