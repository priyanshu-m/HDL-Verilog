`timescale 1ns/1ps

// Even Parity Generator for 8 bit Data

module Parity_Generator(InParity, In);
	
	output reg [8:0]InParity;
	input [7:0]In;


always@(In)
begin
	InParity = {(^In), In};
end

endmodule

module Parity_Generator_tb();

	reg [7:0]A;
	wire [8:0]A_Parity;

Parity_Generator pg0(A_Parity, A);
	
	
initial 
begin
	A = 8'b10101010;
	A = #15 8'b10101011;
	A = #25 8'b10001100;

end

endmodule
