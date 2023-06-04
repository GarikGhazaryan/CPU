module LowHigh (clk, rst, led);

input clk, rst;
output reg led;

parameter length=30;
parameter speed_down=300;

wire [31:0] high_out;
wire [31:0] low_out;

Counter_high #(.N(length)) high (.clk(clk), .rst(rst), .count(high_out));

Counter_low #(.M(speed_down), .N(length)) low (.clk(clk), .rst(rst), .count(low_out));

always@(*)begin
		if(rst) led=1'b0;
		else begin
				if(high_out<low_out) led<=1'b1;
				else led<=1'b0;
		end
end	
endmodule


