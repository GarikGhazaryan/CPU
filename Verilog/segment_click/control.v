module control (clk, rst, up, down, out1, out2, out3, out4, out5, out6, out7);

input clk, rst, up, down;
output reg out1, out2, out3, out4, out5, out6, out7;

wire [6:0]segment;
reg [3:0] num;

reg [3:0] state;
wire up_out;
wire down_out;
localparam [3:0]

    state_0 = 4'd0,
    state_1 = 4'd1,
    state_2 = 4'd2,
    state_3 = 4'd3,
    state_4 = 4'd4,
    state_5 = 4'd5,
    state_6 = 4'd6,
    state_7 = 4'd7,
    state_8 = 4'd8,
    state_9 = 4'd9;

segment s1 (clk, rst, num, segment);

debounce deb_up (.clk(clk), .rst(rst), .button(up), .change(up_out));

debounce deb_down (.clk(clk), .rst(rst), .button(down), .change(down_out));

always@(posedge clk)begin
		if(rst) state<=4'b0;
		else state<=num;
end

always@(*)
begin
		case (state)
		state_0: 
					if(up_out) num=state_1;
					else if(down_out) num=state_9;
				 	else num=state_0;
		state_1:
					if(up_out) num=state_2;
					else if(down_out) num=state_0;
					else num=state_1;

		state_2:
					if(up_out) num=state_3;
					else if(down_out) num=state_1;
					else num=state_2;
		state_3: 
					if(up_out) num=state_4;
					else if(down_out) num=state_2;
					 else num=state_3;

		state_4: 
				 if(up_out) num=state_5;
					else if(down_out) num=state_3;
					 else num=state_4;
		state_5: 
				 if(up_out) num=state_6;
					else if(down_out) num=state_4;
					 else num=state_5;
		state_6: 
				 if(up_out) num=state_7;
					else if(down_out) num=state_5;
					 else num=state_6;
		state_7: 
				 if(up_out) num=state_8;
					else if(down_out) num=state_6;
					 else num=state_7;
		state_8: 
				 if(up_out) num=state_9;
					else if(down_out) num=state_7;
					 else num=state_8;
		state_9: 
				 if(up_out) num=state_0;
					else if(down_out) num=state_8;
					 else num=state_9;
		 default: num=state_0;
	 	endcase
end

always@(posedge clk)begin

		out1<=segment[6];
		out2<=segment[5];
		out3<=segment[4];
		out4<=segment[3];
		out5<=segment[2];
		out6<=segment[1];
		out7<=segment[0];
end
endmodule
