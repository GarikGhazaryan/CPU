module dec_tb();

reg [6:0] data_h_in;
wire [6:0] data_out;

decod dec (data_h_in, data_out);

initial begin
        $dumpfile("gtk.vcd");
        $dumpvars();
end

initial begin
        data_h_in=7'b0110100;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b0110101;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b0001101;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b0011101;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b0011010;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b0001010;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b1010001;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        data_h_in=7'b1010101;
        #28;
        $display("in=%d", data_h_in);
        $display("true=%d", data_out);
        #208;
        $finish;
end
endmodule

