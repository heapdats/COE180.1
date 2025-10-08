`timescale 1ns / 1ps

module half_adder_tb;
    logic a, b;
    logic sum, carry;

    // Wildcard connection
    half_adder_st dut(.*);

    initial begin

        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
        $display("Testing Half Adder");
        $monitor("Time=%0t, a=%b, b=%b, sum=%b, carry=%b", $time, a, b, sum, carry);
        // Test using a loop

        for (int i = 0; i < 4; i++) begin
        {a, b} = i;
        #10;
        end

        $finish;
    end
endmodule