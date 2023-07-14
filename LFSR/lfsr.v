module lfsr (clk, rst, en, lfsr_out);

input clk, rst, en;
output [3:0] lfsr_out;
wire shift; 
reg [3:0] tmp;


assign shift = tmp[0] ^ tmp[1];
assign lfsr_out = {shift, tmp[2:0]};

always@(posedge clk)begin
	if(rst) tmp<=4'b0;
	else if(en) tmp <= {4'b1111};
	else tmp<=lfsr_out>>1;
end
endmodule
