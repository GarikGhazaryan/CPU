`timescale 1 ns/1 ps
module test;

reg [3:0] datain1, datain2, op_code;
wire [7:0] out;

alu t( datain1, datain2, op_code, out);

initial 
begin
	$dumpfile("alu.vcd");
	$dumpvars();
end

initial 
begin 
	datain1  = 4'b0;
	datain2  = 4'b0;
	op_code = 4'b1111;
	#50
        $display ("time=%0t op=%d datai_n1=%d data_in2=%d output0=%d ", $time, op_code, datain1, datain2, out);
end

always @(*) 
begin 
	#100;
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_code  = 4'b0011;
	#200;
        $display ("time=%0t op=%d datai_n1=%d data_in2=%d output1=%d ", $time, op_code, datain1, datain2, out);
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_code  = 4'b0100;
	#300
        $display ("time=%0t op=%d data_in1=%d data_in2=%d output2=%d ", $time, op_code, datain1, datain2, out);
	datain1  = 4'b0011;
	datain2  = 4'b0010;
	op_code  = 4'b0101;
	#400;
       $display ("time=%0t op=%d data_in1=%d data_in2=%d output3=%d ", $time, op_code, datain1, datain2, out);
	$finish;
end

endmodule
