#include "CU.hpp"
class CPU{
	short n;
		RAM ram;
		REG reg;
		CU cu;
		void exe(short n);
	public:

		CPU(short size);

		void load(short inst[]);

		void exe();
};

