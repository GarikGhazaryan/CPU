module tb_en();

reg [10:0] data_in;
wire [14:0] data_h_out;

encod en (data_in, data_h_out);

initial begin
        $dumpfile("gtk.vcd");
        $dumpvars();
end

initial begin
        data_in=11'b11110000111;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #208;
        data_in=11'b00000000001;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #208;
        $finish;
end
endmodule

