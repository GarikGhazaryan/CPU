module control (clk, rst, start, c_out, error, status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit );

input clk, rst, start, c_out, error;
output reg status, done, wr_en, read_en, rst_adr, pr_res_adr, enable, up_down, data_bit;

parameter STANDBY   = 3'b001;
parameter WR_UP     = 3'b010;
parameter READ_DOWN = 3'b011;
parameter WR_DOWN   = 3'b100;
parameter READ_UP   = 3'b101;

reg [2:0] state, next_state;


always@(posedge clk)begin
	if(rst)	status <= 1'b0;
	else if(error) status <= 1'b1;
end

always@(posedge clk)begin
	if(rst)
		state <= STANDBY;
	else
		state <= next_state;
end


always@(*) begin
	case(state)
		STANDBY: begin        
			if(start)
				next_state = WR_UP;
			else 
				next_state = STANDBY;
		end
		WR_UP: begin           
			if(c_out)
				next_state = READ_DOWN;
			else 
				next_state = WR_UP;


		end
		READ_DOWN: begin        
			if(c_out)
				next_state = WR_DOWN;
			else 
				next_state = READ_DOWN;

		end
		WR_DOWN: begin           
			if(c_out)
				next_state = READ_UP;
			else 
				next_state = WR_DOWN;

		end
		READ_UP: begin            
			if(c_out) 
				next_state = STANDBY;
			else
				next_state = READ_UP;
		end
		default:
				next_state = STANDBY;
	endcase
end

always@(*) begin
	case(state)
		STANDBY: begin                
			if(start)begin
				enable = 1'b1;
				rst_adr = 1'b1;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b0;
				up_down = 1'b1;
				data_bit = 1'b0;
				done = 1'b0;
			end 
			else begin
				enable = 1'b0;
				rst_adr = 1'b1;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b0;
				up_down = 1'b0;
				data_bit = 1'b0;
				done = 1'b1;
			end
		end
		WR_UP: begin                  
			if(c_out)begin
				enable = 1'b1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b1;
				read_en = 1'b0;
				wr_en = 1'b1;
				up_down = 1'b1;
				data_bit = 1'b0;
				done = 1'b0;
			end 
			else begin
				enable = 1'b1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b1;
				up_down = 1'b1;
				data_bit = 1'b0;
				done = 1'b0;
			end

		end
		READ_DOWN: begin             
			if(c_out)begin
				enable = 1'b1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b1;
				read_en = 1'b1;
				wr_en = 1'b0;
				up_down = 1'b0;
				data_bit = 1'b0;
				done = 1'b0;
			end 
			else begin
				enable = 1'b 1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b0;
				read_en = 1'b1;
				wr_en = 1'b0;
				up_down = 1'b0;
				data_bit = 1'b0;
				done = 1'b0;
			end
		end
		WR_DOWN: begin              
			if(c_out)begin
				enable = 1'b1;
				rst_adr = 1'b1;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b1;
				up_down = 1'b0;
				data_bit =1'b1;
				done = 1'b0;
			end 
			else begin
				enable = 1'b1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b1;
				up_down = 1'b0;
				data_bit = 1'b1;
				done = 1'b0;
			end
		end
		READ_UP: begin             
				enable = 1'b1;
				rst_adr = 1'b0;
				pr_res_adr = 1'b0;
				read_en = 1'b1;
				wr_en = 1'b0;
				up_down = 1'b1;
				data_bit = 1'b1;
				done = 1'b0;
		end
		default:
			begin
				enable = 1'b0;
				rst_adr = 1'b0;
				pr_res_adr = 1'b0;
				read_en = 1'b0;
				wr_en = 1'b0;
				up_down = 1'b0;
				data_bit = 1'b0;
				done = 1'b1;
			end
	endcase
end
endmodule
