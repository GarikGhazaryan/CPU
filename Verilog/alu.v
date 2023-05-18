module alu(datain1, datain2, op_mode, out);

input [3:0] datain1, datain2, op_mode;
output reg [7:0] out;

always @(*) 
begin 
	case(op_mode)
		4'b0011:
			out = datain1 + datain2;
	    4'b0100:
			out = datain1 - datain2;
		4'b0101:
			out = datain1*datain2;
		default:
			out = 0;
	endcase
end

endmodule
