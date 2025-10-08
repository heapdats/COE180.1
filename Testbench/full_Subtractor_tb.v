`timescale 1ns / 1ps

module full_subtractor_tb;
    logic a, b, c;
    logic difference, borrow;

    full_subtractor_st dut(.*);

        initial begin
            
        $dumpfile("full_subtractor_tb.vcd");
        $dumpvars(0, full_subtractor_tb);
        $display("Testing Full Subtractor");
        $monitor("Time=%0t, a=%b, b=%b, c=%b, difference=%b, borrow=%b",$time, a, b, c, difference, borrow);

        for (int i = 0; i < 8; i++) begin
        {a, b, c} = i;
        #10;
        end

        $finish;
    end
endmodule