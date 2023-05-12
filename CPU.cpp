#include <iostream>
#include <bitset>

class RAM{
	int data_wr;
	int data_r2=8;
	int data_r3=9;
	int instr1=9999;
	int instr2=7777;
	int instr3=444;
	public:

		int read(int adres){
			switch(adres){
				case 55:
					return data_wr;
				case 0:
					return data_r2;
				case 15:
					return data_r3;
				case 6:
					return data_r2;
				case 1:
					return data_r3;
				case 11:
					return data_r2;
				case 12:
					return data_r3;
				case 100:
					return instr1;
				case 101:
					return instr2;
				case 102:
					return instr3;
			}
			return 0;
		}

		void write(int adres,int data){
			switch(adres){
				case 7:
					data_wr=data;
					break;
				case 14:
					data_wr=data;
					break;
				case 1:
					data_wr=data;
					break;
		}
	}
};

class ALU{
	public:
		int perform(int op, int dat1, int dat2){ 
			switch(op){
				case 0:
					return dat1*dat2;
				case 1:
					return dat1-dat2;
				case 2:
					return dat1+dat2;
			}
			return 0;
		}
};
	
class CU{
	int inst;
	int op;
	int r_wr;
	int r2;
	int r3;
	int cir=100;     //current instruction adres register
	int rdat1;
	int rdat2;
	int rdat_wr;
	public:
		void fetch(){
			RAM ram;
			inst=ram.read(cir);	
			cir++;
		}
	
		void decod(){
	
			r3=inst&0b1111;
			r2=inst>>4&0b1111;
			r_wr=inst>>8&0b1111;
			op=inst>>12&0b1111;
		}

		void execute(){
			ALU alu;
			RAM ram;
			rdat1=ram.read(r2);
			rdat2=ram.read(r3);
			rdat_wr=alu.perform(op,rdat1,rdat2);
			ram.write(r_wr,rdat_wr);


			std::cout<<"data_wr - "<<ram.read(55)<<std::endl;
			//std::cout<<"rdat_wr - "<<rdat_wr<<std::endl;
		}



		void print(){	
			std::cout <<"inst - "<< inst<< std::endl;
			std::cout << "op - "<< op<< std::endl;
			std::cout << "r_wr - "<< r_wr<< std::endl;
			std::cout << "r2 - "<< r2<< std::endl;
			std::cout << "r3 - "<< r3<< std::endl;
			
	//		std::cout << std::bitset<sizeof(inst) * 4>(inst) << std::endl;
	//		std::cout << std::bitset<sizeof(op) * 4>(op) << std::endl;
	//		std::cout << std::bitset<sizeof(r_wr) * 4>(r_wr) << std::endl;
	//		std::cout << std::bitset<sizeof(r2) * 4>(r2) << std::endl;
	//		std::cout << std::bitset<sizeof(r3) * 4>(r3) << std::endl;
		}
};


class CPU{
	CU cu;
	public:	
		void load(){
			cu.fetch();
			cu.decod();
			cu.execute();
			cu.print();
		}
};



int main(){
	
		CPU cpu;
		CU cu;
		for(int i=0;i<3;i++){
		cpu.load();
		}
}
