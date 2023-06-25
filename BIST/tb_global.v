module glob();

reg clk, rst, start;

wire status, done;



control bist (clk, rst, start, status, done);


always #1 clk = ~clk;
initial begin
    clk=1'b0;
    $dumpfile("mem.vcd");
    $dumpvars();
    end

initial begin
	rst=1'b0;
	start=1'b0;
	#200;
	rst=1'b1;
	start=1'b0;
	#20;
	rst=1'b0;
	start=1'b0;
	#200;
	rst=1'b0;
	start=1'b1;
	#21;
	rst=1'b0;
	start=1'b0;
	#2000;
	$finish;

end
endmodule
