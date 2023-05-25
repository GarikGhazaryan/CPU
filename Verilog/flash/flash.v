module flash(sw, ld, clk, rst);

input sw, clk, rst;
output reg ld;
wire [4:0] inbuf;
assign inbuf={inbuf[4:0], sw};
reg swbuf;
always@(posedge clk)begin

	$display("time=%0t inbuf=%b", $time, inbuf);

	if(&inbuf) swbuf<=1'b1;
	else if(~|inbuf) swbuf<=1'b0;
end

always@(posedge clk)begin

		if(rst) ld<=1'b0;
		if(swbuf) ld<=~ld;
end
endmodule
