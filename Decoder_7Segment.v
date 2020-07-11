`timescale 1ns/1ps
// 7 Segment Decoder   

module Decoder_7Segment(Out, In, enable);
	
	output reg [6:0]Out;
	input [3:0]In;
	input enable;

always@(In)
begin: block1
	if(enable) begin
		Out = 'b0;
		disable block1;
	end
	
	case(In)
	4'b0000: Out = 7'b1111110;
	4'b0001: Out = 7'b0110000;
	4'b0010: Out = 7'b1101101;
	4'b0011: Out = 7'b1111001;
	4'b0100: Out = 7'b0110011;
	4'b0101: Out = 7'b1011011;
	4'b0110: Out = 7'b1011111;
	4'b0111: Out = 7'b1110000;
	4'b1000: Out = 7'b1111111;
	4'b1001: Out = 7'b1111011;
	default: Out = 7'bx;
	
	endcase


end

endmodule

module Decoder_7Segment_tb();
	
	wire [6:0]Out;
	reg [3:0]In;
	reg enable;

Decoder_7Segment d0(Out, In, enable);

initial 
begin
	In = 4'd6;
	In = #15 4'd10;
	In = #30 4'd9;
	enable = 1'b1;
	enable = #24 1'b0;
	enable = #30 1'b1;

end

endmodule
//
//4'b0000: Out = 7'h7E;
//	4'b0001: Out = 7'h30;
//	4'b0010: Out = 7'h6D;
//	4'b0011: Out = 7'h79;
//	4'b0100: Out = 7'h33;
//	4'b0101: Out = 7'h5B;
//	4'b0110: Out = 7'h5F;
//	4'b0111: Out = 7'h70;
//	4'b1000: Out = 7'h7F;
//	4'b1001: Out = 7'h7B;
//	default: Out = 7'bx;
	