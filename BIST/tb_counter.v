module tbcnt();
parameter Adr_size=8;

reg clk, rst, pr_rst, enable, up_down;

wire [Adr_size-1:0] adress;
wire c_out;

Gen gen (.clk(clk), .rst_adr(rst), .pr_res_adr(pr_rst), .enable(enable), .up_down(up_down), .adress(adress), .c_out(c_out)); 

always #1 clk = ~clk;
initial begin
	clk=1'b0;
	$dumpfile("mem.vcd");
    $dumpvars();
    end

initial begin
	rst=1'b1;
	pr_rst=1'b0;
	enable=1'b0;
	up_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	up_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b1;
	up_down=1'b1;
	#990;
	rst=1'b0;
	pr_rst=1'b1;
	#5;
	pr_rst=1'b0;
	enable=1'b1;
	up_down=1'b0;
	#990;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	up_down=1'b0;
	#200;
	$finish;

	end
endmodule
