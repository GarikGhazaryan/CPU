module tb();

reg [3:0] in_dat;
wire [6:0] true_dat; 

Ham H (in_dat, true_dat);

initial begin
	$dumpfile("gtk.vcd");
	$dumpvars();
end

initial begin
	in_dat=11'b11110001111;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#20;
	in_dat=11'b0000001111 ;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#20;
	in_dat=11'b11111100000;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#20;
	in_dat=11'b10101000001;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#20;
	in_dat=11'b10101010101;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#20;
	in_dat=11'b10111110101;
	#20;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#208;
	$finish;
end
endmodule
