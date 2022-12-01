module trireg10 (
	input logic [9:0] D,
	input logic CLKb, Rin, Rout0, Rout1,
	output trireg [9:0] Q0, Q1
	);
	
	logic [9:0] _Q;
	
	reg10 register (.D(D), .CLKb(CLKb), .EN(Rin), .Q(_Q));
	
	always_comb
	begin
		begin
		if (Rout0)
			Q0 = _Q;
		else
			Q0 = 10'bzz_zzzz_zzzz;
		end
		
		begin
		if (Rout1)
			Q1 = _Q;
		else
			Q1 = 10'bzz_zzzz_zzzz;
		end
	end
	
	endmodule