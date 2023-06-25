module adr_gen (clk, rst, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

parameter Adr_size=4;

input clk, rst, rst_adr, pr_res_adr, enable, up_down;
output reg [Adr_size-1:0] adress;
output reg c_out;

wire a, b, change1, change2;
reg dff_rst1;
reg dff_rst2;
reg dff_prrst1;
reg dff_prrst2;

assign change1 =  rst_adr & ~dff_rst1;
assign change2 =  pr_res_adr & ~dff_prrst1;

assign a = (adress=={{Adr_size-1{1'b1}},1'b0} && up_down) ? 1'b1 : 1'b0;
assign b = (adress=={{Adr_size-1{1'b0}},1'b1} && !up_down) ? 1'b1 : 1'b0;

always@(*)begin
		if(up_down) c_out<=a;
	    else c_out<=b;	
end

always@(*)begin
		if(change1) adress <= {Adr_size-1{1'b0}};
        else if (change2) adress <={Adr_size{1'b1}};
end

always@(posedge clk)begin
		if(rst) begin
				adress<={Adr_size{1'b0}};
				c_out<=1'b0;
		end
		//else if(change1) adress <= {Adr_size{1'b0}};
		//else if (change2) adress <={Adr_size{1'b1}};
		else if (enable) begin
				if(up_down) adress <= adress+{{Adr_size-1{1'b0}},1'b1};
				else adress <= adress-{{Adr_size-1{1'b0}},1'b1};
	end
end

always @(posedge clk) begin
		if (rst) dff_rst1 <= 1'b0;
        else dff_rst1 <= rst_adr;
end

//always @(posedge clk) begin
  //  	if (rst) dff_rst2 <= 1'b0;
   	//	else dff_rst2 <= dff_rst1;
//end


always @(posedge clk) begin
		if (rst) dff_prrst1 <= 1'b0;
    	else dff_prrst1 <= pr_res_adr;
end

//always @(posedge clk) begin
  //	if (rst) dff_prrst2 <= 1'b0;
   	//	else dff_prrst2 <= dff_prrst1;
//end


endmodule
