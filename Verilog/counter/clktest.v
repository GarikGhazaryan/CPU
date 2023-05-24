module tb();
	reg clk;
	reg [3:0] load;
	reg rst;
	wire out;

	counter c (load, clk, rst, out);
	initial begin
		$dumpfile("counter.vcd");
		$dumpvars();
	end
	initial begin
		load = 4'b0;
		clk = 1'b0;
		rst = 1'b1;

	end

	always #15 clk = ~clk;

	always @(*) begin
		#150;
		$display("time=%0t out=%b", $time, out);
		load = 4'b0011;
		rst = 1'b0;
		#250;
		$display("time=%0t out=%b", $time, out);
		load = 4'b0011;
		rst = 1'b1;
		#350;
		$display("time=%0t out=%b", $time, out);
		load = 4'b0011;
		rst = 1'b0;
		#450;
		$display("time=%0t out=%b", $time, out);
	//	rst = 1'b1;
		#600;
		$finish;
	end
endmodule

