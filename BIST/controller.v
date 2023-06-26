module control (clk, rst, start, status, done);

localparam standby   = 3'b001;
localparam wr_up     = 3'b010;
localparam read_down = 3'b011;
localparam wr_down   = 3'b100;
localparam read_up   = 3'b101;

reg [2:0] state, next_state;

always@(posedge clk) begin
		case (state)
				standby: if(start | c_out) next_state<=wr_up;

				wr_up: if(c_out) next_state<=read_down;

				read_down: if(c_out) next_state<=wr_down;

				wr_down: if(c_out) next_state<=read_up;

				read_up: if(c_out) next_state<=standby;
		endcase
end
always@(*)begin
		if(rst) begin
				state<=standby;
				next_state<=standby;
				wr_en<=1'b0;
				read_en<=1'b0;
				rst_adr<=1'b0;
			   	pr_res_adr<=1'b0;
				enable<=1'b0;
				up_down<=1'b0;
				data_bit<=1'b0;
		end
		else begin
		state<=next_state;
		end
end

always@(*) begin

		case(state)
				standby: begin
						if(start)begin
							enable<=1'b1;
							rst_adr<=1'b1;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b1;
							data_bit<=1'b0;
							next_state=wr_up;
						end 
						else begin
							enable<=1'b0;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b0;
							up_down <= 1'b0;
							data_bit<=1'b0;
						end
				end
				wr_up: begin
						if(c_out)begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b1;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b0;
							data_bit<=1'b0;
							next_state=read_down;
						end 
						else begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b1;
							data_bit<=1'b0;
						end


				end
				read_down: begin
						if(c_out)begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b1;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b0;
							data_bit<=1'b1;
							next_state=wr_down;
						end 
						else begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b0;
							data_bit<=1'b0;
						end

				end
				wr_down: begin
						if(c_out)begin
							enable<=1'b1;
							rst_adr<=1'b1;
							pr_res_adr<=1'b0;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b1;
							data_bit<=1'b1;
							next_state=read_up;
						end 
						else begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b0;
							data_bit<=1'b1;
						end

				end
				read_up: begin
						if(c_out)begin
							next_state=standby;
						end 
						else begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b1;
							data_bit<=1'b1;
						end

				end
				default:
						state <= standby;
		endcase
end

endmodule
