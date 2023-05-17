#include <iostream>
#include "Ram.hpp" 
#include <cassert>

	RAM::RAM(){

	}

	RAM::RAM(short N){       
		n=N;
		ram=new short[N];
		for(int i=0;i<N;i++){
			ram[i]=0;
		}
	}

	short RAM::read(int adres){
		assert(adres >= 0 && adres<n);
		return ram[adres];
	}

	void RAM::write(int adres, int data){
		assert(adres >= 0 && adres<n);
		ram[adres]=data;
	}

	RAM::~RAM(){
		delete [] ram;
	}
