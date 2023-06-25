module dat_gen (data_bit, wr_en, data, data_et);

parameter Dta_size=8;

input data_bit, wr_en;
output [Dta_size-1 : 0] data;
output [Dta_size-1 : 0] data_et;

assign data = wr_en ? (data_bit ? {Dta_size{1'b1}} : {Dta_size{1'b0}}) :{Dta_size{1'bz}} ;
assign data_et = data_bit ? {Dta_size{1'b1}} : {Dta_size{1'b0}};


endmodule
