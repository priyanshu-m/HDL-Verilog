`timescale 1ns/1ps
// D FF with Asyncronous Reset  

module D_FF_asynRst(Q, Qbar, D, Clk, Rst);
	
	output reg Q, Qbar;
	input D, Clk, Rst; 

always@(negedge Clk or posedge Rst)
begin
	if(Rst)
	begin
		Q <= 1'b0;
		Qbar <= 1'b1;

	end
	else
	begin
		Q <= D;
		Qbar <= ~D;

	end


end

endmodule

module D_FF_asynRst_tb();
	
	wire Q, Qbar;
	reg D, Clk, Rst; 

D_FF_asynRst dff0(Q, Qbar, D, Clk, Rst);

initial 
begin
	D = 1'b0;
	Clk = 1'b1;
	Rst = 1'b1;
	Rst = #25 1'b0;

end
always # 22 D = ~D;
always #5 Clk = ~Clk;

endmodule
