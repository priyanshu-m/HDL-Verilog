// Verilog Code For EVM Machine Design
`timescale 1ns/1ns

module EVM(CntA,CntB,CntC,Led_A,Led_B,Led_C,A,B,C,ballot,Clk);
	output reg [6:0]CntA = 7'b0 ,CntB = 7'b0 ,CntC = 7'b0; // Maximun Count Possible = 128 
	output reg Led_A= 1'b0,Led_B= 1'b0,Led_C= 1'b0; // LED outputs
	input A,B,C,ballot,Clk;


always@(posedge Clk or ballot) // always at positive edge of clock or ballot is high the block is activated
if(ballot)
begin
	if(A)
	begin
		CntA = CntA+1; // increment Count
		Led_A = 1'b1; // Set LED_A high
	end
	if(B)
	begin
		CntB = CntB+1;
		Led_B = 1'b1;
	end

	if(C)
	begin
		CntC = CntC+1;
		Led_C = 1'b1;
	end

end	
else
begin
	Led_A = 1'b0;
	Led_B = 1'b0;
	Led_C = 1'b0;

end

endmodule



module EVM_tb();
	wire [6:0]CntA,CntB,CntC;
	wire Led_A,Led_B,Led_C;
	reg A,B,C,ballot,Clk;

EVM evm0(CntA,CntB,CntC,Led_A,Led_B,Led_C,A,B,C,ballot,Clk); //instantiating EVM module

initial 
begin

	ballot = 1'b1;
	Clk = 1'b0;	
	A = 1'b0;
	B = 1'b0;
	C = 1'b0;
	#80 ballot = 1'b0;
	#10 ballot = 1'b1;
end
always #10 Clk = ~Clk; // generating clock of time period = 20ns 
always
begin
	 A = #25 ~A; // toggle A input for every 25ns
	 B = #30 ~B; // toggle B input for every 30ns
	 C = #45 ~C; // toggle C input for every 45ns	
	
end

endmodule
