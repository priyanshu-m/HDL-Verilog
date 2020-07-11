`timescale 1ns/1ps

// Leading Zero Counter  

module Leading_ZeroCount #(parameter N) (Count, In);

	output reg [3:0]Count;
	input [(N-1):0]In;
	integer i;

always@(In)
begin:Block1
	Count = 'b0;
	for(i=(N-1); i>= 0; i=i-1) begin
		if (!In[i]) Count = Count+1; 
		else disable Block1;
	end
	
end

endmodule

module Leading_ZeroCount_tb();
	parameter N=8;
	wire [3:0]Count;
	reg[(N-1):0]In;

Leading_ZeroCount #(N) lz0(Count, In);

initial 
begin
	In = 'b00000101;
	In = #15 'b01000101;
	In = #30 'b00000001;
	In = #45 'b10000001;

end

endmodule
