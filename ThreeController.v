// Verilog Behavioral Model of A ID Controller which fetches the signals and
// executes 3 intstructions - INC, CLR, and JMP
// (Increment, Clear, and Jump instructions)


// The opcodes for the 3 commands are:
// INC opcode = 0110 = 6
// CLR opcode = 0111 = 7
// JMP opcode = 1000 = 8

module ThreeController (INC, CLR, JMP, Clock, Reset, C0, C1, C2, C3, C4, C7, C8, C9);
	input INC, CLR, JMP, Clock, Reset; //declare input variables
	output reg C0, C1, C2, C3, C4, C7, C8, C9; //declare output signals
	reg [2:0] state, nextstate; //declare state and next state variables
	
	parameter A=4'b0, B=4'b1, C=4'b10, D=4'b11, E=4'b100, F=4'b110, G=4'b101, H=4'b111;
		always @ (posedge Clock, negedge Reset) //Detect input variable transitions
			if (Reset == 1'b0) state <= A; //Take controller to state A on Reset
				else state <= nextstate; //Change state
		always @ (state) //Derive next state and outputs according to state diagram
			case (state)
				// State A, C0 = 1
				A: begin nextstate=B; C0=1'b1; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0; end
				
				// State B, C3 = 1
				B: begin nextstate=C; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b1; C4 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;
				 end
				
				// State C, C4 = 1
				C: begin nextstate=D; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; 
				C7 = 1'b0; C8 = 1'b0;
				 end
				
				// State D, C4 = 1
				D: begin nextstate=E; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; 
				C7 = 1'b0; C8 = 1'b0;
				 end
				
				// State E, C2 = C7 = 1
				E: 
					begin //beginning of state E case statement
						C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; 
						C7 = 1'b0; C8 = 1'b0;
				
						// Increment Command (INC) opCode=0110; set C2 = 1 (Load PC)
						if (INC)
							begin
							nextstate=F; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0; C9 = 1'b1;
							end
					
						// Clear Command (CLR) opCode=0111; set C8 = 1 (Clear Accumulator)
						else if (CLR)
							begin
							nextstate=G; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; 
							C7 = 1'b0; C8 = 1'b1;
							end
						
						// Jump Command (JMP) opCode=1000; set C1 = 1
						else if(JMP)
							begin
							nextstate=B; C0=1'b0; C1 = 1'b1; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; 
							C7 = 1'b0; C8 = 1'b0;
							end
						end //end of E case statement
				
				default: begin nextstate=A; C0=1'b1; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;
				 end
			endcase
endmodule
