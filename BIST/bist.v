module Bist();

parameter Dta_size=8;
parameter Adr_size=4;

wire c_out;
wire [Adr_size-1 : 0] adress;
wire [Dta_size-1 : 0] data;
wire [Dta_size-1 : 0] data_et;
wire [Dta_size-1 : 0] data_read;

reg enable, rst_adr, pr_res_adr, read_en, wr_en, up_down, data_bit;



mem mm (clk, adress, data, wr_en, read_en);

adr_gen adrg (clk, rst, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

comparator comp (.data_et(data_et), .data_read(data), .read_en(read_en), .error(error));

dat_gen datg (data_bit, wr_en, data, data_et);



