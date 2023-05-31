module timer (clk, rst, limit, pulse_out);
parameter WIDTH = 25;

input clk;
input rst;
input [WIDTH-1:0] limit;
output pulse_out;

reg [WIDTH-1:0] counter;
wire [WIDTH-1:0] counter_nxt;

assign counter_nxt = (counter != limit) ? counter + {{WIDTH-1{1'b0}}, 1'b1} : {WIDTH{1'b0}};
assign pulse_out = (counter == limit);

always @(posedge clk) begin
    if (rst) counter <= {WIDTH{1'b0}};
    else     counter <= counter_nxt;
end
endmodule
