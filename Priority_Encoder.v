`timescale 1ns/1ps
// Priority Encoder  

module Priority_Encoder(Out, Z, In, enable);
	
	output reg [1:0]Out;
	output reg Z='b0;
	input [3:0]In;
	input enable;

always@(In)
begin: block1
	if(!enable) begin
		Out = 4'b0;
		disable block1;
	end
	
	casex(In)
	4'b1xxx: Out = 2'b00;
	4'b01xx: Out = 2'b01;
	4'b001x: Out = 2'b10;
	4'b0001: Out = 2'b11;
	4'b0000: begin
			Out = 2'b00;
			Z = 1'b1;
		 end
	default: Out = 2'bx;
	endcase


end

endmodule

module Priority_Encoder_tb();
	
	wire [1:0]Out;
	wire Z;
	reg [3:0]In;
	reg enable;

Priority_Encoder p0(Out, Z, In, enable);

initial 
begin
	enable = 1'b1;
	In = 4'b0110;
	In = #15 4'b1011;
	In = #30 4'b0011;
	In = #45 4'b0000;

end

endmodule
