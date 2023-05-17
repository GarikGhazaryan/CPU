#include <iostream>
#include "Cpu.hpp" 

int main(){

	short all_data[]={6912, 11264, 15036,19900,24252};
	short size=(sizeof (all_data))/(sizeof(short));
	CPU cpu(size);
	cpu.load(all_data);
	cpu.exe();
}

