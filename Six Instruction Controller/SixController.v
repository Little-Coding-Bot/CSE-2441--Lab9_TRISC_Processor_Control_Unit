// Verilog Behavioral Model of A ID Controller which fetches the signals and
// executes 6 instructions - INC, CLR, JMP, LDA, STA, and ADD
// (Increment ACC, Clear ACC, Jump, Load ACC, Store ACC, and Add ACC instructions)


// The opcodes for the 6 commands are:
// LDA opcode 	= 0000 => 0
// STA opcode 	= 0001 => 1
// ADD opcode 	= 0010 => 2
// INC opcode 	= 0110 => 6
// CLR opcode 	= 0111 => 7
// JMP opcode 	= 1000 => 8

module SixController (LDA, STA, ADD, INC, CLR, JMP, Clock, Reset, C0, C1, C2, C3, C4, C5, C7, C8, C9, C10, C11, C12, C13, C14);
	input LDA, STA, ADD, INC, CLR, JMP, Clock, Reset; //declare input variables
	output reg C0, C1, C2, C3, C4, C5, C7, C8, C9, C10, C11, C12, C13, C14; //declare output signals
	reg [2:0] state, nextstate; //declare state and next state variables
	
	parameter A=5'b00000, B=5'b00001, C=5'b00010, D=5'b00011, E=5'b00100, F=5'b00110, G=5'b00101, H=5'b00111,
				 I = 5'b01000, J = 5'b01001, K = 5'b01010, L = 5'b01011, M = 5'b01100, N = 5'b01101, O = 5'b01110,
				 P = 5'b01111, Q = 5'b10000, R = 5'b10001, S = 5'b10010, T = 5'b10011, U = 5'b10100;
		always @ (posedge Clock, negedge Reset) //Detect input variable transitions
			if (Reset == 1'b0) state <= A; //Take controller to state A on Reset
				else state <= nextstate; //Change state
		always @ (state) //Derive next state and outputs according to state diagram
			case (state)
				// State A, C0 = 1
				A: begin nextstate=B; C0=1'b1; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0; C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0; end
				
				// State B, C3 = 1
				B: begin nextstate=C; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b1; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				
				// State C, C4 = 1
				C: begin nextstate=D; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				
				// State D, C4 = 1
				D: begin nextstate=E; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				
				// State E, C2 = C7 = 1
				E: 
					begin //beginning of state E case statement
						// Increment Command (INC) opCode=0110; set C2 = 1 (Load PC)
						if (INC)
							begin
							nextstate=F; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
					
						// Clear Command (CLR) opCode=0111;
						else if (CLR)
							begin
							nextstate=G; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
						
						// Jump Command (JMP) opCode=1000
						else if(JMP)
							begin
							nextstate=H; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
							
						// Load ACC Command (LDA), opcode = 0000;
						else if(LDA)
							begin
							nextstate=I; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
						
						// Store ACC Command (STA), opcode = 0001;
						else if(STA)
							begin
							nextstate=M; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
						
						// Add ACC Command (ADD), opcode = 0010;
						else if(ADD)
							begin
							nextstate=P; C0=1'b0; C1 = 1'b0; C2 = 1'b1; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
							C7 = 1'b1; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
							end
							
						end //end of E case statement
						
				F: begin nextstate=B; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
					C7 = 1'b0; C8 = 1'b0;  C9 = 1'b1; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
					 end
				 
				G: begin nextstate=B; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b1;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				 
				H: begin nextstate=B; C0=1'b0; C1 = 1'b1; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				 
				I: begin nextstate = J; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				 
				J: begin nextstate = K; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				 
				K: begin nextstate = L; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b1; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				 
				L: begin nextstate = B; C0=1'b0; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b1; C11 = 1'b1; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
				
				default: begin nextstate=A; C0=1'b1; C1 = 1'b0; C2 = 1'b0; C3 = 1'b0; C4 = 1'b0; C5 = 1'b0; 
				C7 = 1'b0; C8 = 1'b0;  C9 = 1'b0; C10 = 1'b0; C11 = 1'b0; C12 = 1'b0; C13 = 1'b0; C14 = 1'b0;
				 end
			endcase
endmodule
