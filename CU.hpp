#include "Alu.hpp"
#include "Ram.hpp"
#include "Reg.hpp"
class CU{
	RAM* ram;
	REG* reg;
	ALU alu;

	public:

		CU();

		CU(RAM* r, REG* rg);

		void fetch();

		void decod(int inst);

		void execute(short op);

		void print();
};

