module FSM (clk, reset, s, y);

   input logic  clk;
   input logic  reset;
   input logic 	y;
   
   
   output logic [1:0] s;

   typedef enum 	logic [1:0] {S0, S1,} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	   s <= 1'b1;	  
	  if (y) nextstate <= S1;
    else nextstate <= S0;
       end
       S1: begin
	   s <= 1'b0 ;	  	  
	   nextstate <= S1;
       end
     endcase
   
endmodule