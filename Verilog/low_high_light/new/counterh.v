module Counter_high #(parameter N=10)(clk, rst, count);

input clk, rst;
output reg [31:0] count;

always @(posedge clk) begin
	if (rst) count <= 32'b0;
	else 
		if(count==N)begin
			count <= 32'b0;
		end
		else begin
			count <= count + {{31{1'b0}}, 1'b1};
		end
end
endmodule
