module main(
	input tryPassword, addPassword,
	input PS2_Data, PS2_Clock,
	
	output [7:0] sevenSeg0, sevenSeg1, sevenSeg2, sevenSeg3, sevenSeg4, sevenSeg5
	);
	
	
	// Parameters
	parameter NUM_PASSWORDS = 2;
	
	// Internal
	integer currPasswordIndex;
	integer k;
	
	reg [47:0] passwords [0:NUM_PASSWORDS - 1];
	
	reg [47:0] currentPassword;
	
	wire [7:0] fromKeyboard;
	
	reg [47:0] toDisplay;
	
	reg newPassword;
	
	
	// Initial block
	initial begin
		currPasswordIndex = 0;
		newPassword = 1;

		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			passwords[k] = 11'b00000000000;
		end
	end
	
	// Keyboard and display modules
	keyboard ke(PS2_Clock, PS2_Data, fromKeyboard);
	displaymodule display(toDisplay, sevenSeg0, sevenSeg1, sevenSeg2, sevenSeg3, sevenSeg4, sevenSeg5);
		
		
	// Always statements
	always @(fromKeyboard) begin
		if (!newPassword) begin
			currentPassword = currentPassword << 8;
			currentPassword[7:0] = fromKeyboard;
		end
		else begin
			currentPassword = {48{1'b1}};
			currentPassword[7:0] = fromKeyboard;
			toDisplay = currentPassword; //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		end
	end

	// Add password
	always @(negedge addPassword) begin
		passwords[currPasswordIndex] = currentPassword;
		currPasswordIndex = (currPasswordIndex + 1) % NUM_PASSWORDS;
		newPassword = 1; //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	end

	// Try password
	always @(negedge tryPassword) begin
		reg isValidPassword = 0; // Not valid password until proven to be.
		
		for (k = 0; k < NUM_PASSWORDS; k = k + 1) begin
			if (passwords[k] == currentPassword) begin
				isValidPassword = 1;
			end
		end
		
	end
	
	
	// Tasks
	task updateDisplay();
		toDisplay = currentPassword;
	endtask

endmodule
