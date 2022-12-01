module 3to8decoder (
	input logic [2:0] in,
	input EN,
	output logic [7:0] out
	);
	
	always_comb
	begin
		if(EN)
			