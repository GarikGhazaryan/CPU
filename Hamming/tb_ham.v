module tb();

reg clk, rst, en;

wire [10:0] true_dat;

Ham H (clk, rst, en, true_dat);

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
        #1000;
        $finish;

end
endmodule

