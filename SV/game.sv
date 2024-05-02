module game(clk, reset, run, seed, shift_seed);

//inputs and outputs for the game module
input logic clk, reset, run;
input logic [63:0] seed;
output logic [63:0] shift_seed;
logic [63:0] dpOut;

//flop and load whcih we are also using as a way to reset
flopenl #64 flopr1(clk, reset, run, dpOut, seed, shift_seed);
//calling the datapath module which handles the logic of running the game with our seed from the lfsr
datapath dp(shift_seed, dpOut);


endmodule