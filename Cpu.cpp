#include <iostream>
#include "Cpu.hpp" 

	CPU::CPU(short size) {
		n = size;
		ram = RAM(size*4);
		reg = REG();
		cu = CU(&ram, &reg);
	}

	void CPU::load(short inst[]) {
		reg.write(5, 0); // set pc (program counter) to the first instruction address 0
		for (int i = 0; i < n; i++) {
			ram.write(i, inst[i]);
		}
	}

	void CPU::exe(short n){
		for(int i =0;i<n;i++){
			cu.fetch();
		}
	}

	void CPU::exe(){
		exe(n);
	}
