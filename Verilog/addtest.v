module test();
  reg [N-1:0] a;
  reg [N-1:0] b;
  parameter N=8;
  wire [N:0] out;
  wire c_out;

  add_Nbit #(N) t (a, b, out, c_out);

  initial begin
    $dumpfile("add.vcd");
    $dumpvars();
  end

  initial begin
    a =4'd0;
    b =4'd0;
    #10;
	$display ("time=%0t output=%d ", $time, out);

    a = 8'd111;
    b = 8'd100;
    #50;
	$display ("time=%0t output=%d ", $time, out);

    a = 8'b11111111;
    b = 8'b00000001;
    #90;
	$display ("time=%0t output=%d ", $time, out);
    $finish;
  end
endmodule

