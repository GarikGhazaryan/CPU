module Ham (clk, rst, en, true_dat);

input clk, rst, en;
output [14:0] true_dat;

wire [10:0] in_dat;
wire [14:0] h_dat;

 lfsr Ls (.clk(clk), .rst(rst), .en(en), .lfsr_out(in_dat));

 encod enc (.data_in(in_dat), .data_h_out(h_dat));

 decod dec (.data_h_in(h_dat), .data_out(true_dat));

endmodule
