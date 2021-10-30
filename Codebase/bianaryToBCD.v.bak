module bianaryToBCD(
	input [4:0] bianary,
	output reg [3:0] ones,
	output reg [3:0] tens);
	
	always @(bianary) begin
	
		ones = bianary % 10;
		tens = (bianary - ones) / 10;
		
	end
	
endmodule
