module main(
	input [9:0] switch,
	input tryPassword, addPassword, removePassword,
	input PS2_Data, PS2_Clock,
	output reg [9:0] switchLED,
	output reg passwordCheck
	);
	
	// Parameters
	parameter NUM_PASSWORDS = 2;
	
	// Internal
	reg [9:0] passwords [0:NUM_PASSWORDS - 1];
	integer currPasswordIndex;
	integer k;
	
	// Initial block
	initial begin
		passwordCheck = 1;
		currPasswordIndex = 0;

		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			passwords[k] = 10'b0000000000;
		end
	end
	
	// Always statements

	// Switch LEDs
	always @(switch) 
		switchLED = switch;	

	// Add password
	always @(negedge addPassword) begin
		passwords[currPasswordIndex] = switch;
		currPasswordIndex = (currPasswordIndex + 1) % NUM_PASSWORDS;
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
	// Try password
	always @(negedge tryPassword) begin
		reg isValidPassword;
		
		isValidPassword = 0; // Not valid password until proven to be.
		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			if (passwords[k] == switch) begin
				isValidPassword = 1;
			end
		end
		
		passwordCheck = isValidPassword;
		
	end
	
endmodule
