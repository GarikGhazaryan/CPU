module counter (
	input [3:0] load,
	input clk,
	input rst,
	output reg out/*=1'b0*/
);

	reg [3:0] count;
	always @(posedge clk) begin
		if (rst)
			count <= 4'b0000;
		else
			count <= count + 1;

		if ((count == load) && ~rst) begin
			count<=1'b0;
			out <= 1'b1;
		end
			//out <= 1'b0;
	end
	always @(*)begin
			if(count==0) out <= 1'b0;
			else out<=1'b1;
	end
endmodule
