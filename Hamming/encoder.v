module encod(data_in, data_h_out);

input [10:0] data_in;
output [14:0] data_h_out;

wire p1, p2, p4, p8;

//wire p0, p1, p2;
//
//assign p0 = data_in[3] ^ data_in[1] ^ data_in[0];
//assign p1 = data_in[3] ^ data_in[2] ^ data_in[1];
//assign p2 = data_in[2] ^ data_in[1] ^ data_in[0];
//
//assign data_h_out = {p0, p1, p2, data_in};


assign p1 = data_in[10] ^ data_in[9] ^ data_in[7] ^ data_in[6] ^ data_in[4] ^ data_in[2] ^ data_in[0];
assign p2 = data_in[10] ^ data_in[8] ^ data_in[7] ^ data_in[5] ^ data_in[4] ^ data_in[1] ^ data_in[0];
assign p4 = data_in[9] ^ data_in[8] ^ data_in[7] ^ data_in[3] ^ data_in[2] ^ data_in[1] ^ data_in[0];
assign p8 = data_in[6] ^ data_in[5] ^ data_in[4] ^ data_in[3] ^ data_in[2] ^ data_in[1] ^ data_in[0];

assign data_h_out = {p1, p2, data_in[10], p4, data_in[9:7], p8, data_in[6:0]};

endmodule
