module tb ();

parameter Adr_size=4;
parameter Dta_size=8;
reg clk;
reg wr_en;
reg read_en;

wire [7:0] data;
reg [3:0] adress;

Ram t (.clk(clk), .adress(adress), .data(data), .wr_en(wr_en), .read_en(read_en));

always #10 clk = ~clk;

	initial begin
		$dumpfile("mem.vcd");
		$dumpvars();
	end

assign data= !read_en & wr_en ? 8'b00010000 : {Dta_size{1'bz}};

initial begin
	clk =1'b0;
	read_en=1'b0;
	wr_en=1'b1;
	adress=4'b0001;
	#23
	$display("time=%0t out=%b", $time,data);


	#30;
	read_en=1'b1;
	wr_en=1'b0;
	adress=4'b0001;
	#23
	$display("time=%0t out=%b", $time,data);
	#30;
	read_en=1'b0;
	wr_en=1'b0;
	adress=4'b0001;
	#23
	$display("time=%0t out=%b", $time,data);
	#30;
	read_en=1'b1;
	wr_en=1'b1;
	adress=4'b0001;
	#23

	$display("time=%0t out=%b", $time,data);
	#23
	$finish;
	end
endmodule
