#include <iostream>
#include "Reg.hpp"
#include <cassert>

		REG::REG(){
			for(int i=0;i<15;i++){
				reg[i]=0;
			}
		}

		short REG::read(int adres){
			assert(adres >= 0 && adres<15);
			return reg[adres];
		}

		void REG::write(int adres, int data){
			assert(adres >= 0 && adres<15);
			reg[adres]=data;
		}
