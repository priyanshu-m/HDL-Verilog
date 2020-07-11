`timescale 1ns/1ps

//  Counter 0-99 syncronous Reset

module Counter_1Digit(Digits, Clk, Rst);
	
	output reg [7:0]Digits='b0;
	input Clk, Rst;

always@(posedge Clk)
begin
	if (Rst) Digits = 'b0;

	else begin
		Digits[3:0] = (Digits[3:0] + 1)%10;
		if(Digits[3:0] == 0) Digits[7:4] = (Digits[7:4] + 1)%10; 
	end
end

endmodule

module Counter_1Digit_tb();

	wire [7:0]Digits;
	reg Clk, Rst;

Counter_1Digit c0(Digits, Clk, Rst);
	
initial 
begin
	Rst = 'b1;
	Clk = 0;
	Rst = #7 'b0;


end

always #2 Clk = !Clk;

endmodule
