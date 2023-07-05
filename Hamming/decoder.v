module decod (data_h_in, data_out);

input data_h_in;
output data_out;

wire [2:0] s;

assign S[2] = data_h_in[4] ^ data_h_in[0] ^ data_h_in[1] ^ data_h_in[3];
assign s[1] = data_h_in[5] ^ data_h_in[0] ^ data_h_in[2] ^ data_h_in[3];
assign s[0] = data_h_in[6] ^ data_h_in[1] ^ data_h_in[2] ^ data_h_in[3];


always@(*) begin
	case(s)
		000: data_out=data_h_in[6:3]

		100: 

		010:

		001:

		110:

		011:

		111:

		101:
	endcase	
end
endmodule
