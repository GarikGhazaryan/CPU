`timescale 1 ms/1 ps
module tb;

reg clk;
reg rst;
wire out;

light h_l (clk, rst, out);

initial begin
    $dumpfile("ck.vcd");
    $dumpvars();
    clk=1'b0;
end

always #0.000004 clk = ~clk;


initial begin
		rst=1'b1;
        #0.01;
		rst=1'b0;
        #30;
        $finish;
end
endmodule
