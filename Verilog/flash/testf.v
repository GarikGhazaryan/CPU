`timescale 1 ns/1 ps
module tb();
	reg clk;
	reg sw;
	reg rst;
	wire ld ;

	flash f (sw, ld, clk, rst);
	initial begin
		$dumpfile("flash.vcd");
		$dumpvars();
	end
	initial begin
		sw = 1'b0;
		clk = 1'b0;
		rst = 1'b1;

	end

	always #80 clk = ~clk;

	always @(*) begin
		#10;
		rst = 1'b0;
		$display("time=%0t out=%b", $time, ld);
		#100000003;
		sw=1'b1;
		#10000000;
		sw=1'b0;
		#100000007;
		sw=1'b1;
		#10000000;
		sw=1'b0;
		#203;
		$display("time=%0t out=%b", $time, ld);
		rst = 1'b0;
		#20000007;
		rst = 1'b1;
		#309;
		$finish;
	end
endmodule

