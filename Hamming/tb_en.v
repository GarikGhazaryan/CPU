module tb_en();

reg [10:0] data_in;
wire [14:0] data_h_out;

encod en (data_in, data_h_out);

initial begin
        $dumpfile("gtk.vcd");
        $dumpvars();
end

initial begin
        data_in=11'b11110001111;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b0000001111;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b11111100000;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b11111111111;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b00000000000;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b10101010101;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        data_in=11'b01010101010;
        #28;
        $display("in=%b", data_in);
        $display("true=%b", data_h_out);
        #28;
        $finish;
end
endmodule

