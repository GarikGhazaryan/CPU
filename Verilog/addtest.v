module test();
  reg [7:0] a;
  reg [7:0] b;

  wire [8:0] out;
  wire c_out;

  add_4bit t (a, b, out, c_out);

  initial begin
    $dumpfile("add.vcd");
    $dumpvars();
  end

  initial begin
    a =8'd0;
    b =8'd0;
    #10;
	$display ("time=%0t output=%d ", $time, out);

    a = 8'd1;
    b = 8'd5;
    #50;
	$display ("time=%0t output=%d ", $time, out);

    a = 8'b11111111;
    b = 8'b11111111;
    #90;
	$display ("time=%0t output=%d ", $time, out);
    $finish;
  end
endmodule

