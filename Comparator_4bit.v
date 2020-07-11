`timescale 1ns/1ps

module Comparator_4bit(Gre, Les, Equ, A, B, cascadeG, cascadeL, cascadeE, Signed);

	output reg Gre, Les, Equ;
	input [3:0]A,B;
	input cascadeG, cascadeL, cascadeE, Signed;

always@(*)
begin: block1
	if (Signed & (A[3] | B[3]))
	begin
	if(A > B) 
	begin
		Gre = 1'b0;
		Les = 1'b1;
		Equ = 1'b0;
	end
	if(A < B)
	begin
		Gre = 1'b1;
		Les = 1'b0;
		Equ = 1'b0;
	end
	if(A == B && cascadeG) 
	begin
		Gre = 1'b0;
		Les = 1'b1;
		Equ = 1'b0;
	end
	if (A == B && cascadeL)
	begin
		Gre = 1'b1;
		Les = 1'b0;
		Equ = 1'b0;
	end
	if (A == B && cascadeE)
	begin
		Gre = 1'b0;
		Les = 1'b0;
		Equ = 1'b1;
	end
	disable block1;
	end
	if(A > B) 
	begin
		Gre = 1'b1;
		Les = 1'b0;
		Equ = 1'b0;
	end
	if(A < B)
	begin
		Gre = 1'b0;
		Les = 1'b1;
		Equ = 1'b0;
	end
	if(A == B && cascadeG) 
	begin
		Gre = 1'b1;
		Les = 1'b0;
		Equ = 1'b0;
	end
	if (A == B && cascadeL)
	begin
		Gre = 1'b0;
		Les = 1'b1;
		Equ = 1'b0;
	end
	if (A == B && cascadeE)
	begin
		Gre = 1'b0;
		Les = 1'b0;
		Equ = 1'b1;
	end
	
	  

end

endmodule

module Comparator_4bit_tb();

	wire Gre, Les, Equ;
	reg [3:0]A,B;
	reg cascadeG, cascadeL, cascadeE, Signed;

Comparator_4bit c0(Gre, Les, Equ, A, B, cascadeG, cascadeL, cascadeE, Signed);

initial 
begin
	cascadeE = 1'b1;
	A = 4'd12;
	B = 4'd15;
	Signed = 1'b1;
	A = #20 4'd12;
	B = #20 4'd12;

	cascadeG = #50 1'b1;
	A = #50 4'd15;
	B = #50 4'd15;


end
endmodule
