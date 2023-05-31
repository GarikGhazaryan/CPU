module control (clk, rst, out1, out2, out3, out4, out5, out6, out7);

input clk, rst;
output reg out1, out2, out3, out4, out5, out6, out7;

wire [6:0]segment;
reg [3:0] num;
reg [3:0] count;

reg [3:0] state;

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

timer #(.WIDTH(32)) tmr  (.clk(clk), .rst(rst), .limit(2_500_000), .pulse_out(pulse_out));

always@(posedge clk)begin
		if(rst) state<=4'b0;
		else state<=num;
end

always@(*)
begin
		case (state)
		state_0: 
				begin if(pulse_out) num=state_1;
					 else num=state_0;
			 end
		state_1:
				begin	if(pulse_out) num=state_2;
					 else num=state_1;
			 end

		state_2:
				begin	if(pulse_out) num=state_3;
					 else num=state_2;
			 end
		state_3: 
				begin	if(pulse_out) num=state_4;
					 else num=state_3;
			 end

		state_4: 
				begin if(pulse_out) num=state_5;
					 else num=state_4;
			 end
		state_5: 
				begin if(pulse_out) num=state_6;
					 else num=state_5;
			 end
		state_6: 
				begin if(pulse_out) num=state_7;
					 else num=state_6;
			 end
		state_7: 
				begin if(pulse_out) num=state_8;
					 else num=state_7;
			 end
		state_8: 
				begin if(pulse_out) num=state_9;
					 else num=state_8;
			 end
		state_9: 
				begin if(pulse_out) num=state_0;
					 else num=state_9;
			 end
	 default 	
				begin if(pulse_out) num=state_1;
					 else num=state_1;
			 end
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
