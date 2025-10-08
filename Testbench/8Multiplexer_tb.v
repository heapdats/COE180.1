module mux81_tb;
    logic i0, i1, i2, i3, i4, i5, i6, i7;
    logic [2:0] s;
    logic y;

    mux81_df dut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .s(s),   // correct connection
        .y(y)
    );

    initial begin
        $dumpfile("mux81_tb.vcd");
        $dumpvars(0, mux81_tb);

        $monitor("Time=%0t | i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b | s=%b | y=%b",
                  $time, i0, i1, i2, i3, i4, i5, i6, i7, s, y);

        // Loop through all 2048 input combinations
        for (int i = 0; i < 2048; i++) begin
            {i0, i1, i2, i3, i4, i5, i6, i7, s} = i[10:0];
            #10;
        end

        $finish;
    end
endmodule
