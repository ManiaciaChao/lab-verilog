module ram_tb();

wire [31:0] data;
reg [31:0] addr = 0;

ram #(32) ram(data, addr);

endmodule
