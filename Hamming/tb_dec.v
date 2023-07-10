module dec_tb();

reg [6:0] data_h_in;
wire [6:0] data_out;

decod dec (data_h_in, data_out);

initial begin
        $dumpfile("gtk.vcd");
        $dumpvars();
end

initial begin
        data_h_in=7'b1101100;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #208;
        data_h_in=7'b0101100;
        #28;
        $display("in=%b", data_h_in);
        $display("true=%b", data_out);
        #208;
        $finish;
end
endmodule

