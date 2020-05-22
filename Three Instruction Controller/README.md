This is the Controller that can execute 3 instructions - INC, CLR, and JMP (Increment, Clear, and Jump commands).
The opcodes for the 3 commands are:
* INC opcode -> 0110 = 6
* CLR opcode -> 0111 = 7
* JMP opcode -> 1000 = 8

We have the verilog code for the Three Instruction Controller, which we convert to bsf (symbol file).  

In the verilog code we set certain TRISC control values to either 0 (OFF) or 1 (ON). The TRISC control codes are   
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/TRISC%20Control%20Signals.png)

The symbol file for our ThreeController is   

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Three%20Instruction%20Controller/ThreeController%20Symbol%20File.png)  

And the bdf (block diagram) is   
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Three%20Instruction%20Controller/ThreeController.png)
