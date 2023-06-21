module tbcnt();

regmodule tb ();

parameter Adr_size=4;

reg clk, rst, pr_rst, enable, up_down;

reg [3:0] adress;
reg c_out;

Gen gen (.clk(clk), .rst_adr(rst), .pr_res_adr(pr_rst), .enable(enable), .up_down(up_down), .adres(sadress), .c_out(c_out)); 

always #10 clk = ~clk;

initial begin
	clk=1'b0;
	$dumpfile("mem.vcd");
        $dumpvars();
        end

initial begin
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	ud_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	ud_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	ud_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	ud_down=1'b1;
	#20;
	rst=1'b0;
	pr_rst=1'b0;
	enable=1'b0;
	ud_down=1'b1;
	#20;
	$finish

end
