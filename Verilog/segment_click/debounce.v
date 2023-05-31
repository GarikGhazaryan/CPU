module debounce (clk, rst, button, change);
input clk;
input rst;
input button;
output change;
wire button_out;

reg  [17:0] counter;
wire [17:0] counter_nxt;
wire full;
reg dff_1;
reg dff_2;

assign change = dff_1 & ~dff_2;
assign full = (counter == 18'd250000);
assign counter_nxt = (button) ? (~full ? counter + {{17{1'b0}}, 1'b1} : (18'd250000)) : {18{1'b0}};
assign button_out = full;

always @(posedge clk) begin
    if (rst) counter <= {18{1'b0}};
    else     counter <= counter_nxt;
end

always @(posedge clk) begin
    if (rst) dff_1 <= 1'b0;
    else     dff_1 <= button_out;
end

always @(posedge clk) begin
    if (rst) dff_2 <= 1'b0;
    else     dff_2 <= dff_1;
end

endmodule
