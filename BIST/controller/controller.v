module control (clk, rst, start, c_out, status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit );

input clk, rst, start, c_out;
output reg status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit;

localparam standby   = 3'b001;
localparam wr_up     = 3'b010;
localparam read_down = 3'b011;
localparam wr_down   = 3'b100;
localparam read_up   = 3'b101;

reg [2:0] state, next_state;

always@(posedge clk)begin
	if(rst)
		state <= standby;
	else
		state <= next_state;
end


always@(*) begin
	case(state)
		standby: begin                //001
				if(start)begin
					next_state = wr_up;
				end 
				else begin
					next_state = standby;
				end 
		end
		wr_up: begin                   //010
				if(c_out)begin
					next_state = read_down;
				end 
				else begin
					next_state = wr_up;
				end


		end
		read_down: begin                 //011
				if(c_out)begin
					next_state = wr_down;
				end 
				else begin
					next_state = read_down;
				end

		end
		wr_down: begin                   //100
				if(c_out)begin
					next_state = read_up;
				end 
				else begin
					next_state=wr_down;
				end

		end
		read_up: begin                   //101
				if(c_out)begin
					next_state=standby;
				end 
				else begin
					next_state=read_up;
				end

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
					wr_en= 1'b1;
					up_down = 1'b1;
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
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b0;
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
					read_en=1'b0;
					wr_en= 1'b1;
					up_down = 1'b0;
					data_bit=1'b1;
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
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b1;
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
				begin
					enable=1'b1;
					rst_adr=1'b0;
					pr_res_adr=1'b0;
					read_en=1'b1;
					wr_en= 1'b0;
					up_down = 1'b1;
					data_bit=1'b1;
				end

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
