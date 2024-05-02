module game(clk, reset, run, seed, shift_seed);

input logic clk, reset, run;
input logic [63:0] seed;
output logic [63:0] shift_seed;
logic [63:0] dpOut;


flopenl #64 flopr1(clk, reset, run, dpOut, seed, shift_seed);
datapath dp(shift_seed, dpOut);


endmodule