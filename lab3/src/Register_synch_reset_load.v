module Register_synch_reset_load(input [3:0] D,
                                 input clk,
                                 input rst,
                                 input en,
                                 output reg [3:0] Q);
always @(posedge clk)
  if (rst)
    begin         // 同步复位
      Q <= 4'b0;
    end
  else if (en)
    begin
      Q <= D;
    end
  else
    begin
      Q <= Q;
    end

endmodule
