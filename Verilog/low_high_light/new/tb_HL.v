`timescale 1 ms/1 ps
module tb;

//parameter N=500;
reg clk;
reg rst;

wire led;

LowHigh lh (clk, rst, led);
//Counter #(N) cnt (clk, rst, out);

initial begin
    $dumpfile("ck.vcd");
    $dumpvars();
    clk=1'b0;
end

always # 0.000004 clk = ~clk;


initial begin
        rst=1'b1;
        #1;
        rst=1'b0;
        #30;
        $finish;
end
endmodule

