`timescale 1ns/1ps
// Multiplixer 4X1  

module Mux_4(Out, In, Sel);
	
	output reg Out;
	input [3:0]In;
	input [1:0]Sel;

always@(In, Sel)
begin
	case(Sel)
	2'b00: Out = In[0];
	2'b01: Out = In[1];
	2'b10: Out = In[2];
	2'b11: Out = In[3];
	default: Out = 1'bx;
	endcase


end

endmodule

module Mux_4_tb();

	wire Out;
	reg [3:0]In;
	reg [1:0]Sel;

Mux_4 m0(Out, In, Sel);

initial 
begin
	In = 2'b01;
	In = #15 2'b10;
	In = #30 2'b11;

end

endmodule
