module add(a, b, c_in, out, c_out);

input a;
input b;
input c_in;
output out;
output c_out;
wire d;
wire e;
wire f;

assign d= a ^ b;
assign e= a | b;
assign f= d | c_in;
assign out = d ^ c_in;
assign c_out = f ^ e;
endmodule


module add_4bit(a, b, out, c_out);

input[3:0] a;
input[3:0] b;
output[4:0] out;
output c_out;

wire c_out_0;
wire c_out_1;
wire c_out_2;
wire c_out_3;

add i_0 (a[0], b[0], 1'b0, out[0], c_out_0);

add i_1 (a[1], b[1], c_out_0, out[1], c_out_1);

add i_2 (a[2], b[2], c_out_1, out[2], c_out_2);

add i_3 (a[3], b[3], c_out_2, out[2], c_out_3);

assign out = {c_out_3, out[3], out[2], out[1], out[0]};
endmodule
