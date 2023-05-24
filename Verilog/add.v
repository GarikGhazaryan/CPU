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


module add_Nbit #(parameter N=4) (a, b, out, c_out);

	input[N-1:0] a;
	input[N-1:0] b;
	output[N:0] out;
	output [N-1:0] temp_out;
	output c_out;
	
	wire [N:0] c_out_i;
	
	assign c_out_i[0]=1'b0;
	
	genvar i;
	generate
			for(i=0;i<N;i=i+1)begin
				add i_0 (a[i], b[i],c_out_i[i] , temp_out[i], c_out_i[i+1]);
			end
	endgenerate
	
	assign c_out = c_out_i[N];
	assign out={c_out,temp_out};
endmodule
