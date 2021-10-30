module BCDToHex(
	input [3:0] BCD,
	output reg [6:0] sevenSeg);
	
	/*
	sevenSeg is the seven segment display
	switches is the status of the input slide switches
	*/
	
	always @(BCD) begin
		
		case(BCD)
		
			4'b0000: sevenSeg = 7'b1000000; // 0
			4'b0001: sevenSeg = 7'b1111001; // 1
			4'b0010: sevenSeg = 7'b0100100; // 2
			4'b0011: sevenSeg = 7'b0110000; // 3
			4'b0100: sevenSeg = 7'b0011001; // 4
			4'b0101: sevenSeg = 7'b0010010; // 5
			4'b0110: sevenSeg = 7'b0000010; // 6
			4'b0111: sevenSeg = 7'b1111000; // 7
			4'b1000: sevenSeg = 7'b0000000; // 8
			4'b1001: sevenSeg = 7'b0010000; // 9
			default: sevenSeg = 7'b1111111; // Shows nothing
			
		endcase
		
	end
	
endmodule
