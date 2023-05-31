`timescale 1 ms/1 ps
module tb;

reg clk;
reg rst;
reg up;
reg down;
wire out1;
wire out2;
wire out3;
wire out4;
wire out5;
wire out6;
wire out7;

initial begin
    $dumpfile("ck.vcd");
    $dumpvars();
    clk=1'b0;
end

always #0.000004 clk = ~clk;

control ctrl (clk, rst, up, down, out1, out2, out3, out4, out5, out6, out7);

initial begin
		up=1'b0;
		down=1'b0;
        rst=1'b1;
        #(2);

		up=1'b1;
		down=1'b0;
        rst=1'b0;
        #3;
		up=1'b0;
		down=1'b0;
        #3;
		up=1'b1;
		down=1'b0;
        #3;
		up=1'b0;
		down=1'b0;
        #3;
		up=1'b1;
		down=1'b0;
        #3;
		up=1'b0;
		down=1'b1;
        #3;
        $finish;
end
endmodule
