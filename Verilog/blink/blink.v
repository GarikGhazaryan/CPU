module blink (clk, rst, led);

input clk;
input rst;
output reg led;

wire pulse_out;

timer #(
    .WIDTH(25)
) cnt_i (
    .clk(clk),
    .rst(rst),
    .limit(250_0),
    .pulse_out(pulse_out)
);

always @(posedge clk) begin
    if (rst) led <= 1'b0;
    else if (pulse_out) led <= ~led;
end
endmodule

