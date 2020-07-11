// Sequence Geneartion of 7,3,1,0,2,4,6

`timescale 1ns/1ns

module Seq_Generator(State, Clk, Rst);
	
	output reg [2:0]State =3'd7;
	input Clk, Rst;
 
always@(posedge Clk)
	if(Rst) 
		State = 3'd7;
	else 
		case(State)
		3'd7: State = 3'd3;
		3'd3: State = 3'd1;
		3'd1: State = 3'd0;
		3'd0: State = 3'd2;
		3'd2: State = 3'd4;
		3'd4: State = 3'd6;
		3'd6: State = 3'd7;
		default: State = 3'd7;
		endcase

endmodule


module Seq_Generator_tb();

	wire [2:0]State;
	reg Clk, Rst;

Seq_Generator uut(State, Clk, Rst);
	
initial begin
	Rst = 1'b0;
	Clk = 1'b0;
	Rst = #10 1'b1;
	Rst = #20 1'b0;
end

always #5 Clk = ~Clk;


endmodule
