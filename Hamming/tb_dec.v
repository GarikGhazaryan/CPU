module dec_tb();

reg [14:0] data_h_in;
wire [14:0] data_out;

decod dec (data_h_in, data_out);

initial begin
        $dumpfile("gtk.vcd");
        $dumpvars();
end

initial begin
        data_h_in=15'b101101001110101;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #28;
        data_h_in=15'b101101001010101;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #28;
        data_h_in=15'b000000000001110;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #20;
        data_h_in=15'b000000000001111;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #20;
        $finish;
end
endmodule

