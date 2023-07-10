module decod (data_h_in, data_out);

input [6:0] data_h_in;
output reg [6:0] data_out;

wire [2:0] s;

assign s[2] = data_h_in[6] ^ data_h_in[3] ^ data_h_in[1] ^ data_h_in[0];
assign s[1] = data_h_in[5] ^ data_h_in[3] ^ data_h_in[2] ^ data_h_in[1];
assign s[0] = data_h_in[4] ^ data_h_in[2] ^ data_h_in[1] ^ data_h_in[0];

always@(*) begin
	case(s)
		3'b000: data_out=data_h_in[6:0];

		3'b100: data_out={~data_h_in[6], data_h_in[5:0]};

		3'b010: data_out={data_h_in[6], ~data_h_in[5], data_h_in[4:0]};

		3'b001: data_out={data_h_in[6:5], ~data_h_in[4], data_h_in[3:0]};

		3'b110: data_out={data_h_in[6:4], ~data_h_in[3], data_h_in[2:0]};

		3'b011: data_out={data_h_in[6:3], ~data_h_in[2], data_h_in[1:0]};

		3'b111: data_out={data_h_in[6:2], ~data_h_in[1], data_h_in[0]};

		3'b101: data_out={data_h_in[6:1], ~data_h_in[0]};

		default: data_out= data_h_in;
	endcase	
end
endmodule
