module nand_gate_dt (
	input a,
	input b,
	output reg y
);
	always @(*) begin
		y = ~(a & b);
	end
endmodule
