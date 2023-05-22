module test();
  reg [3:0] a;
  reg [3:0] b;

  wire [4:0] out;
  wire c_out;

  add_4bit t (
    .a(a),
    .b(b),
    .out(out),
    .c_out(c_out)
  );

  initial begin
    $dumpfile("add.vcd");
    $dumpvars();
  end

  initial begin
    a = 4'd0;
    b = 4'd0;
    $display(out);
  end

  always @(*) begin
    #150;
    a = 4'b0011;
    b = 4'b0001;

    #250;

    $display(out);
    #550;
    $finish;
  end
endmodule

