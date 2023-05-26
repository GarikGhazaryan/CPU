module tb();

reg sw1, sw2;
wire ld1, ld2, ld3;


on_off on (sw1, sw2, ld1, ld2, ld3);
initial begin
        $dumpfile("onoff.vcd");
        $dumpvars();
    end
    initial begin

		sw1=1'b0;
		sw2=1'b0;
end
always @(*) begin

		#50
		sw1=1'b1;
		sw2=1'b0;
		#50
		$display("time=%0t ld1=%b ld2=%b ld3=%b", $time, ld1, ld2, ld3);
		sw1=1'b0;
		sw2=1'b0;
		#50
		$display("time=%0t ld1=%b ld2=%b ld3=%b", $time, ld1, ld2, ld3);
		sw1=1'b0;
		sw2=1'b1;
		#50
		$display("time=%0t ld1=%b ld2=%b ld3=%b", $time, ld1, ld2, ld3);
		sw1=1'b0;
		sw2=1'b0;
		#50
		$display("time=%0t ld1=%b ld2=%b ld3=%b", $time, ld1, ld2, ld3);
		sw1=1'b1;
		sw2=1'b1;
		#50
		$display("time=%0t ld1=%b ld2=%b ld3=%b", $time, ld1, ld2, ld3);
		#309;
        $finish;

    end
endmodule
