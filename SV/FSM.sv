module FSM (clk, resetG, resetL, run, rundom, display, seed, hdmi);

   input logic  clk, resetG, resetL, run, rundom, display;
   input logic [63:0] seed;
   output logic [63:0] hdmi;
   logic [63:0] gOut, shift_seed;
   logic run2, rundom2;
   //out fsm uses a flop and assigns hdmi to the output of our game or the lfsr based on a switch. resetG is a button that resets the game and resetL resets the lfsr.
   game conway(clk, resetG, run2, shift_seed, gOut);
   lfsr64 rs(seed, clk, rundom2, resetL, shift_seed);
   flop #2 flopsm(clk, {run, rundom}, {run2, rundom2});
   assign hdmi = (display) ? shift_seed : gOut;
   
   
   
   
   /*typedef enum 	logic [1:0] {S0, S1,} statetype;
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
   */
endmodule