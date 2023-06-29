module glob();

reg clk, rst, start;
wire status, done;
parameter ADR_SIZE = 4;
parameter DATA_SIZE = 8; 

Bist #(.ADR_SIZE(ADR_SIZE), .DATA_SIZE(DATA_SIZE)) bist (clk, rst, start, status, done);
always #1 clk = ~clk;
initial begin
	clk=1'b0;
	$dumpfile("gtk.vcd");
	$dumpvars();
end

initial begin
	rst=1'b1;
	start=1'b0;
	#20;
	rst=1'b0;
	start=1'b0;
	#20;
	rst=1'b0;
	start=1'b1;
	#5;
	rst=1'b0;
	start=1'b0;
	#10;
	force bist.datg.data= {DATA_SIZE{1'b1}};
	#4;
	release bist.datg.data;
	#208;
	$finish;
end
endmodule
