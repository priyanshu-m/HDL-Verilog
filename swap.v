`timescale 1ns/1ps
module  swap (done,r3out,r3in,r2out,r2in,r1out,r1in,w,clk,rst);
output reg  done,r3out,r3in,r2out,r2in,r1out,r1in;
input w,clk,rst;
reg [2:0] state, next_state;
parameter a=2'b00 , b=2'b01 , c=2'b10 , d=2'b11;
always @(w,state)
case (state)
a : if (w)
        begin
              next_state<=b;
               done =0; r3out = 0; r3in = 1; r2out = 1; r2in = 0; r1out = 0; r1in = 0;
          end
      else
        begin
            next_state<=a;
            done =0; r3out = 0; r3in = 0; r2out = 0; r2in = 0; r1out = 0; r1in = 0;
        end
b:     begin
             next_state<=c;
             done =0; r3out = 0; r3in = 0; r2out = 0; r2in = 1; r1out = 1; r1in = 0;
        end
c:      begin
             next_state <=d;
             done =1; r3out = 1; r3in = 0; r2out = 0; r2in = 0; r1out = 0; r1in = 1;
         end
d:      begin
           next_state <=a;
           done =0; r3out = 0; r3in = 0; r2out = 0; r2in = 0; r1out = 0; r1in = 0;
           end
default : begin
               next_state <=a;
               done =0; r3out = 0; r3in = 0; r2out = 0; r2in = 0; r1out = 0; r1in = 0;  
        end     
endcase

always @ (posedge clk , negedge rst)        //asynchronous reset
 if(rst ==0)                //active low reset
state  <=a;
else
state <= next_state;
endmodule


module swap_stimulus();
reg w, clk, rst;
wire    done,r3out,r3in,r2out,r2in,r1out,r1in;
  swap uut(done,r3out,r3in,r2out,r2in,r1out,r1in,w,clk,rst);
initial clk = 0;
always       #20 clk =~clk;
initial 
begin
	rst = 1;
         w=1'b0;  
       #10 w=1'b1;
       
end
endmodule