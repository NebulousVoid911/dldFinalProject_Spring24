// testbench to prove maximal LFSR
module tb ();

   //logic variables to route input and output to DUT
logic clk; 
logic resetG;
logic resetL;
logic run; 
logic rundom; 
logic display; 
logic [63:0] seed; 
logic [63:0] hdmi; 

  //create file handles to write results to a file
   
   // instantiate device under test (small LFSR)
  FSM dut(clk, resetG, resetL, run, rundom, display, seed, hdmi);
   //set up a clock signal
   always     
     begin
	clk = 1; #1; clk = 0; #1;
     end
   
   initial
     begin
      #0 resetL = 1'b1;
      #0 run = 1'b0;
      #0 seed = 64'h4206_9960_2400_0700;
      #0 rundom = 1'b0;
      #0 display = 1'b0;
      #0 resetG = 1'b1;
      #10 resetG = 1'b0;
      #0 resetL = 1'b0;
      #0 run = 1'b1;
      #30 run = 1'b0;
      #0 display = 1'b1;
      #5 rundom = 1'b1;
      #12 rundom = 1'b0;
      #2 display = 1'b0;
      #5 resetG = 1'b0;
      #0 run = 1'b1;
      #30 run = 1'b1;
      #0 resetG = 1'b1;

      
      
      // #10 display = 1'b1;
      // #10 rundom = 1'b1;


	//set up output file
	//set up any book keeping variables you may want to use
	//set up a starting seed.  What happens with all 0s?
	//reset your DUT
	//save the initial output of your DUT to compare with current output
	//and see whenb you repeat
     end

   always @(posedge clk)
     begin
		//output your results to a file
     end

   // check results on falling edge of clk
  //  always @(negedge clk) begin
	// 	if(~reset) begin
	// 	//check if your output equals the initial output 
	// 	//if so, report how many iterations it took to repeat
	// 	//this should be (2^n) - 1
	// 	//if the output never repeats for 2^n iterations, report that
	// 	end
	// end
   
endmodule // tb

