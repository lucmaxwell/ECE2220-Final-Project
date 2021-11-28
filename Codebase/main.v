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
	
	reg [47:0] passwords [0:NUM_PASSWORDS - 1];
	reg [0:47] currentPassword;
	
	wire [7:0] fromKeyboard;
	
	reg [47:0] toDisplay;

	reg newPassword;
	
	
	// Initial block
	initial begin
		currPasswordIndex = 0;
		newPassword = 1;
		currentPassword = {6{8'b01000101}};
		toDisplay = {6{8'b01000101}};
		isValidPassword = 0;
		lockout = 0;
		numPasswordAttempts = 0;
		
		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			passwords[k] = {6{8'b01000101}};
		end
	end
	
	// Keyboard and display modules
	keyboard ke(PS2_Clock, PS2_Data, fromKeyboard);
	displaymodule display(toDisplay, sevenSeg0, sevenSeg1, sevenSeg2, sevenSeg3, sevenSeg4, sevenSeg5);
		
	// Always statements
	always @(negedge addLetter) begin
		currentPassword = currentPassword >> 8;
		currentPassword[0:7] = fromKeyboard;
		toDisplay = currentPassword;
	end

	// Add password
	always @(negedge addPassword) begin
		passwords[currPasswordIndex] = currentPassword;
		currPasswordIndex = (currPasswordIndex + 1) % NUM_PASSWORDS;
//		newPassword = !newPassword;
	end

	// Try password
	always @(negedge tryPassword) begin
		isValidPassword = 0; // Not valid password until proven to be.
		
		if (numPasswordAttempts < 3) begin
			for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
				if (passwords[k] == currentPassword) begin
					isValidPassword = 1;
					numPasswordAttempts = 0;
				end
			end
		end
		
		if (!isValidPassword) begin
				numPasswordAttempts = numPasswordAttempts + 1;
		end
		
	end

	always @(numPasswordAttempts) begin
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
