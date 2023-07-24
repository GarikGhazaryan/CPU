module decod (data_h_in, data_out);

input [14:0] data_h_in;
output reg [14:0] data_out;

wire [3:0] s;

assign s[0] = data_h_in[14] ^ data_h_in[12] ^ data_h_in[10] ^ data_h_in[8] ^ data_h_in[6] ^ data_h_in[4] ^ data_h_in[2] ^ data_h_in[0];
assign s[1] = data_h_in[13] ^ data_h_in[12] ^ data_h_in[9] ^ data_h_in[8] ^ data_h_in[5] ^ data_h_in[4] ^ data_h_in[1] ^ data_h_in[0];
assign s[2] = data_h_in[11] ^ data_h_in[10] ^ data_h_in[9] ^ data_h_in[8] ^ data_h_in[3] ^ data_h_in[2] ^ data_h_in[1] ^ data_h_in[0];
assign s[3] = data_h_in[7] ^ data_h_in[6] ^ data_h_in[5] ^ data_h_in[4] ^ data_h_in[3] ^ data_h_in[2] ^ data_h_in[1] ^ data_h_in[0];

always@(*) begin
	case(s)
		4'b0000 : data_out = data_h_in[14:0];

		4'b0001 : data_out = {~data_h_in[14], data_h_in[13:0]};

		4'b0010 : data_out = {data_h_in[14], ~data_h_in[13], data_h_in[12:0]};

		4'b0011 : data_out = {data_h_in[14:13], ~data_h_in[12], data_h_in[11:0]};

		4'b0100 : data_out = {data_h_in[14:12], ~data_h_in[11], data_h_in[10:0]};

		4'b0101 : data_out = {data_h_in[14:11], ~data_h_in[10], data_h_in[9:0]};

		4'b0110 : data_out = {data_h_in[14:10], ~data_h_in[9], data_h_in[8:0]};

		4'b0111 : data_out = {data_h_in[14:9], ~data_h_in[8], data_h_in[7:0]};

		4'b1000 : data_out = {data_h_in[14:8], ~data_h_in[7], data_h_in[6:0]};

		4'b1001 : data_out = {data_h_in[14:7], ~data_h_in[6], data_h_in[5:0]};

		4'b1010 : data_out = {data_h_in[14:6], ~data_h_in[5], data_h_in[4:0]};

		4'b1011 : data_out = {data_h_in[14:5], ~data_h_in[4], data_h_in[3:0]};

		4'b1100 : data_out = {data_h_in[14:4], ~data_h_in[3], data_h_in[2:0]};

		4'b1101 : data_out = {data_h_in[14:3], ~data_h_in[2], data_h_in[1:0]};

		4'b1110 : data_out = {data_h_in[14:2], ~data_h_in[1], data_h_in[0]};

		4'b1111 : data_out = {data_h_in[14:1], ~data_h_in[0]};

		default: data_out = data_h_in;
	endcase	
end
endmodule
