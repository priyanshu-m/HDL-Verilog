`timescale 1ns/1ns

module Seq_101(Out, X, Clock, Clr);
	output reg Out;
	input X, Clock, Clr;
	reg [1:0]Next_State, State=2'b00;

always@(X, State)
begin
	case(State)
	00: begin
		if(X) begin
			Next_State <= 2'b01;
			Out <= 1'b0;
		end
		else begin 
			Next_State <= 2'b00;
			Out <= 1'b0;
		end
	end
	01: begin
		if(X) begin
			Next_State <= 2'b01;
			Out <= 1'b0;
		end
		else begin 
			Next_State <= 2'b10;
			Out <= 1'b0;
		end
	end
	10: begin
		if(X) begin
			Next_State <= 2'b01;
			Out <= 1'b1;
		end
		else begin 
			Next_State <= 2'b00;
			Out <= 1'b0;
		end
	
	end
	default: begin
		Next_State <= 2'b00;
		Out <= 1'b0;
	end
	endcase

end

always@(posedge Clock)
begin
	if(Clr) 
		State <= 2'b00;
	else 
		State <= Next_State;
end	
	

endmodule


module Seq_101_tb();

	wire Out;
	wire [1:0]State;
	reg X, Clock, Clr;


Seq_101 s0(Out, X, State, Clock, Clr);

initial begin
Clr = 1'b0;
Clock = 1'b0;
Clr = #10 1'b1;
Clr = #20 1'b0;
end

always #5 Clock = ~Clock;

initial begin	
	X = #30 1'b0;
	X = #60 1'b1;
	X = #80 1'b0;
	X = #90 1'b1;
	X = #110 1'b0;
	X = #130 1'b1;

end

endmodule