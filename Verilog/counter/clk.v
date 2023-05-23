module counter (
	input [3:0] load,
	input clk,
	input rst,
	output reg out
);

	reg [3:0] count;
	always @(posedge clk) begin
		if (rst)
			count <= 4'b0000;
		else
			count <= count + 1;

		if (count == load) begin
			count<=1'b0;
			out <= 1'b1;
			@(negedge clk) out = 1'b0;
		end
	end
endmodule
