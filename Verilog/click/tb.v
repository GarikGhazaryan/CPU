`timescale 1 ms/1 ps
module tb;
parameter N=250000;
reg clk;
reg rst;
reg button;
wire led;

click #(N) ck (clk, rst, button, led);

initial begin
	$dumpfile("ck.vcd");
    $dumpvars();
	clk=1'b0;
end

always #0.000004 clk = ~clk;

initial begin
		$display("time=%0t out=%b", $time, clk);
		button=1'b0;
		rst=1'b1;
		#(20);

		button=1'b0;
		rst=1'b0;
		#(20);

		button=1'b1;
		rst=1'b0;
		#(10);

		button=1'b0;
		rst=1'b0;
		#(20);

	#0.002	button=1'b1;
	#0.001	button=1'b0;
	#0.002	button=1'b1;
	#0.003	button=1'b0;
	#0.0001	button=1'b1;
	#0.001	button=1'b0;
	#0.003	button=1'b1;
	#0.002	button=1'b0;
	#0.002	button=1'b1;
	#0.001	button=1'b0;
	#0.002	button=1'b1;
	#0.003	button=1'b0;
	#0.0001	button=1'b1;
	#0.001	button=1'b0;
	#0.003	button=1'b1;
	#0.002	button=1'b0;
	#0.002	button=1'b1;
		#(15);

		button=1'b0;
		rst=1'b0;
		#30;
		$finish;
end

endmodule
