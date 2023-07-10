module encod(data_in, data_h_out);

input [3:0] data_in;
output [6:0] data_h_out;


wire p0, p1, p2;

assign p0 = data_in[3] ^ data_in[1] ^ data_in[0];
assign p1 = data_in[3] ^ data_in[2] ^ data_in[1];
assign p2 = data_in[2] ^ data_in[1] ^ data_in[0];

assign data_h_out = {p0, p1, p2, data_in};

endmodule
