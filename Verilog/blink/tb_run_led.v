`timescale 1 ms/1 ps
module tb;

reg clk;
reg rst;
wire led1;
wire led2;
wire led3;
wire led4;

initial begin
    $dumpfile("ck.vcd");
    $dumpvars();
    clk=1'b0;
end

always #0.000004 clk = ~clk;

run_led rl (clk, rst, led1, led2, led3, led4);

initial begin
        rst=1'b1;
        #(2);

        rst=1'b0;
        #40;
        $finish;
end     
endmodule

