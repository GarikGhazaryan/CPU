module comparator #(parameter DATA_SIZE=8) (data_et, data_read, read_en, error);

input read_en;
input [DATA_SIZE-1 : 0] data_et, data_read;
output error;

assign error=read_en ? (data_et != data_read) : 1'b0;
//assign error = read_en ? ((data_et == data_read) ? 1'b1 : 1'b0) : 1'b0;

endmodule
