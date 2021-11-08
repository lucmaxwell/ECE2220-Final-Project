module displaymodule(bits, sevseg0,sevseg1,sevseg2,sevseg3,sevseg4,sevseg5)

	reg [0:48] bits;
	output reg [7:0] sevseg0,sevseg1,sevseg2,sevseg3,sevseg4,sevseg5;
	reg [0:9] number = bits[1:10]; 
	
	wire flagbit = bits[0];
	wire ones, tens, hundreds, thousands;
	
	//number to HEX
	
	bianaryToBCD b1(number, ones, tens, hundreds, thousands);
	
	BCDtoHex hex0(bit[0],ones, sevseg0);
	BCDtoHex hex1(bit[0],tens, sevseg0);
	BCDtoHex hex2(bit[0],hundreds, sevseg0);
	BCDtoHex hex3(bit[0],thousands, sevseg0);
	
	//letter to HEX
	
