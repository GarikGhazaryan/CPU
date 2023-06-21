module Ram(clk, adress, data, wr_en, read_en);
parameter Dta_size=8;
parameter Adr_size=4;

localparam depth = (1<<Adr_size)-1;

input clk, wr_en, read_en;
input [Adr_size-1 : 0] adress;

inout [Dta_size-1 : 0] data ;

reg [(Dta_size-1) : 0] ram[0 : depth];

assign data= read_en & !wr_en ? ram[adress] : {Dta_size{1'bz}};

always@(posedge clk)begin

	if(wr_en)begin
	       	ram[adress]<=data; 
	end
end
endmodule
