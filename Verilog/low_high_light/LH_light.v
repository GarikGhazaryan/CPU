module light (clk, rst, out);

input clk,rst;
output reg out;
reg [23:0] count_t1;
reg [23:0] count_t2;
reg [23:0] count_chng;
reg [23:0] count_chng2;
reg [23:0] ch_up;
reg [23:0] ch_down;

always@(posedge clk)begin

		if(rst)begin
			   	count_t1 <= 24'b0;
			   	count_t2 <= 24'b0;
				out<=1'b0;
		end
		else begin
			if(count_t2== ch_up) begin
				count_t1<=24'b0;
				out<=~out;
			end	
			if(count_t1== ch_down) begin
				count_t2<=24'b0;
				out<=~out;
			end
			if(out)count_t2<=(count_t2+{{23{1'b0}}, 1'b1});
			else count_t1<=(count_t1+{{23{1'b0}}, 1'b1});
		end
end

always@(posedge clk)begin
			ch_up<=24'd1+count_chng;
			ch_down<=24'd30000-count_chng; //change full size
	end

always@(posedge clk)begin
		if(rst)	begin
				count_chng = 24'd0;
				count_chng2= 24'd0;
		end
		else if(count_chng2==24'd500) begin    
				count_chng<=count_chng+24'd10;  //change speed
				count_chng2<=24'd0;
		end
		else count_chng2=count_chng2+24'd1;
end
endmodule
