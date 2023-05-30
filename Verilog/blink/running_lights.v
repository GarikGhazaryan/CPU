module run_led(clk, rst, led1, led2, led3, led4);

input clk, rst;
output reg led1, led2, led3, led4;


reg [2:0] state;

reg[2:0] state_next;

localparam [1:0]

    state_1 = 2'b00,
    state_2 = 2'b01, 
    state_3 = 2'b10,
    state_4 = 2'b11;

timer #(.WIDTH(32)) cnt

	   	(	.clk(clk),
   			.rst(rst),
    		.limit(500_000),
    		.pulse_out(pulse_out)
		);

always@(*)
begin
		if(rst) state=2'b00;
		else begin
		case (state)
		state_1:
				begin	if(pulse_out) state_next=2'b01;
					 else state_next=2'b00;
			 end

		state_2:
				begin	if(pulse_out) state_next=2'b10;
					 else state_next=2'b01;
			 end
		state_3: 
				begin	if(pulse_out) state_next=2'b11;
					 else state_next=2'b10;
			 end

		state_4: 
				begin if(pulse_out) state_next=2'b00;
					 else state_next=2'b11;
			 end
	 			endcase
		end
end

always@(posedge clk)
begin
		state <= state_next;
end

always@(posedge clk )begin
		if(rst)begin
			   	led1<=1'b0;
			   	led2<=1'b0;
			   	led3<=1'b0;
			   	led4<=1'b0;
		end
		else if(pulse_out) begin
				case (state)

				state_1: led1<=~led1;
             
        		state_2: led2<=~led2;
        	 
      			state_3: led3<=~led3;
        	 
       			state_4: led4<=~led4;
				endcase
		end
	end
endmodule
