//GRAY TO BINARY CONVERSION
`timescale 1ns/1ns

module g_to_b_conv(b,g);
	output [3:0] b;
	input  [3:0]g;

assign b[3] = g[3];
xor x1(b[2],b[3],g[2]);
xor x2(b[1],b[2],g[1]);
xor x3(b[0],b[1],g[0]);

endmodule


module g_to_b_conv_stimulus();
wire [3:0] b;
reg [3:0] g;
g_to_b_conv uut(b,g);
initial 
begin
  	 g = #0 4'b0010;
	 g = #20 4'b1011;
	 g = #40 4'b0110;
end
endmodule

