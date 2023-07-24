module lfsr (clk, rst, en, lfsr_out);

input clk, rst, en;
output [10:0] lfsr_out;
wire shift; 
reg [10:0] tmp;


assign shift = tmp[0] ^ tmp[2] ^ tmp[3] ^ tmp[5];
assign lfsr_out = {shift, tmp[9:0]};

always@(posedge clk)begin
	if(rst) tmp<=11'b0;
	else if(en) tmp <= {11'b10000000001};
	else tmp<=lfsr_out>>1;
end
endmodule
