module mem #(parameter ADR_SIZE = 4, parameter DATA_SIZE = 8) (clk, adress, data, wr_en, read_en);

localparam DEPTH = (1 << ADR_SIZE) - 1;

input clk, wr_en, read_en;
input [ADR_SIZE - 1 : 0] adress;
inout [DATA_SIZE - 1 : 0] data;

reg [(DATA_SIZE - 1) : 0] ram [0 : DEPTH];

assign data = (read_en & !wr_en) ? ram[adress] : {DATA_SIZE{1'bz}};

always@(posedge clk)begin
	if(wr_en)
		ram[adress] <= data; 
end
endmodule
