module mux41_tb;
    logic i0, i1, i2, i3;
    logic [1:0] s;   // separate signals
    logic y;

    mux41_bh dut(
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s(s),
    .y(y)
    );  // works because names match

    initial begin
        $dumpfile("mux41_tb.vcd");
        $dumpvars(0, mux41_tb);

        $monitor("Time=%0t, i0=%b, i1=%b, i2=%b, i3=%b, s=%b, y=%b",
                $time, i0, i1, i2, i3, s, y);

        // Loop through all input combinations
        for (int i = 0; i < 64; i++) begin
            {i0, i1, i2, i3, s} = i[5:0];
            #10;
        end
        $finish;
    end
endmodule
