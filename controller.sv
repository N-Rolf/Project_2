module controller(
	input logic CLKb,
	output logic enA, enC, enALU
);

	/*
	* create a sequential controller
	* 	need a counter to keep track of current step (sequential logic!) - always_ff
	*	need a combinational logic circuit to assign outputs based on current step - always_comb
	*/
	
parameter 
	S0 = 1'b0,
	S1 = 1'b1;
	
logic S, NS;
	
always_comb
begin
	case(S)
		S0: NS = S1;
		S1: NS = S0;
	default: NS = S0;
	endcase
end

always_ff @ (negedge CLKb)
begin
	S <= NS;
end

always_comb
begin 
	if(S == S0)
	begin
		enA = 1'b1;
		enC = 1'b0;
		enALU = 1'b1;
	end
	else
	begin
		enA = 1'b0;
		enALU = 1'b0;
		enC = 1'b1;
	end
end

//always_comb
//begin
//	if(CLKb == 1'b1)
//	begin
//		enA = 1'b1;
//		enALU = 1'b1;
//		enC = 1'b0;
//	end
//	else
//	begin
//		enA = 1'b0;
//		enC = 1'b1;
//		enALU = 1'b0;
//	end
//end
	/*
	* create a sequential controller
	* 	need a counter to keep track of current step (sequential logic!) - always_ff
	*	need a combinational logic circuit to assign outputs based on current step - always_comb
	*/
//	
//	always_ff @(posedge CLKb)
//	begin
//		enA <= enA + 1;
//	end
//
//	always_comb @(posedge CLKb)
//	begin
		
	
endmodule 