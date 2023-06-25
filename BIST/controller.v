module control (clk, rst, start, status, done);
parameter Dta_size=8;
parameter Adr_size=4;
input clk, rst, start, status, done;

wire c_out;
wire [Adr_size-1 : 0] adress;
wire [Dta_size-1 : 0] data;
wire [Dta_size-1 : 0] data_et;
wire [Dta_size-1 : 0] data_read;
reg enable, rst_adr, pr_res_adr, read_en, wr_en, up_down, data_bit;

localparam standby   = 3'b001;
localparam wr_up     = 3'b010;
localparam read_down = 3'b011;
localparam wr_down   = 3'b100;
localparam read_up   = 3'b101;

reg [2:0] state, next_state;

mem mm (clk, adress, data, wr_en, read_en);

adr_gen adrg (clk, rst, rst_adr, pr_res_adr, enable, up_down, adress, c_out);

comparator comp (.data_et(data_et), .data_read(data), .read_en(read_en), .error(error));

dat_gen datg (data_bit, wr_en, data, data_et);

always@(posedge clk) begin
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
		else
		case (state)
				standby: if(start | c_out) next_state<=wr_up;

				wr_up: if(c_out) next_state<=read_down;

				read_down: if(c_out) next_state<=wr_down;

				wr_down: if(c_out) next_state<=read_up;

				read_up: if(c_out) next_state<=standby;
		endcase
end
always@(posedge clk)begin
		state<=next_state;
end

always@(*) begin

		case(state)
				standby: begin
							enable<=1'b0;
							rst_adr<=1'b0;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b0;
							up_down <= 1'b0;
							data_bit<=1'b0;
				end
				wr_up: begin
							enable<=1'b1;
							rst_adr<=1'b1;
							pr_res_adr<=1'b0;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b1;
							data_bit<=1'b0;


				end
				read_down: begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b1;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b0;
							data_bit<=1'b0;

				end
				wr_down: begin
							enable<=1'b1;
							rst_adr<=1'b0;
							pr_res_adr<=1'b1;
							read_en<=1'b0;
							wr_en<= 1'b1;
							up_down <= 1'b0;
							data_bit<=1'b1;

				end
				read_up: begin
							enable<=1'b1;
							rst_adr<=1'b1;
							pr_res_adr<=1'b0;
							read_en<=1'b1;
							wr_en<= 1'b0;
							up_down <= 1'b1;
							data_bit<=1'b1;

				end
				default:
						state <= standby;
		endcase
end

endmodule
