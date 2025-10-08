`timescale 1ns / 1ps

module half_subtractor_tb;
    logic a, b;
    logic difference, borrow;

    // Wildcard connection
    half_subtractor_st dut(.*);

    initial begin

        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0, half_subtractor_tb);
        $display("Testing Half Subtractor");
        $monitor("Time=%0t, a=%b, b=%b, difference=%b, borrow=%b", $time, a, b, difference, borrow);
        // Test using a loop

        for (int i = 0; i < 4; i++) begin
        {a, b} = i;
        #10;
        end

        $finish;
    end
endmodule