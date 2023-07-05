module encod(data_in, data_h_out);

input [3:0] data_in;
output [6:0] data_h_out;


wire p1, p2, p3;

assign p1 = data_in[0] ^ data_in[1] ^ data_in[3];
assign p2 = data_in[0] ^ data_in[2] ^ data_in[3];
assign p3 = data_in[1] ^ data_in[2] ^ data_in[3];

assign data_h_out = {data_in,p1,p2,p3};

endmodule
