class RAM{
	short n;
	short* ram;
	public:
		RAM();

		RAM(short N);       

		short read(int adres);

		void write(int adres, int data);

		~RAM();
};

