`timescale 1ns / 1ps
module mux21_tb;
    logic i0, i1, s;
    logic y;

    // Instantiate DUT with
    //wildcard connection
    mux21_bh dut(.*);

    initial begin
    // Create VCD file
    $dumpfile("mux21_tb.vcd");
    $dumpvars(0, mux21_tb);

    // Monitor changes
    $monitor("Time=%0t, i0=%b, i1=%b, s=%b, y=%b", $time, i0, i1, s, y);

    // Test all input combinations
    // using loop
        for (int i = 0; i < 8; i++) begin
            {i0, i1, s} = i;
            #10;
        end
        $finish;
    end
endmodule