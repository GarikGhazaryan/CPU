module on_off(sw1, sw2, ld1, ld2, ld3);

input sw1, sw2;
output reg ld1, ld2, ld3;

always@(*)begin
        if(sw1&sw2) ld3<=1'b1;
        else if(sw1) ld1<=1'b1;
        else if(sw2) ld2<=1'b1;
        else begin 
                ld1<=1'b0;
                ld2<=1'b0;
                ld3<=1'b0;
        end
end     
endmodule

