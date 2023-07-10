module Ham (in_dat, true_dat);

input [3:0] in_dat;
output [6:0] true_dat;

wire [6:0] h_dat;

encod en (.data_in(in_dat), .data_h_out(h_dat));

decod de (.data_h_in(h_dat), .data_out(true_dat));

endmodule
