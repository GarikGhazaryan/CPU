#include <iostream>
#include "CU.hpp"
#include <bitset>

	CU::CU(){
	
	}
	
	CU::CU(RAM* r, REG* rg){
		ram=r;
		reg=rg;
	}
	void CU::fetch(){
		reg->write(0, ram->read(reg->read(5))); //reg(0)  instruction register
		reg->write(5, (reg->read(5))+1);            //increment a (pc)
		decod(reg->read(0));
	}
	
	void CU::decod(int inst){
	
		reg->write(4, inst&0b1111);      //reg(4)  data2 adress register
		reg->write(3, inst>>4&0b1111);   //reg(3)  data1 adress register
		reg->write(2, inst>>8&0b1111);   //reg(2)  sum data adress register
		reg->write(1, inst>>12&0b1111);  //reg(1)  opcode register
		execute(reg->read(1));
		print();
	}
	
	void CU::execute(short op){
	
		switch(op){
			case 1:
				ram->write(reg->read(2), 777);
				break;
			case 2:
				ram->write(reg->read(2), 888);
				break;
			default:
				reg->write(6,(ram->read(reg->read(3))));
				reg->write(7,(ram->read(reg->read(4))));
				reg->write(8, alu.perform(reg->read(1),reg->read(6),reg->read(7)));
				ram->write(reg->read(2), reg->read(8));
				break;
		}
	}
	
	
	void CU::print(){
		std::cout<<"ram ";
		for (int i=0;i<20;i++){
			std::cout<<ram->read(i)<<" ";
	}
		std::cout<<std::endl;
		std::cout<<"reg ";
		for (int i=0;i<15;i++){
			std::cout<<reg->read(i)<<" ";
		}
		std::cout<<std::endl;
	}
