`timescale 1ns / 1ps

module lab3_1_tb();
reg clk;
reg D;
reg Qa, Qb, Qc;

initial
  begin
    clk = 1'b0;
    {Qa,Qb,Qc} = 3'b000;
    #100 $stop;
  end

always
  #20 clk = !clk;

initial
  begin
    D     = 1'b0;
    #17 D = !D;
    #6  D = !D;
    #3  D = !D;
    #6  D = !D;
    #10 D = !D;
    #6  D = !D;
    #3  D = !D;
    #3  D = !D;
    #8  D = !D;
    #3  D = !D;
    #3  D = !D;
    #14 D = !D;
  end

D_latch myDlatch(clk, D, Qa);
D_ff myDff(clk, D, Qb);
D_ff_n myDffn(clk, D, Qc);
endmodule
