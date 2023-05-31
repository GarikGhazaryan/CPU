module segment (clk, rst, num, segment);

input [3:0]num;
input rst, clk;
output reg [6:0] segment;

reg [6:0] seg;

always@(*) begin
		case (num)
			4'd0: seg=7'b0000001;
			4'd1: seg=7'b1001111;
			4'd2: seg=7'b0010010;
			4'd3: seg=7'b0000110;
			4'd4: seg=7'b1001100;
			4'd5: seg=7'b0100100;
			4'd6: seg=7'b0100000;
			4'd7: seg=7'b0001111;
			4'd8: seg=7'b0000000;
			4'd9: seg=7'b0000100;
			default: seg=7'b0;
   		endcase
end

always@(posedge clk) begin
		if(rst) segment<=7'b0;
		else segment<=seg;
end

endmodule
