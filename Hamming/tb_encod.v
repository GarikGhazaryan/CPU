module tb();

reg [3:0] in_dat;
wire [6:0] true_dat; 

Ham H (in_dat, true_dat);

initial begin
	$dumpfile("gtk.vcd");
	$dumpvars();
end

initial begin
	in_dat=4'b0101;
	#28;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#208;
	in_dat=4'b1101;
	#208;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#208;
	in_dat=4'b1111;
	#208;
	$display("in=%b", in_dat);
	$display("true=%b", true_dat);
	#208;
	$finish;
end
endmodule
