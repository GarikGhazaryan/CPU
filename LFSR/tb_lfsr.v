module tb();

reg clk, rst, en;
wire [3:0] lfsr_out;

lfsr lf (clk, rst, en, lfsr_out);

initial begin
        clk=1'b0;
        $dumpfile("gtk.vcd");
        $dumpvars();
end

always #1 clk=~clk;

initial begin
	rst=1'b0;
	#9;
	rst=1'b1;
	#3;
	rst=1'b0;
	#3;
	en=1'b1;
	#3;
	en=1'b0;
	#100;
        $finish;

end
endmodule

