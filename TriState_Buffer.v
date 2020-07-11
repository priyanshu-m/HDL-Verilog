`timescale 1ns/1ps

// TriState_Buffer  

module TriState_Buffer(Out, In, Cont);
	parameter N=4;
	output reg [(N-1):0]Out;
	input [(N-1):0]In;
	input Cont;

always@(*)
begin
	if (Cont) Out = In;
	else Out = 'bz;


end

endmodule

module TriState_Buffer_tb();
	
	parameter N = 4;
	wire [(N-1):0]Out;
	reg [(N-1):0]In;
	reg Cont;

TriState_Buffer b0(Out, In, Cont);

initial 
begin
	In = 4'b0101;
	In = #15 4'b1110;
	In = #30 4'b1111;
end
initial 
begin
	Cont = 1'b1;
	Cont = #24 1'b0;
	Cont = #30 1'b1;

end

endmodule
