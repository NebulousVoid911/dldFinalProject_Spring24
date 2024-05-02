module lfsr(seed, clk, run, reset, shift_seed);
input logic [3:0] seed;
input logic clk;
input logic run;
input logic reset;
output logic [3:0] shift_seed;
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits
logic lb;

assign lb = shift_seed[3]^shift_seed[2];

flopenl #4 sr(clk, reset, run, {shift_seed[2:0], lb}, seed, shift_seed);
//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64(seed, clk, run, reset, shift_seed);
input logic [63:0] seed;
input logic clk;
input logic run;
input logic reset;
output logic [63:0] shift_seed;
logic lb;
//xnor of the taps used for shifting
assign lb = ~(shift_seed[63]^shift_seed[62]^shift_seed[60]^shift_seed[59]);
//flop and load which we are using to perform the lfsr and shift the seed. the load on the lfsr is our base seed so that it can act as a reset
flopenl #64 sr(clk, reset, run, {shift_seed[62:0], lb}, seed, shift_seed);

endmodule