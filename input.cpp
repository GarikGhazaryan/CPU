#include <iostream>

class Memory{
    protected:
        int* data1ptr;
        int* data2ptr;
        char* oprt;

    public:
		Memory(){
			data1ptr=nullptr;
			data2ptr=nullptr;
			oprt=nullptr;
		}
};

class Input:public Memory{
	protected:
		int a;
		int b;
		char op;

	public:
		Input(){
			std::cin>>a;
			std::cin>>op;
			std::cin>>b;

			data1ptr=new int(a);
			data2ptr=new int(b);
			oprt=new char(op);

		}

		void print(){
			std::cout<<*data1ptr<<std::endl;
			std::cout<<*oprt<<std::endl;
			std::cout<<*data2ptr<<std::endl;
		}
};
class CU:public Memory{
};

int main(){
		Input in;
		in.print();

}
