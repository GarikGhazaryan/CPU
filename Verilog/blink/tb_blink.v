`timescale 1 ms/1 ps
module tb;

reg clk;
reg rst;
wire led;

blink bk (clk, rst, led);
initial begin
	$dumpfile("ck.vcd");
    $dumpvars();
	clk=1'b0;
end

always #0.0004 clk = ~clk;

initial begin
		rst=1'b1;
		#(2);

		rst=1'b0;
		#30;
		$finish;
end
endmodule
