module clkmodule(clk, second,reset);
	input clk, reset;
	output reg second;
	
	reg [27:0] counter;
	
	always@(posedge clk)
	begin
		if (reset == 1'b1)
		begin
			second <= 0;
			counter <= 0;
		end
		
		else
		begin
				counter <= counter + 1;
				
				if(counter == 25_000_000)
					begin
						counter <= 0;
						second <= ~second;
					end
					
		end
	end
	
endmodule 