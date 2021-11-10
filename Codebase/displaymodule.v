module displaymodule(bits, sevseg0,sevseg1,sevseg2,sevseg3,sevseg4,sevseg5);

	input [0:48] bits;
	output reg [7:0] sevseg0,sevseg1,sevseg2,sevseg3,sevseg4,sevseg5;
	reg [0:9] number = bits[1:10]; 
	
	wire flagbit = bits[0];
	wire ones, tens, hundreds, thousands;
	
	//number to HEX
	
	bianaryToBCD b1(number, ones, tens, hundreds, thousands);
	
	BCDtoHex hex0(flagbit,ones, sevseg0);
	BCDtoHex hex1(flagbit,tens, sevseg0);
	BCDtoHex hex2(flagbit,hundreds, sevseg0);
	BCDtoHex hex3(flagbit,thousands, sevseg0);
	
	//letter to HEX
	
	lettertohex Lhex0(flagbit, bits[1:8], sevseg0);
	lettertohex Lhex1(flagbit, bits[9:15], sevseg1);
	lettertohex Lhex2(flagbit, bits[16:22], sevseg2);
	lettertohex Lhex3(flagbit, bits[23:29], sevseg3);
	lettertohex Lhex4(flagbit, bits[30:36], sevseg4);
	lettertohex Lhex5(flagbit, bits[37:43], sevseg5);
	
endmodule
