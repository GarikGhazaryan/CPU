module tbctr ();

reg clk, rst, start, c_out;

wire status, done;



//control bist (clk, rst, start, status, done);
control ctrl (clk, rst, start, c_out, status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit );

always #1 clk = ~clk;
initial begin
    clk=1'b0;
    $dumpfile("mem.vcd");
    $dumpvars();
    end

initial begin
	rst=1'b0;
	start=1'b0;
	c_out=1'b0;
	#20;
	rst=1'b1;
	start=1'b0;
	c_out=1'b0;
	#2;
	rst=1'b0;
	start=1'b0;
	c_out=1'b0;
	#200;
	rst=1'b0;
	start=1'b1;
	c_out=1'b0;
	#1;
	start=1'b0;
	#210;
	rst=1'b0;
	start=1'b0;
	c_out=1'b1;
	#1
	c_out=1'b0;
	#210;
	rst=1'b0;
	start=1'b0;
	c_out=1'b1;
	#1
	c_out=1'b0;
	#210;
	rst=1'b0;
	start=1'b0;
	c_out=1'b1;
	#1
	c_out=1'b0;
	#210;
	rst=1'b0;
	start=1'b0;
	c_out=1'b1;
	#1
	c_out=1'b0;
	#210;
	rst=1'b0;
	start=1'b0;
	c_out=1'b1;
	#1
	c_out=1'b0;
	#20;
	$finish;

end
endmodule
