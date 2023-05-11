#include <iostream>
#include <bitset>

int main(){

int inst=9599;

int r3=inst&0b1111;
int r2=inst>>4&0b1111;
int r1=inst>>8&0b1111;
int op=inst>>12&0b1111;


std::cout << op<< std::endl;
std::cout << r1<< std::endl;
std::cout << r2<< std::endl;
std::cout << r3<< std::endl;

std::cout << std::bitset<sizeof(inst) * 4>(inst) << std::endl;
std::cout << std::bitset<sizeof(op) * 4>(op) << std::endl;
std::cout << std::bitset<sizeof(r1) * 4>(r1) << std::endl;
std::cout << std::bitset<sizeof(r2) * 4>(r2) << std::endl;
std::cout << std::bitset<sizeof(r3) * 4>(r3) << std::endl;

}
