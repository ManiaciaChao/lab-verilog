`timescale 1ns / 1ps
`include "task3.v"

module task3_tb(  );
reg clk,ShiftIn,ShiftEn;
reg ShiftOut;
reg [3:0] ParallelOut;

initial
  begin
    clk = 1'b0;
    ShiftIn  = 1'b0;
    ShiftEn = 1'b0;
    ShiftOut = 1'b0;
    ParallelOut = 4'b0000;
    #300 $stop;
  end

always #10 clk = ~clk;

initial
  begin
    #10 ShiftIn =1;
    #50 ShiftIn =0;
    #40 ShiftIn =1;
    #60 ShiftIn =0;
    #20 ShiftIn =1;
    #40 ShiftIn =0;
  end

initial
  begin
    #40 ShiftEn =1;
    #60 ShiftEn =0;
    #40 ShiftEn =1;
  end

Serial_in_Parallel_out_enable s(clk, ShiftEn, ShiftIn, ParallelOut, ShiftOut);

endmodule
