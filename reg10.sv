//INSTRUCTION REGISTER
module reg10 (
    input logic [9:0] D,
    input logic EN, CLKb,
    output logic [9:0] Q
);
	
	always_ff@(negedge CLKb)
	begin
		if(EN)
			Q <= D;
		else
			Q <= Q;
	end

endmodule