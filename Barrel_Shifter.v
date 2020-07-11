`timescale 1ns/1ps

module Barrel_Shifter #(parameter N)(Out, In, Shift);

	output[(N-1):0]Out;
	input [(N-1):0]In;
	input Shift;
	genvar i;

	Mux_2 m0(Out[0], {In[0], 1'b0}, Shift);

	generate
	for (i = 1; i < N ; i= i+1)
		Mux_2 m1(Out[i], {In[i], In[i-1]}, Shift);
	endgenerate
		

endmodule

module Barrel_Shifter_tb();

	parameter N= 8;
	wire [(N-1):0]Out;
	reg [(N-1):0]In;
	reg Shift;

Barrel_Shifter #(N) BS0(Out, In, Shift);

initial 
begin
	
	
	In =  8'b10101110;
	Shift = 1'b0;
	Shift = #15 1'b1;
	In =  #35 8'b00101111;
	Shift = #50 1'b0;
	Shift = #65 1'b1;

end

endmodule
