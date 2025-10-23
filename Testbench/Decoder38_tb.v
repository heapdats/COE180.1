`timescale 1ns/1ps

module decoder38_tb;

    // Testbench signals
    reg  [2:0] A;
    reg        E;
    wire [7:0] Y;

    // Instantiate the DUT (Device Under Test)
    decoder_3_to_8_bh dut (
        .A(A),
        .E(E),
        .Y(Y)
    );

    // Test sequence
    initial begin
        // Waveform dump for GTKWave or ModelSim
        $dumpfile("decoder38_tb.vcd");
        $dumpvars(0, decoder38_tb);

        // Header
        $display("Time | E |  A  |     Y");
        $display("-----------------------------");

        // Test when decoder is disabled
        E = 0;
        A = 3'b000;
        #5;
        repeat (8) begin
            $display("%4t | %b | %b | %b", $time, E, A, Y);
            A = A + 1;
            #5;
        end

        // Test when decoder is enabled
        E = 1;
        A = 3'b000;
        #5;
        repeat (8) begin
            $display("%4t | %b | %b | %b", $time, E, A, Y);
            A = A + 1;
            #5;
        end

        $display("-----------------------------");
        $display("Test complete.");
        $finish;
    end

endmodule
