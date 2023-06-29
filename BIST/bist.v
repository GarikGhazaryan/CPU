module Bist #(parameter ADR_SIZE = 4, parameter DATA_SIZE = 8) (clk, rst, start, status, done);

input clk, rst, start;
output status, done;

wire [ADR_SIZE-1 : 0] adress;
wire [DATA_SIZE-1 : 0] data;
wire [DATA_SIZE-1 : 0] data_et;

wire enable, c_out, rst_adr, pr_res_adr, read_en, wr_en, up_down, data_bit, error;

control ctrl (clk, rst, start, c_out, error, status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit );

mem #(ADR_SIZE, DATA_SIZE) mm (clk, adress, data, wr_en, read_en);

adr_gen #(ADR_SIZE) adrg (clk, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

comparator #(DATA_SIZE) comp (.data_et(data_et), .data_read(data), .read_en(read_en), .error(error));

dat_gen #(DATA_SIZE) datg (data_bit, wr_en, data, data_et);

endmodule

