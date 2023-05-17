class REG{

	short reg[15];
	public:
		REG();

		short read(int adres);

		void write(int adres, int data);
};

