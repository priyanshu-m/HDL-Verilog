`timescale 1ns/1ns

module Seq_00_11(z, w, Clk, Rst);
	
	output z;
	input w, Clk, Rst;
	reg [2:0]Next_State, State;
	parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
 
always@(w, State)

	case(State)
	A: Next_State = w ? B : C;
	B: Next_State = w ? D : C;
	C: Next_State = w ? B : E;
	D: Next_State = w ? D : C;
	E: Next_State = w ? B : E;
	default: Next_State = A;
	endcase


always@(posedge Clk)
	if(Rst) 
		State <= A;
	else 
		State <= Next_State;	

assign z = ((State == D) || (State == E));	

endmodule


module Seq_00_11_tb();

	wire z;
	reg w, Clk, Rst;


Seq_00_11 uut(z, w, Clk, Rst);

initial begin
	Rst = 1'b0;
	Clk = 1'b0;
	Rst = #10 1'b1;
	Rst = #20 1'b0;
end

always #5 Clk = ~Clk;

initial begin	
	w = #30 1'b0;
	w = #40 1'b1;
	w = #50 1'b0;
	w = #60 1'b0;
	w = #70 1'b0;
	w = #80 1'b1;
	w = #90 1'b1;
	w = #100 1'b1;

end

endmodule
