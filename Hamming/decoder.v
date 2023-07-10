module decod (data_h_in, data_out);

input [6:0] data_h_in;
output reg [6:0] data_out;

wire [2:0] s;

assign s[2] = data_h_in[2] ^ data_h_in[6] ^ data_h_in[5] ^ data_h_in[3];
assign s[1] = data_h_in[1] ^ data_h_in[6] ^ data_h_in[4] ^ data_h_in[3];
assign s[0] = data_h_in[0] ^ data_h_in[5] ^ data_h_in[4] ^ data_h_in[3];

always@(s) begin
	case(s)
		000: data_out=data_h_in[6:0];

		100: data_out={1'b1, data_h_in[5:0]};

		010: data_out={data_h_in[6], 1'b1, data_h_in[4:0]};

		001: data_out={data_h_in[6:5], 1'b1, data_h_in[3:0]};

		110: data_out={data_h_in[6:4], 1'b1, data_h_in[2:0]};

		011: data_out={data_h_in[6:3], 1'b1, data_h_in[1:0]};

		111: data_out={data_h_in[6:2], 1'b1, data_h_in[0]};

		101: data_out={data_h_in[6:1], 1'b1};
	endcase	
end
endmodule
