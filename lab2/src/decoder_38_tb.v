`include "decoder_38.v"
`timescale 1ns / 1ps

module decoder_38_tb();
reg [2:0] cba;
wire [7:0] f;
decoder_38 d(.F(f),.CBA(cba));
initial
  begin
    $display ("$time::[CBA] [F]------");
    $monitor ("%t::", $time, "[%b]\t[%b]", cba,f);
  end
initial
  begin
    for (cba = 0;cba < 3'b111 ;cba = cba+1)
      begin
        #2;
      end
    #2 $stop;
  end
endmodule
