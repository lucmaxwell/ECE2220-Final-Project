module keyboard( clk, data, outputBinData);
	//This module takes in a code from a key press and outputs the binary code for said key when the key is released
	//a case statement is needed to sync the the input clock with the input pin, on each negedge of the clock the corresponding bit is loaded into the proper place.
	//bits 10 and 11 are used to compare the stored data to see if it is the released code, if its not it is stored for later use.
	//the bits are only outputted from the module when the released code is sent to the module.
	input wire data;
	input wire clk;
	output reg[7:0] outputBinData;
	
	
	reg [7:0] bitInfo;//handles the incoming data
	reg [7:0] storage;
	reg [3:0] b;//4 bit counter to cycle though the case statements
	reg endSwitch;//used to compare the info in the output loop
	
	initial
	begin
	bitInfo <= 8'hf0;
	storage <= 8'hf0;
	b <= 1'h1;
	endSwitch <= 1'b0;
	end
	
	always@(negedge clk)
	begin
	//we dont need bit 1 here as everything is happening on the negedge of the clock
	//bits 2-7 are the information from the keyboard
	//bits 10 and 11 are to activate the posedge so that the data can be compared.
	case(b)
	2:bitInfo[0] <= data;
	3:bitInfo[1] <= data;
	4:bitInfo[2] <= data;
	5:bitInfo[3] <= data;
	6:bitInfo[4] <= data;
	7:bitInfo[5] <= data;
	8:bitInfo[6] <= data;
	9:bitInfo[7] <= data;
	10:endSwitch <= 1'b1;
	11:endSwitch <= 1'b0;
	endcase
	
	//this is used to cycle between bits 1 and 11, bit 1 is included to make the negedge of the clock is available for bit 2
	if(b < 11) 
		b <= b + 1;
	else if(b == 11)
		b <= 1;	
	end
	
	always@(posedge endSwitch)
	//stores the binary data of the key then only releases it as soon as the released code is inputted
	begin	
	if(bitInfo == 8'hf0) // f0 is the stop code for when the key is released
		outputBinData <= storage;
	else//stores the value of the key pressed as long as its not the release code
		storage <= bitInfo;	
	end
		

endmodule
 