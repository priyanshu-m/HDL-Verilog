`timescale 1ns/1ps
// Decoder n X 2^n  

module Decoder_2X4(Out, In, enable);
	
	output reg [3:0]Out;
	input [1:0]In;
	input enable;

always@(In)
begin: block1
	if(enable) begin
		Out = 4'b0;
		disable block1;
	end
	
	case(In)
	2'b00: Out = 4'b0001;
	2'b01: Out = 4'b0010;
	2'b10: Out = 4'b0100;
	2'b11: Out = 4'b1000;
	default:Out = 4'bx;
	endcase


end

endmodule

module Decoder_2X4_tb();
	
	wire [3:0]Out;
	reg [1:0]In;
	reg enable;

Decoder_2X4 d0(Out, In, enable);

initial 
begin
	In = 2'b01;
	In = #15 2'b10;
	In = #30 2'b11;
	enable = 1'b1;
	enable = #24 1'b0;
	enable = #30 1'b1;

end

endmodule
