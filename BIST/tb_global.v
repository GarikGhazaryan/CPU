module glob();

reg clk, rst, start;

wire status, done;



Bist bist (clk, rst, start, status, done);


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
	#208;
	$finish;

end
endmodule
