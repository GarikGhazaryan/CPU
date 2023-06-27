module adr_gen (clk, rst, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

parameter Adr_size=4;

input clk, rst, rst_adr, pr_res_adr, enable, up_down;
output reg [Adr_size-1:0] adress;
output reg c_out;

wire a, b;
assign a = (adress=={{Adr_size-1{1'b1}},1'b0} && up_down) ? 1'b1 : 1'b0;
assign b = (adress=={{Adr_size-1{1'b0}},1'b1} && !up_down) ? 1'b1 : 1'b0;
always@(posedge clk)begin
		if(up_down) c_out<=a;
	    else c_out<=b;	
end

always@(posedge clk)begin
		if(rst) begin
				adress<={Adr_size{1'b0}};
				c_out<=1'b0;
		end
		else if(rst_adr) adress <= {Adr_size{1'b0}};
		else if (pr_res_adr) adress <={Adr_size{1'b1}};
		else if (enable) begin
				if(up_down) adress <= adress+{{Adr_size-1{1'b0}},1'b1};
				else adress <= adress-{{Adr_size-1{1'b0}},1'b1};
	end
end
endmodule
