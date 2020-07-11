`timescale 1ns/1ps

// Odd Parity Checker

module Parity_Checker(Parity, A);
	
	output reg Parity;
	input [4:0]A;

always@(A)
begin
	Parity = ^A;
end

endmodule

module Parity_Checker_tb();

	wire Parity;
	reg [4:0]A;

Parity_Checker pa0(Parity, A);
	
initial 
begin
	A = 5'b11010;
	A = #15 5'b11101;
	A = #25 5'b00011;

end

endmodule
