module counter (
	input [3:0] load,
	input clk,
	input rst,
	output reg out/*=1'b0*/
);

	reg [3:0] count;
	always @(posedge clk) 
	begin
		if (rst)begin
			count <= 4'b0000;
			out <= 1'b0;
		end
		else if(count==load)
		begin
			out <= 1'b1;
			count<=1'b0;
			end
		else
		begin
			count <= count + 1;
			out <= 1'b0;
		end
	end
endmodule
