module trireg10 (
	input logic [9:0] D,
	input logic CLKb, Rin, Rout,
	output trireg [9:0] Q
	);
	
	logic [9:0] _Q;
	
	reg10 register (.D(D), .CLKb(CLKb), .EN(Rin), .Q(_Q));
	
	always_comb
	begin
		if (Rout)
			Q = _Q;
		else
			Q = 10'bzz_zzzz_zzzz;
	end
	
	endmodule