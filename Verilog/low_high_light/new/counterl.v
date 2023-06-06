module Counter_low #(parameter M=10, parameter N=10)(clk, rst, count);

input clk, rst;
output reg [31:0] count;
reg [31:0] t_count;
reg level;
always @(posedge clk) begin
		if (rst) begin 
				count <= 32'b0;
            	t_count <= 32'b0;
		end
    	else
    	   	if(t_count==M)begin
            		t_count <= 32'b0;
					if(level) count <= count + {{31{1'b0}}, 1'b1};
					else  count <= count - {{31{1'b0}}, 1'b1};
        	end
       		else begin
            	t_count <= t_count + {{31{1'b0}}, 1'b1};
        end
end

always @(*) begin
		if(count==N) level<=1'b0;
		else if (count==32'b0) level<=1'b1;
		else level<=level;
end
endmodule

