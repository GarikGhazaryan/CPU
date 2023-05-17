CPU architecture

CPU model works on this principle

First we have an array of instructions, when Load() is called,
	the instructions are loaded into ram at the addresses allocated for instructions one by one.
	(in this case, the addresses for instructions start from 0 to 9).
	After that, exe() is called, it starts the process, which begins with fetch,
 	after which the first instruction is copied from Ram to the zero register.
	Instructions will be copied one by one to the zero register after the execution of the previous instruction.


Instructions

1.Stor 6912   //This instruction is designed to add a date to ram at the address allocated for the date.  
2.Stor 11264   //This instruction is designed to add a date to ram at the address allocated for the date.
3.Add  15036   // (+)  This instruction is for arithmetic on the dates added by the first two instructions.
4. 19900   // (-)  This instruction is for arithmetic on the dates added by the first two instructions.
5.Complement 24252   // (~)  This instruction is for arithmetic on the dates added by the first two instructions.







To compile the program, you need to call (make),
To test the program, you need to call (make test),
To clean the folder from files created by compilation, you need to call (make clean),
