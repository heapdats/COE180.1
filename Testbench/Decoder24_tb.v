`timescale 1ns/1ps

module decoder_2_to_4_bh_tb;

    // Testbench signals
    reg  [1:0] A;
    reg        E;
    wire [3:0] Y;

    // Instantiate the DUT (Device Under Test)
    decoder_2_to_4_bh dut (
        .A(A),
        .E(E),
        .Y(Y)
    );

    // Test procedure
    initial begin
        // Optional: enable waveform dumping (for GTKWave or ModelSim)
        $dumpfile("decoder_2_to_4_bh_tb.vcd");
        $dumpvars(0, decoder_2_to_4_bh_tb);

        // Display header
        $display("Time |  E  |  A  |   Y");
        $display("------------------------");

        // Initialize
        E = 0; A = 2'b00;
        #5;
        $display("%4t |  %b  | %b | %b", $time, E, A, Y);

        // Test with Enable = 0 (should output 0000)
        repeat (3) begin
            A = A + 1;
            #5;
            $display("%4t |  %b  | %b | %b", $time, E, A, Y);
        end

        // Enable the decoder
        E = 1;
        A = 2'b00;
        #5;
        $display("%4t |  %b  | %b | %b", $time, E, A, Y);

        // Test all A combinations with E = 1
        repeat (3) begin
            A = A + 1;
            #5;
            $display("%4t |  %b  | %b | %b", $time, E, A, Y);
        end

        // End simulation
        $display("------------------------");
        $display("Test completed.");
        $finish;
    end

endmodule
