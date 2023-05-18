`timescale 1 ns/1 ps
module test;

reg [3:0] datain1, datain2, op_mode;
wire [7:0] out;

alu t( datain1, datain2, op_mode, out);

initial 
begin
	$dumpfile("alu.vcd");
	$dumpvars();
end

initial 
begin 
	datain1  = 4'b0;
	datain2  = 4'b0;
	op_mode = 4'b1111;
        $display ("time=%0t op=%b datai_n1=%b data_in2=%b output0=%b ", $time, op_mode, datain1, datain2, out);
end

always @(*) 
begin 
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_mode  = 4'b0011;
	#100;
        $display ("time=%0t op=%d datai_n1=%d data_in2=%d output1=%d ", $time, op_mode, datain1, datain2, out);
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_mode  = 4'b0100;
	#200
        $display ("time=%0t op=%d data_in1=%d data_in2=%d output2=%d ", $time, op_mode, datain1, datain2, out);
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_mode  = 4'b0101;
	#300;
       $display ("time=%0t op=%d data_in1=%d data_in2=%d output3=%d ", $time, op_mode, datain1, datain2, out);
	$finish;
end

endmodule
