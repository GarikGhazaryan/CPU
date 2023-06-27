module tbcomp();
parameter Dta_size =8;
reg [Dta_size-1:0] data_et, data_read;
reg read_en;
wire error;


comparator tb (data_et, data_read, read_en, error);

initial begin
        $dumpfile("mem.vcd");
        $dumpvars();
    end
initial begin
		read_en=1'b0;
		data_et=8'b00000000;
		data_read=8'b00000000;
		#10;
		data_et=8'b11111111;
		data_read=8'b11111111;
		#10;
		data_et=8'b00010000;
		data_read=8'b00010000;
		#10;
		data_et=8'b01111111;
		data_read=8'b01111111;
		#10;
		data_et=8'b00001000;
		data_read=8'b00000000;
		#10;

		read_en=1'b1;
		data_et=8'b00000000;
		data_read=8'b00000000;
		#10;
		data_et=8'b11111111;
		data_read=8'b11111111;
		#10;
		data_et=8'b00010000;
		data_read=8'b00010000;
		#10;
		data_et=8'b01111111;
		data_read=8'b01111111;
		#10;
		data_et=8'b00001000;
		data_read=8'b00000000;
		#10;
		$finish;
end
endmodule
