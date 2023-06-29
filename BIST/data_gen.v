module dat_gen #(parameter DATA_SIZE=8) (data_bit, wr_en, data, data_et);

input data_bit, wr_en;
output [DATA_SIZE-1 : 0] data;
output [DATA_SIZE-1 : 0] data_et;

assign data = wr_en ? {DATA_SIZE{data_bit}} : {DATA_SIZE{1'bz}};
assign data_et = {DATA_SIZE{data_bit}};

endmodule
