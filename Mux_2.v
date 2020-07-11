`timescale 1ns/1ps
// Multiplixer 2X1  

module Mux_2(Out, In, Sel);
	
	output reg Out;
	input [1:0]In;
	input Sel;

always@(In, Sel)
begin
	case(Sel)
	1'b0: Out = In[0];
	1'b1: Out = In[1];
	default: Out = 1'bx;
	endcase


end

endmodule

module Mux_2_tb();

	wire Out;
	reg [1:0]In;
	reg Sel;

Mux_2 m0(Out, In, Sel);

initial 
begin
	In = 1'b0;
	In = #15 1'b1;

end

endmodule
