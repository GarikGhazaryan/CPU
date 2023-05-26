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

	always #40 clk = ~clk;

	always @(*) begin
		#10;
		rst = 1'b0;
		$display("time=%0t out=%b", $time, ld);
		#103;
		sw=1'b1;
		#901;
		sw=1'b0;
		#1607;
		sw=1'b1;
		#503;
		sw=1'b0;
		#203;
		$display("time=%0t out=%b", $time, ld);
		rst = 1'b0;
		#207;
		rst = 1'b1;
		#309;
		$finish;
	end
endmodule

