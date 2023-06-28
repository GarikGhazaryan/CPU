module control (clk, rst, start, c_out, error, statu, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit );

input clk, rst, start, c_out, error;
output reg status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit;

parameter standby   = 3'b001;
parameter wr_up     = 3'b010;
parameter read_down = 3'b011;
parameter wr_down   = 3'b100;
parameter read_up   = 3'b101;

reg [2:0] state, next_state;


always@(posedge clk)begin
		if(rst) begin
			done <= 1'b0;
			status <= 1'b0;
		end
		else if(error)begin
			done <= 1'b0;
			status <= 1'b1;
		end 
		else if(state==standby & !error)begin
				done<=1'b1;
				status<=1'b0;
		end
end

always@(posedge clk)begin
	if(rst)
		state <= standby;
	else
		state <= next_state;
end


always@(*) begin
	case(state)
		standby: begin                //001
				if(start)
					next_state = wr_up;
				else 
					next_state = standby;
		end
		wr_up: begin                   //010
				if(c_out)
					next_state = read_down;
				else 
					next_state = wr_up;


		end
		read_down: begin                 //011
				if(c_out)
					next_state = wr_down;
				else 
					next_state = read_down;

		end
		wr_down: begin                   //100
				if(c_out)
					next_state = read_up;
				else 
					next_state=wr_down;

		end
		read_up: begin                   //101
				if(c_out) next_state=standby;
				else 
					next_state=read_up;
				
		end
		default:
				next_state = standby;
	endcase
end

always@(*) begin

	case(state)
		standby: begin                //001
				if(start)begin
					enable=1'b1;
					rst_adr=1'b1;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b0;
					up_down = 1'b0;
					data_bit=1'b0;
				end 
				else begin
					enable=1'b0;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b0;
					up_down = 1'b0;
					data_bit=1'b0;
				end
		end
		wr_up: begin                   //010
				if(c_out)begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b1;
					read_en=1'b0;
					wr_en= 1'b1;
					up_down = 1'b1;
					data_bit=1'b0;
				end 
				else begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b1;
					up_down = 1'b1;
					data_bit=1'b0;
				end

		end
		read_down: begin                 //011
				if(c_out)begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b1;
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b0;
					data_bit=1'b0;
				end 
				else begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b0;
					data_bit=1'b0;
				end

		end
		wr_down: begin                   //100
				if(c_out)begin
					enable=1'b1;
					rst_adr=1'b1;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b1;
					up_down = 1'b0;
					data_bit=1'b1;
				end 
				else begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b1;
					up_down = 1'b0;
					data_bit=1'b1;
				end

		end
		read_up: begin                   //101
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b1;
					data_bit=1'b1;
		end

		default:
				begin
					enable=1'b0;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b0;
					wr_en= 1'b0;
					up_down = 1'b0;
					data_bit=1'b0;
				end
	endcase
end

endmodule
