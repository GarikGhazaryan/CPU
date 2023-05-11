#include <iostream>
#include <bitset>

class RAM{
	int data_wr;
	int data_r2;
	int data_r3;
	int instr1=9999;
	int instr2=7777;
	int instr3=444;
	public:

	int read(int adres){
		switch(adres){
			case 1:
					return data_wr;
			case 2:
					return data_r2;
			case 3:
					return data_r3;
			case 4:
					return instr1;
			case 5:
					return instr2;
			case 6:
					return instr3;
		}
		return 0;
	}

	void write(int adres,int data){
		switch(adres){
				case 1:
						data_wr=data;
				case 2:
						data_r2=data;
				case 3:
						data_r3=data;
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
		public:	
			int inst;
			int op;
			int r_wr;
			int r2;
			int r3;
			int cir=4;     //current instruction adres register
			int rdat1=8;
			int rdat2=9;
			int rdat_wr;


	
		void fetch(){
			RAM ram;
			inst=ram.read(cir);	
		}
	
		void decod(){
	
			r3=inst&0b1111;
			r2=inst>>4&0b1111;
			r_wr=inst>>8&0b1111;
			op=inst>>12&0b1111;
		}

		void execute(){
			ALU alu;
			std::cout<<alu.perform(op,rdat1,rdat2)<<std::endl;
		}



		void print(){	
			std::cout << inst<< std::endl;
			std::cout << op<< std::endl;
			std::cout << r_wr<< std::endl;
			std::cout << r2<< std::endl;
			std::cout << r3<< std::endl;
			
			std::cout << std::bitset<sizeof(inst) * 4>(inst) << std::endl;
			std::cout << std::bitset<sizeof(op) * 4>(op) << std::endl;
			std::cout << std::bitset<sizeof(r_wr) * 4>(r_wr) << std::endl;
			std::cout << std::bitset<sizeof(r2) * 4>(r2) << std::endl;
			std::cout << std::bitset<sizeof(r3) * 4>(r3) << std::endl;
		}
	};


class CPU{
	CU cu;
	public:	
		void load(){
			cu.fetch();
			cu.decod();
			cu.execute();
		//	cu.print();
		}
};



int main(){
	
		CPU cpu;
		cpu.load();
}
