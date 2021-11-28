module clkmodule(clk, second);
	input clk;
	output reg second;
	
	reg [27:0] counter;
	
	always@(posedge clk) begin
		counter <= counter + 1;
		if(counter == 25_000_000)
			begin
				counter <= 0;
				second <= ~second;
			end
	end
	
endmodule

