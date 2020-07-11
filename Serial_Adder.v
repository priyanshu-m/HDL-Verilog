`timescale 1ns/1ps

module Serial_Adder(Sum, Cout, A, B, Cin, Clk);
	
	output reg [3:0]Sum;
	output reg Cout;
	input [3:0]A,B;
	input Cin,Clk;
	reg i = 0;

always@(posedge Clk)
begin
	if(i == 0) {Cout,Sum[0]} = A[0]+B[0]+Cin;
	if(i < 4)  {Cout,Sum[i]} = A[i]+B[i]+Cout;
	else if(i > 4) i=0;
	i = i+1; 

end

endmodule

module Serial_Adder_tb();
	wire [3:0]Sum;
	wire Cout;
	reg [3:0]A,B;
	reg Cin,Clk;

Serial_Adder pa0(Sum, Cout, A, B, Cin,Clk);

initial 
begin
	A = 4'd12;
	B = 4'd15;
	Cin = 1'b1;
	Clk = 1'b0;

end


always #5 Clk = !Clk;

endmodule