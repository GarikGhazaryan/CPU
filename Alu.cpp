#include "Alu.hpp" 

	int ALU::perform(int op, int dat1, int dat2){
		switch(op){
			case 3:
				return dat1+dat2;
			case 4:
				return dat1-dat2;
			case 5:
				return ~dat1;
		}
		return 0;
	}
