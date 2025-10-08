module or_gate_dt (
	input a,
	input b,
	output reg y
);
	always @(*) begin
		assign y = a | b;
	end
endmodule

