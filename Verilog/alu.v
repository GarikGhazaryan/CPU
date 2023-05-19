module alu(datain1, datain2, op_code, out);

input [3:0] datain1, datain2, op_code;
output reg [7:0] out;

always @(*) 
begin 
	case(op_code)
		4'b0011:
			out = datain1 + datain2;
	    4'b0100:
			out = datain1 - datain2;
		4'b0101:
			out = datain1*datain2;
		default:
			out = 7'b0; 
	endcase
end

endmodule
