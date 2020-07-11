// Function to calculate Sum of squares of natural numbers till n
`timescale 1ns/1ns

module Sum_Sq(Sum,n);
	output  reg [10:0]Sum; // maximum output possible is 2048 
	input [3:0]n ; // maximum input possible is 15


always@(n) // block is executed whenever there is a change in n
	Sum = Cal_Sum(n); // call function Cal_sum to calculate sum of squares	

// function defination
function [10:0] Cal_Sum;
	input [3:0]n;
	integer count;
	begin
	Cal_Sum = 11'b0; 
	for(count=1;count <= n;count=count+1)
		Cal_Sum = Cal_Sum + (count*count); // computing Sum of squares
	end
	endfunction

endmodule

module Sum_Sq_tb(); // Simulus block to test
	wire [10:0]Sum;
	reg [3:0]n;
Sum_Sq s0(Sum,n); // instantiate module Sum_Sq
initial
begin 

	#0 n = 4'b0010;
	#50 n = 4'b0100;
	#150 n = 4'b1111; 

$monitor($time, "Sum of squares of n natuaral number =%d",Sum); // displays the statement on the console when there is a change in Sum
end


endmodule

