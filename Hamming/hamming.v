module Ham (in_dat, true_dat);

input [10:0] in_dat;
output [14:0] true_dat;

wire [14:0] h_dat;

encod en (.data_in(in_dat), .data_h_out(h_dat));

decod de (.data_h_in(h_dat), .data_out(true_dat));

endmodule
