module flash(sw, ld, clk, rst);

input sw, clk, rst;
output reg ld;

reg [18:0] inbuf;
wire [18:0] inbuf_nxt;
wire swbuf;

assign swbuf=&inbuf;

assign inbuf_nxt=swbuf ? 19'd0 : {inbuf[18:0], sw};

reg swbuf_r;

always@(posedge clk)begin
		if(rst) inbuf <=19'd0;
		else inbuf <=inbuf_nxt;
end

always@(posedge clk)begin

	$display("time=%0t inbuf=%b", $time, inbuf);

	if(rst) swbuf_r <=1'b0;
	else swbuf_r<= swbuf;
end

always@(posedge clk)begin

		if(rst) ld<=1'b0;
		if(swbuf) ld<=~ld;
end
endmodule
