`timescale 1ns / 1ps

module ram(data, addr);
parameter WIDTH = 32;
// parameter ADDR_WIDTH = $clog2(WIDTH);

input [WIDTH-1:0] addr;
output [WIDTH-1:0] data;

reg [WIDTH-1:0] r[2**WIDTH-1:0];

initial
  $readmemh("ram.txt", r);

assign data = r[addr];

endmodule
