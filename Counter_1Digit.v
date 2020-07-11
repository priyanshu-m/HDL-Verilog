`timescale 1ns/1ps

// Mod 10 Counter 0-9 syncronous Reset

module Counter_1Digit(Digit, Clk, Rst);
	
	output reg [3:0]Digit='b0;
	input Clk, Rst;

always@(posedge Clk)
begin
	if (Rst) Digit = 'b0;

	else Digit = (Digit + 1)%10;

end

endmodule

module Counter_1Digit_tb();

	wire [3:0]Digit;
	reg Clk, Rst;

Counter_1Digit c0(Digit, Clk, Rst);
	
initial 
begin
	Rst = 'b1;
	Clk = 0;
	Rst = #7 'b0;


end

always #5 Clk = !Clk;

endmodule
