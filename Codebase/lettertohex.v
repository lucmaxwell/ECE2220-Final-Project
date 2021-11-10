module lettertohex(flagbit, sevbits, sevseg);

	input [0:6]sevbits;
	input flagbit;
	output reg [6:0] sevseg;
	
	initial begin
   if (sevbits == 7'b0011100 & flagbit == 1)  //1C - A
       sevseg = 7'b0001000;
   else if(sevbits == 7'b0110010 & flagbit == 1) //32 - B
       sevseg = 7'b0000011;
   else if(sevbits == 7'b0100011 & flagbit == 1) //21 - C
       sevseg = 7'b1000110;
   else if(sevbits == 7'b0100011 & flagbit == 1) //23 - D
       sevseg = 7'b0100001;
   else if(sevbits == 7'b0100100 & flagbit == 1) //24 - E
       sevseg = 7'b0000110;
   else if(sevbits == 7'b0101000 & flagbit == 1) //2B - F
       sevseg = 7'b0001110;
   else if(sevbits == 7'b0110100 & flagbit == 1) //34 - G
       sevseg = 7'b1000010;
   else if(sevbits == 7'b0110011 & flagbit == 1) //33 - H 
       sevseg = 7'b0001001;
   else if(sevbits == 7'b1000011 & flagbit == 1) //43 - I
       sevseg = 7'b1001111;
   else if(sevbits == 7'b0111011 & flagbit == 1) //3B - J
       sevseg = 7'b1100001;
   else if(sevbits == 7'b1000010 & flagbit == 1) //42 - K
       sevseg = 7'b0001011;
   else if(sevbits == 7'b1001011 & flagbit == 1) //4B - L
       sevseg = 7'b1000111;
   else if(sevbits == 7'b0111010 & flagbit == 1)  //3A - M
       sevseg = 7'b0010101;
   else if(sevbits == 7'b0110001 & flagbit == 1) //31 - N
       sevseg = 7'b1101010;
   else if(sevbits == 7'b1000100 & flagbit == 1) //44 - O
       sevseg = 7'b1100010;
   else if(sevbits == 7'b1001101 & flagbit == 1) //4D - P
       sevseg = 7'b0011000;
   else if(sevbits == 7'b0010101 & flagbit == 1) //15 - Q
       sevseg = 7'b0001100;
   else if(sevbits == 7'b0101101 & flagbit == 1) //2D - R
       sevseg = 7'b1111010;
   else if(sevbits == 7'b0011011 & flagbit == 1) //1B - S
       sevseg = 7'b0100100;
   else if(sevbits == 7'b0101100 & flagbit == 1) //2C - T
       sevseg = 7'b1110000;
   else if(sevbits == 7'b0111100 & flagbit == 1) //3C - U
       sevseg = 7'b1000001;
   else if(sevbits == 7'b0101010 & flagbit == 1) //2A - V
       sevseg = 7'b1010101;
   else if(sevbits == 7'b0011101 & flagbit == 1) //1D - W
       sevseg = 7'b1000000;
   else if(sevbits == 7'b0100010 & flagbit == 1) //22 - X
       sevseg = 7'b0110110;
	else if(sevbits == 7'b0110101 & flagbit == 1) //35 - Y
       sevseg = 7'b1000100;
   else if(sevbits == 7'b0011010 & flagbit == 1) //1A - Z
       sevseg = 7'b0010010;
	end
	
endmodule
