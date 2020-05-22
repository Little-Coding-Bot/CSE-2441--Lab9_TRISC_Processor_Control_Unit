This is the file for our Six Instruction Controller, that is the controller that can execute 6 instructions - INC, CLR, JMP, LDA, STA, and ADD
(Increment ACC, Clear ACC, Jump, Load ACC, Store ACC, and Add ACC instructions).


The opcodes for the 6 commands are:
* LDA opcode 	= 0000 => 0
* STA opcode 	= 0001 => 1
* ADD opcode 	= 0010 => 2
* INC opcode 	= 0110 => 6
* CLR opcode 	= 0111 => 7
* JMP opcode 	= 1000 => 8

We have the verilog code for the Six Instruction Controller, which we convert to a .bsf (symbol file), the symbol file of our SixController is:  

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Six%20Instruction%20Controller/SixController%20Symbol%20File.png)

The bdf (block diagram) of our Six Instruction Controller is: 
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Six%20Instruction%20Controller/SixController.png)
