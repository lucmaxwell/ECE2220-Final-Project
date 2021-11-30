module main(
	input tryPassword, addPassword,
	input PS2_Data, PS2_Clock, addLetter,
	
	output [6:0] sevenSeg0, sevenSeg1, sevenSeg2, sevenSeg3, sevenSeg4, sevenSeg5, 
	output reg isValidPassword, 
	output reg [2:0] lockout
	);
	
	// Parameters
	parameter NUM_PASSWORDS = 2;
	
	// Internal
	integer currPasswordIndex;
	integer k;
	integer numPasswordAttempts;
	
	reg [47:0] passwords [0:NUM_PASSWORDS - 1]; // Stores the valid passwords
	reg [0:47] currentPassword; // Store the current password being entered by the user
	
	wire [7:0] fromKeyboard; // The last key code sent from the keyboard
	
	reg [47:0] toDisplay; // What's displayed on the seven segment displays
	
	// Initial block
	initial begin
		// Initializes all varaibles
		currPasswordIndex = 0;
		isValidPassword = 0;
		lockout = 0;
		numPasswordAttempts = 0;
		
		currentPassword = {6{8'b01000101}}; // Display '000000' when the program starts
		toDisplay = {6{8'b01000101}}; // Display '000000' when the program starts
		
		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin // Sets the default password -> '000000'
			passwords[k] = {6{8'b01000101}};
		end
	end
	
	// Keyboard and display modules
	keyboard ke(PS2_Clock, PS2_Data, fromKeyboard); // sets fromKeyboard variable to the last bianary code from the keyboard
	displaymodule display(toDisplay, sevenSeg0, sevenSeg1, sevenSeg2, sevenSeg3, sevenSeg4, sevenSeg5); // Sends toDisplay to display on seven segment displays
		
	// Always statements
	always @(negedge addLetter) begin
		// When the user wants to add a letter to the password they are entering, shift all current letter over and add the last key inputted by the keyboard
		currentPassword = currentPassword >> 8;
		currentPassword[0:7] = fromKeyboard;
		toDisplay = currentPassword;
	end

	// Add password
	always @(negedge addPassword) begin
		// To add a password, add the current password dispalyed on the seven segment displays to the 2d array of valid passwords
		passwords[currPasswordIndex] = currentPassword;
		currPasswordIndex = (currPasswordIndex + 1) % NUM_PASSWORDS; // Increase password index
	end

	// Try password
	always @(negedge tryPassword) begin
		// Goes through all valid passwords and checks if the current password is equal to one of them
		isValidPassword = 0; // Not valid password until proven to be.
		
		if (numPasswordAttempts < 3) begin // Make sure we have password attempts remaining
			for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
				if (passwords[k] == currentPassword) begin
					isValidPassword = 1;
					numPasswordAttempts = 0; // Give user all password attempts back
				end
			end
		end
		
		if (!isValidPassword) begin // If the current password is not valid, add a password attempt
				numPasswordAttempts = numPasswordAttempts + 1;
		end
		
	end

	always @(numPasswordAttempts) begin
		// Drive LEDs to indicate number of remaining password attempts
		if (numPasswordAttempts == 0) begin
			lockout = 3'b111;
		end
		else if (numPasswordAttempts == 1) begin
			lockout = 3'b110;
		end
		else if (numPasswordAttempts == 2) begin
			lockout = 3'b100;
		end
		else begin
			lockout = 3'b000;
		end
		
	end
	
endmodule
