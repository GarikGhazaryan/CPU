module adr_gen #(parameter ADR_SIZE = 4) (clk, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

input clk, rst_adr, pr_res_adr, enable, up_down;
output reg [ADR_SIZE-1:0] adress;
output reg c_out;

wire a, b;

assign a = (adress=={{ADR_SIZE-1{1'b1}},1'b0} && up_down && enable) ? 1'b1 : 1'b0;
assign b = (adress=={{ADR_SIZE-1{1'b0}},1'b1} && !up_down && enable) ? 1'b1 : 1'b0;

always@(posedge clk)begin
	if(up_down) c_out<=a;
    else c_out<=b;	
end

always@(posedge clk)begin
	if(rst_adr) adress <= {ADR_SIZE{1'b0}};
	else if (pr_res_adr) adress <={ADR_SIZE{1'b1}};
	else if (enable) begin
		if(up_down) adress <= adress+{{ADR_SIZE-1{1'b0}},1'b1};
		else adress <= adress-{{ADR_SIZE-1{1'b0}},1'b1};
	end
end
endmodule
