module clk_div (input logic clk, input logic reset, output logic clk_en);

   logic [25:0] clk_count;

   always_ff @(posedge clk) begin
      if (reset) 
      begin
	      clk_count <= 26'h0;
         clk_en <= 1'b0; 
      end

      else if (clk_count == 26'b10111110101111000001111011) 
      begin 
         clk_count <= 26'h0; 
         clk_en <= ~clk_en;
      end

      else 
      begin
	      clk_count <= clk_count + 1; 
      end
   end   
   
   
   
endmodule // clk_div
