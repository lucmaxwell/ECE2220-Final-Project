module bianaryToBCD
	(
		input [9:0] bianary,
		output reg [3:0] ones, tens, hundreds, thousands
	);

	always @(bianary) begin
		ones = bianary % 10;
		tens = ((bianary - ones) / 10) % 10;
		hundreds = ((bianary - tens) / 10) % 10;
		thousands = ((bianary - hundreds) / 10) % 10;
	end
	
endmodule
