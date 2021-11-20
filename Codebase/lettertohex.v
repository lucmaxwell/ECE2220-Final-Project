module lettertohex(sevbits, sevseg);

	input [0:6]sevbits;
	output reg [6:0] sevseg;
	
	initial begin
   if (sevbits == 7'b0011100)  //1C - A
       sevseg = 7'b0001000;
   else if(sevbits == 7'b0110010) //32 - B
       sevseg = 7'b0000011;
   else if(sevbits == 7'b0100011) //21 - C
       sevseg = 7'b1000110;
   else if(sevbits == 7'b0100011) //23 - D
       sevseg = 7'b0100001;
   else if(sevbits == 7'b0100100) //24 - E
       sevseg = 7'b0000110;
   else if(sevbits == 7'b0101000) //2B - F
       sevseg = 7'b0001110;
   else if(sevbits == 7'b0110100) //34 - G
       sevseg = 7'b1000010;
   else if(sevbits == 7'b0110011) //33 - H 
       sevseg = 7'b0001001;
   else if(sevbits == 7'b1000011) //43 - I
       sevseg = 7'b1001111;
   else if(sevbits == 7'b0111011) //3B - J
       sevseg = 7'b1100001;
   else if(sevbits == 7'b1000010) //42 - K
       sevseg = 7'b0001011;
   else if(sevbits == 7'b1001011) //4B - L
       sevseg = 7'b1000111;
   else if(sevbits == 7'b0111010) //3A - M
       sevseg = 7'b0010101;
   else if(sevbits == 7'b0110001) //31 - N
       sevseg = 7'b1101010;
   else if(sevbits == 7'b1000100) //44 - O
       sevseg = 7'b1100010;
   else if(sevbits == 7'b1001101) //4D - P
       sevseg = 7'b0011000;
   else if(sevbits == 7'b0010101) //15 - Q
       sevseg = 7'b0001100;
   else if(sevbits == 7'b0101101) //2D - R
       sevseg = 7'b1111010;
   else if(sevbits == 7'b0011011) //1B - S
       sevseg = 7'b0100100;
   else if(sevbits == 7'b0101100) //2C - T
       sevseg = 7'b1110000;
   else if(sevbits == 7'b0111100) //3C - U
       sevseg = 7'b1000001;
   else if(sevbits == 7'b0101010) //2A - V
       sevseg = 7'b1010101;
   else if(sevbits == 7'b0011101) //1D - W
       sevseg = 7'b1000000;
   else if(sevbits == 7'b0100010) //22 - X
       sevseg = 7'b0110110;
	else if(sevbits == 7'b0110101) //35 - Y
       sevseg = 7'b1000100;
   else if(sevbits == 7'b0011010) //1A - Z
       sevseg = 7'b0010010;
		 // Numbers
   else if(sevbits == 7'b0010110) //1A - Z
       sevseg = 7'b1111001;//1
   else if(sevbits == 7'b0011110) //1A - Z
       sevseg = 7'b0100100;//2
   else if(sevbits == 7'b0100110) //1A - Z
       sevseg = 7'b0110000;//3
   else if(sevbits == 7'b0100101) //1A - Z
       sevseg = 7'b0011001;//4
   else if(sevbits == 7'b0101110) //1A - Z
       sevseg = 7'b0010010;//5
   else if(sevbits == 7'b0110110) //1A - Z
       sevseg = 7'b0000010;//6
   else if(sevbits == 7'b0111101) //1A - Z
       sevseg = 7'b1111000;//7
   else if(sevbits == 7'b0111110) //1A - Z
       sevseg = 7'b0000000;//8
   else if(sevbits == 7'b1000110) //1A - Z
       sevseg = 7'b0010000;//9
   else if(sevbits == 7'b1000101) //1A - Z
       sevseg = 7'b1000000;//0	
	else if(sevbits == 7'b1111111)
		 sevseg = 7'b1111111; // Display nothing. Do not delete :)
		 
	end
	
endmodule
