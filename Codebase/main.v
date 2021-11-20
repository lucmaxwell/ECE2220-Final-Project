module main(
	input [9:0] switch,
	input tryPassword, addPassword, removePassword,
	
	input PS2_Data, PS2_Clock,
	output reg [9:0] switchLED,
	output reg passwordCheck,
	output reg [7:0] sevenSeg [5:0]
	);
	
	
	// Parameters
	parameter NUM_PASSWORDS = 2;
	
	// Internal
	reg [9:0] passwords [0:NUM_PASSWORDS - 1];
	integer currPasswordIndex;
	integer k;
	reg [7:0] fromKeyboard;
	reg useKeyboard;
	reg [48:0] toDisplay;
	

	
	// Initial block
	initial begin
		passwordCheck = 1;
		currPasswordIndex = 0;
		useKeyboard = 1;

		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			passwords[k] = 10'b0000000000;
		end
	end
	
	// Keyboard and display modules
	keyboard k(PS2_Clock, PS2_Data, fromKeyboard);
	displayModule display(toDisplay, sevenSeg[0], sevenSeg[1], sevenSeg[2], sevenSeg[3], sevenSeg[4], sevenSeg[5], sevenSeg[6], sevenSeg[7])
	
	
	// Always statements
	always @(fromKeyboard) begin
		if (useKeyboard) begin
			toDisplay << 8;
			toDisplay[7:0] = fromKeyboard;
			toDisplay[48] = 1;
		end
	end
	
	
	// Switch LEDs
	always @(switch) 
		switchLED = switch;


	// Add password
	always @(negedge addPassword) begin
		if (!useKeyboard) begin
			passwords[currPasswordIndex] = switch;
			currPasswordIndex = (currPasswordIndex + 1) % NUM_PASSWORDS;
		else begin
		
		end
			
	end

	// Try password
	always @(negedge tryPassword) begin
		if (!useKeyboard) begin
			reg isValidPassword;
			
			isValidPassword = 0; // Not valid password until proven to be.
			for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
				if (passwords[k] == switch) begin
					isValidPassword = 1;
				end
			end
			
			passwordCheck = isValidPassword;
		end
		
		else begin
			
		end
	end
	
	
	always @(negedge switchInputType) begin
		useKeyboard = ~useKeyboard
		toDisplay = {}
	end
	
/*
	// Remove password
	always @(negedge removePassword) begin
		reg otherPassword = 10'b0000000000;
		integer targetPasswordIndex = -1;
		
		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
		
			// Find a non-default password if it exists
			if (passwords[k] != otherPassword) begin
				otherPassword = passwords[k];
			end
			
			// Find the index of the password to be deleted
			if (passwords[k] == switch) begin
				targetPasswordIndex = k;
			end
			
		end
		
		// If the password to be deleted was found, delete it
		if (targetPasswordIndex != -1) begin
			passwords[targetPasswordIndex] = otherPassword;
		end
		
	end
*/

endmodule
