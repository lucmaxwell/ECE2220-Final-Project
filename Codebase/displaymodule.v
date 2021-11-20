module displaymodule(bits, sevseg0, sevseg1, sevseg2, sevseg3, sevseg4, sevseg5);

	input [0:47] bits;
	output wire	[7:0] sevseg0, sevseg1, sevseg2, sevseg3, sevseg4, sevseg5;
	
	//letter to HEX
	lettertohex Lhex0 (bits[0:7], sevseg0);
	lettertohex Lhex1 (bits[8:15], sevseg1);
	lettertohex Lhex2 (bits[16:23], sevseg2);
	lettertohex Lhex3 (bits[24:31], sevseg3);
	lettertohex Lhex4 (bits[32:39], sevseg4);
	lettertohex Lhex5 (bits[40:47], sevseg5);
	
endmodule
