`timescale 1ns/1ps

module ALU_2bit(Out,A,B,Cont);
	
	output reg [3:0]Out;
	input [3:0]A,B;
	input [1:0]Cont;

always@(A,B,Cont)
begin
	case (Cont)
	2'b00: Out = A+B;
	2'b01: Out = A-B;
	2'b10: Out = A*B;
	2'b11: Out = A%B; 
	endcase


end

endmodule

module ALU_2bit_tb();
	wire [3:0]Out;
	reg [3:0]A,B;
	reg [1:0]Cont;

ALU_2bit alu0(Out,A,B,Cont);

initial 
begin
	A = 4'd12;
	B = 4'd15;
	Cont = 2'b01;
	Cont = #10 2'b11;
	Cont = #20 2'b00;
	

end
endmodule
