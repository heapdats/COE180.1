`timescale 1ns/1ps

module decoder416_tb;

    // Testbench signals
    reg  [3:0] A;
    reg        E;
    wire [15:0] Y;

    // Instantiate the DUT (Device Under Test)
    decoder_4_to_16_bh dut (
        .A(A),
        .E(E),
        .Y(Y)
    );

    // Test sequence
    initial begin
        // Waveform dump (for GTKWave)
        $dumpfile("decoder416_bh_tb.vcd");
        $dumpvars(0, decoder416_tb);

        // Header
        $display("Time | E |    A    |         Y");
        $display("------------------------------------------");

        // Test when decoder is disabled
        E = 0;
        A = 4'b0000;
        #5;
        repeat (16) begin
            $display("%4t | %b | %b | %b", $time, E, A, Y);
            A = A + 1;
            #5;
        end

        // Test when decoder is enabled
        E = 1;
        A = 4'b0000;
        #5;
        repeat (16) begin
            $display("%4t | %b | %b | %b", $time, E, A, Y);
            A = A + 1;
            #5;
        end

        $display("------------------------------------------");
        $display("Test complete.");
        $finish;
    end

endmodule
