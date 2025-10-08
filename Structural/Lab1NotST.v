module not_gate_st (
    input a,
    output y
);

    // Instantiate a NAND gate and tie both inputs to 'a'
    nand_gate_df nand1 (
        .a(a),
        .b(a),
        .y(y)
    );

endmodule
