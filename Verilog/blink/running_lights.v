module run_led(clk, rst, pulse_out, led1, led2, led3, led4);

input clk, rst, pulse_out;
output reg led1, led2, led3, led4;


reg [2:0] state;

reg[2:0] state_next;

timer #(.WIDTH(25)
		) cnt (
    		.clk(clk),
   			.rst(rst),
    		.limit(250_000),
    		.pulse_out(pulse_out)
		);

always@(*)
begin
		if(rst) state=2'b00;
		else begin
				case (state)
				2'b00:
				begin	if(pulse_out) state_next=2'b01;
					 else state_next=2'b00;
			 end

				2'b01:
				begin	if(pulse_out) state_next=2'b10;
					 else state_next=2'b01;
			 end
				2'b10: 
				begin	if(pulse_out) state_next=2'b11;
					 else state_next=2'b10;
			 end

				2'b11: 
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

					2'b00: led1<=~led1;
             
        			2'b01: led2<=~led2;
        	 
        			2'b10: led3<=~led3;
        	 
       				2'b11: led4<=~led4;
				endcase
		end
	end
endmodule
