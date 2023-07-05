module tb();

reg [3:0] data_in;
wire [6:0] data_h_out;

encod en(data_in, data_h_out);


initial begin
	$dumpfile("gtk.vcd");
	$dumpvars();
end

initial begin
	data_in=4'b0101;
	#28;
	$display("in=%b", data_in);
	$display("out=%b", data_h_out);
	#208;
	data_in=4'b1101;
	#208;
	$display("in=%b", data_in);
	$display("out=%b", data_h_out);
	#208;
	data_in=4'b1111;
	#208;
	$display("in=%b", data_in);
	$display("out=%b", data_h_out);
	#208;
	$finish;
end
endmodule
