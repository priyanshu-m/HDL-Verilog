// 4 bit Carry Look ahead Adder


module CarryLookAhead_Adder(Sum, Cout, A, B, Cin);
	output [3:0]Sum;
	output Cout;
	input [3:0]A,B;
	input Cin;
	wire G0,P0,G1,P1,G2,P2,G3,P3,C1,C2,C3;

assign P0 = A[0]^B[0], P1 = A[1]^B[1], P2 = A[2]^B[2], P3 = A[3]^B[3],
       G0 = A[0]&B[0], G1 = A[1]&B[1], G2 = A[2]&B[2], G3 = A[3]&B[3];
 
assign C1 = G0|(P0&Cin), C2 = G1|(P1&G0)|(P1&P0&Cin), C3 = G2|(P2&G1)|(P2&P1&G0)|(P2&P1&P0&Cin), 
       Cout = G3|(P3&G2)|(P3&P2&G1)|(P3&P2&P1&G0)|(P3&P2&P1&P0&Cin);

assign Sum[0]= P0^Cin, Sum[1]= P1^C1, Sum[2]= P2^C2, Sum[3]= P3^C3;


endmodule 


module CarryLookAhead_Adder_tb();
	wire [3:0]Sum;
	wire Cout;
	reg [3:0]A,B;
	reg Cin;

CarryLookAhead_Adder uut(Sum, Cout, A, B, Cin);

initial begin
	A = 4'd10;
	B = 4'd15;
	Cin = 1'b0;
	A = #50 4'd10;
	B = #50 4'd15;
	Cin = #90 1'b0;

end
endmodule