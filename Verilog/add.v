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
assign e= a & b;
assign f= d & c_in;
assign out = d ^ c_in;
assign c_out = f ^ e;
endmodule


module add_4bit(a, b, out, c_out);

input[7:0] a;
input[7:0] b;
output[8:0] out;
output [7:0] temp_out;
output c_out;

wire c_out_0;
wire c_out_1;
wire c_out_2;
wire c_out_3;

add i_0 (a[0], b[0], 1'b0, temp_out[0], c_out_0);

add i_1 (a[1], b[1], c_out_0, temp_out[1], c_out_1);

add i_2 (a[2], b[2], c_out_1, temp_out[2], c_out_2);

add i_3 (a[3], b[3], c_out_2, temp_out[3], c_out_3);

add i_4 (a[4], b[4], c_out_3, temp_out[4], c_out_4);

add i_5 (a[5], b[5], c_out_4, temp_out[5], c_out_5);

add i_6 (a[6], b[6], c_out_5, temp_out[6], c_out_6);

add i_7 (a[7], b[7], c_out_6, temp_out[7], c_out_7);

assign c_out = c_out_7;
assign out={c_out,temp_out};
endmodule
