module comparator (clk, rst, data_et, data_read, read_en, error);

parameter Dta_size=8;
input clk, rst, read_en;
input [Dta_size-1:0] data_et, data_read;
output error;

assign error=read_en ? ((data_et!=data_read) ? 1'b1 : 1'b0) : 1'b0;

endmodule
