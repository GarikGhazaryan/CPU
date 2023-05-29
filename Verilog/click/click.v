module click #(parameter N=2) (clk, rst, button, led);
parameter M=N;
input clk;
input rst;
input button;
output reg led;
reg dff_1;
reg dff_2;
wire change;
wire button_out;
assign change = dff_1 & ~dff_2;

debounce #(M) debounce_i (.clk(clk),
                        .rst(rst),
                        .button(button),
                        .button_out(button_out)
);

// DFF_1
always @(posedge clk) begin
    if (rst) dff_1 <= 1'b0;
    else     dff_1 <= button_out;
end

// DFF_2
always @(posedge clk) begin
    if (rst) dff_2 <= 1'b0;
    else     dff_2 <= dff_1;
end

// LED
always @(posedge clk) begin
    if (rst)         led <= 1'b0;
    else if (change) led <= ~led;
end

endmodule
