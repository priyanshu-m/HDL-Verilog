// Universal Shift Register 
`timescale 1ns/1ps


module UniversalShiftRegister(Q, ShiftRight, ShiftLeft, In, Rst, Clk, SelectLines);
	output [3:0]Q;
	input ShiftRight, ShiftLeft, Rst, Clk;
	input [3:0]In; // Parallel Input
	input [1:0]SelectLines;
	wire [3:0]Y;
	genvar i;

	generate 
	for(i=0; i < 4; i=i+1)
		D_FF_asynRst df0(Q[i], , Y[i], Clk, Rst);
	endgenerate

	Mux_4 m0(Y[0], {In[0], ShiftLeft, Q[1], Q[0]}, SelectLines);
	Mux_4 m1(Y[1], {In[1], Q[0], Q[2], Q[1]}, SelectLines);
	Mux_4 m2(Y[2], {In[2], Q[1], Q[3], Q[2]}, SelectLines);
	Mux_4 m3(Y[3], {In[3], Q[2], ShiftRight, Q[3]}, SelectLines);


endmodule 


module UniversalShiftRegister_tb();
	wire[3:0]Q;
	reg ShiftRight, ShiftLeft, Rst, Clk;
	reg [3:0]In; // Parallel Input
	reg [1:0]SelectLines;

UniversalShiftRegister uut(Q, ShiftRight, ShiftLeft, In, Rst, Clk, SelectLines);

initial Clk = 0;
always #3 Clk = ~Clk;

initial 
begin
	Rst <= 1'b1;
	Rst <= #6 1'b0;
	In <= 4'b1011;
	ShiftRight <=  4'b0101;
	ShiftLeft <=  4'b1101;
end

initial begin
	SelectLines <= #10 2'b00;
	SelectLines <= #35 2'b01;
	SelectLines <= #70 2'b10;
	SelectLines <= #110 2'b11;
end

endmodule