`timescale 1ns/1ps

module Binary2Grey #(parameter N)(G, B);

	output[(N-1):0]G;
	input [(N-1):0]B;
	genvar i;

	assign G[N-1] = B[N-1];
	generate
	for (i = (N-2); i >= 0 ; i= i-1)
		xor x0(G[i], B[i+1], B[i]);
	endgenerate
		

endmodule

module Binary2Grey_tb();

	parameter N= 2;
	wire [(N-1):0]G;
	reg [(N-1):0]B;

Binary2Grey #(N) bg0(G, B);

initial 
begin
	
	B = 'b1010;
	B = #20 'b1111;

	
end
endmodule
