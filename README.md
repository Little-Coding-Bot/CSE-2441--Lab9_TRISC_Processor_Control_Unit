# CSE-2441--Lab9_TRISC_Processor_Control_Unit
Ninth lab assignment for CSE2441 (Introduction to Digital Logic). Implementing the TRISC Processor Control Unit.  

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Instruction%20Decoder/TRISC%20Controller%20Diagram.png) 

## TRISC Organization
The TRISC organization is  

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/TRISC%20Organization.png)  

## TRISC Instruction Set
The TRISC Instruction Set for Lab 9 is  

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/TRISC%20Instruction%20Set.png) 


And the Controller Finite State Machine (FSM) State Diagram for INC and CLR Instructions is  

![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Controller%20FSM%20State%20Diagram%20for%20INC%20and%20CLR%20Instructions.png)  


## Lab Parts
The lab was done in multiple parts:
* The first part was to build an Instruction Decoder (ID) that can receive the input and decode it.  
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Instruction%20Decoder/Instruction%20Decoder.png)  



* The second part was to build a Three Instruction Controller - which is a Controller that can execute three instructions -> INC, CLR, and JMP (Increment, Clear, and Jump commands).  
**NOTE: The Three Instruction Controller has two files - one where I wrote the verilog code, and created a symbol file. The second is where I used the symbol file to create a .bdf (block diagram file) using the mentioned symbol file**  
The bdf of our Three Instruction Controller is  
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Three%20Instruction%20Controller/ThreeController.png)

* The third part was to build a Six Instruction Controller - which is a Controller that can execute six instructions -> INC, CLR, JMP, LDA, STA, and ADD (Increment ACC, Clear ACC, Jump, Load ACC, Store ACC, and Add ACC instructions).  
**NOTE: The Six Instruction Controller has two files - one where I wrote the verilog code, and created a symbol file. The second is where I used the symbol file to create a .bdf (block diagram file) using the mentioned symbol file**

* And the final part was a bonus question where we combined the Instruction Decoder and Six Instruction Controller and demonstrated it on the DE1 Altera Board to the teacher.  

The bdf of our Six Instruction Controller is  
![](https://github.com/ShameenShetty/CSE-2441--Lab9_TRISC_Processor_Control_Unit/blob/master/Six%20Instruction%20Controller/SixController.png)
