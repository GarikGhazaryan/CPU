module Gen (clk, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

parameter Adr_size=4;

input clk, rst_adr, pr_res_adr, enable, up_down;
output [Adr_size-1:0] adress;
output c_out;

assign c_out=({adress=={Adr_sizei-1{1'b1}},1'b0} & up_down) ? 1'b1 : 1'b0;
assign c_out=({adress=={Adr_sizei-1{1'b0}},1'b1} & !up_down) ? 1'b1 : 1'b0;



always@(posedge clk)begin
	if(rst_adr) adress <= {Adr_size{1'b0}};
	else if (pr_res_adr) adress <={Adr_size{1'b1}};
	else if	(enable & up_down)begin
		adress <= adress+{{Adr_size-1{1'b0}},1'b1};
	end
	else if	(enable & !up_down) begin 
		adress <= adress-{{Adr_size-1{1'b0}},1'b1};
	end

end
endmodule
