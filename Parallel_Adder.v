`timescale 1ns/1ps

module Parallel_Adder(Sum, Cout, A, B, Cin, Contr);
	
	output reg [3:0]Sum;
	output reg Cout;
	input [3:0]A,B;
	input Cin, Contr;
	//reg [3:0]Bbar;

always@(*)
begin
	if (Contr) {Cout,Sum} = A-B-Cin;
	else {Cout,Sum} = A+B+Cin;

end

endmodule

module Parallel_Adder_tb();
	wire [3:0]Sum;
	wire Cout;
	reg [3:0]A,B;
	reg Cin,Contr;

Parallel_Adder pa0(Sum, Cout, A, B, Cin, Contr);

initial 
begin
	A = 4'd10;
	B = 4'd15;
	Cin = 1'b0;
	Contr = 1'b1;
	Contr = # 15 1'b0;


end
endmodule
