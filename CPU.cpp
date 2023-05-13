#include <iostream>
#include <bitset>

class SSD{

	short ssd[20]={};
	
	public:

		short read(int adres){
			return ssd[adres];
		}

		void write(int adres, int data){
			ssd[adres]=data;
		}

};

class RAM{

	short ram[20];
	
	public:
		RAM(){
			for(int i=0;i<20;i++){
				ram[i]=0;
			}
		}
		short read(int adres){
			return ram[adres];
		}

		void write(int adres, int data){
			ram[adres]=data;
		}

};

class REG{
	
	short reg[10];
	public:

		short read(int adres){
			return reg[adres];
		}

		void write(int adres, int data){
			reg[adres]=data;
		}
};

class ALU{
	public:
		int perform(int op, int dat1, int dat2){ 
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
};
	
class CU{
	int cir=0;     //current instruction adres register		????

	RAM ram;
	REG reg;
	ALU alu;
	SSD ssd;

	public:
		
		void fetch(){
			reg.write(0, ram.read(cir));	//reg(0)  instruction register
			cir++;
			decod(reg.read(0));
		}
	
		void decod(int inst){
	
			reg.write(4, inst&0b1111);      //reg(4)  data2 adress register
			reg.write(3, inst>>4&0b1111);   //reg(3)  data1 adress register
			reg.write(2, inst>>8&0b1111);   //reg(2)  sum data adress register
			reg.write(1, inst>>12&0b1111);  //reg(1)  opcode register
			execute(reg.read(1));
				print();
		}

		void execute(int op){
				std::cout<<op<<std::endl;

			switch(op){
				case 1:
						ram.write(reg.read(2), 777);
						break;
				case 2:
						ram.write(reg.read(2), 888);
						break;
				default:	
						reg.write(6,(ram.read(reg.read(3))));
						reg.write(7,(ram.read(reg.read(4))));
						reg.write(8, alu.perform(reg.read(1),reg.read(6),reg.read(7)));
						ram.write(reg.read(2), reg.read(8));
						break;

			}
		}


		void load_ram(short inst[]){
			for (int i=0;i<5;i++){
				ram.write(i,inst[i]);
			}
		}

		void print(){	
			std::cout<<"ram ";
			for (int i=0;i<20;i++){
					std::cout<<ram.read(i)<<" ";
			}
			std::cout<<std::endl;
			std::cout<<"reg ";
			for (int i=0;i<10;i++){
					std::cout<<reg.read(i)<<" ";
			}
			std::cout<<std::endl;
		}
};


class CPU{
		CU cu;
	public:	
		void load(short inst[]){
				cu.load_ram(inst);
		}
		void exe(){
				cu.fetch();
		}
};



int main(){
		
		short all_data[]={6912, 11264, 15036,19900,24252};
		CPU cpu;
		cpu.load(all_data);
		for(int i=0;i<5;i++){
		cpu.exe();
		}

}
