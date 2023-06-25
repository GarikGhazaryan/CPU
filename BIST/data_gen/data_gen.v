module dat_gen (data_bit, wr_en, data);

parameter Dta_size=8;

input data_bit, wr_en;
output [Dta_size-1 : 0] data;


assign data = wr_en ? (data_bit ? {Dta_size{1'b1}} : {Dta_size{1'b0}}) :{Dta_size{1'bz}} ;


endmodule
