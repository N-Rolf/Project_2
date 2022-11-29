module ALU#(
	parameter N = 8
)
(
	input  logic [N-1:0] A, B,
	input  logic [1:0] ALUControl,
	output logic [N-1:0] Result,
	output logic V, C, Neg, Z //replicate from Fig. 5.17 in your book
);

	logic carry;
	
	assign carry = A[7] + B[7];

	parameter	ADD = 2'b00,
					SUB = 2'b01,
					AND = 2'b10,
					OR = 2'b11;
	
	always
	begin
		if (ALUControl == ADD)
		begin
			Result = A + B;
//			C = A[N-1] & B[N-1];
//			if (A[N-1] != Result [N-1])
//				if(A[N-1] == B[N-1])
//					V = 1'b1;
//				else
//					V = 1'b0;
		end	
		
		
		else if (ALUControl == SUB)
		begin
			Result = A + ~B + 1;
			C = A[N-1] & B[N-1];
			if (A[N-1] != Result[N-1])
				if (A[N-1] != B[N-1])
					V = 1'b1;
				else
					V = 1'b0;
			else
				V = 1'b0;
		end
		
		
		
		
		
		
		
		
		else if (ALUControl == AND)
		begin
			Result = A & B;
			C = 1'b0;
			V = 1'b0;
		end
		
		
		else 
		begin
			Result = A | B;
			C = 1'b0;
			V = 1'b0;
		end
		
		if (Result == 0)
			Z = 1'b1;
		else
			Z = 1'b0;
		if (Result[N-1] == 1)
			Neg = 1;
		else 
			Neg = 0;
			
	end
		
		
	
	/*
	Output Flags:
		V: oVerflow
		C: Carry
		Neg: Negative
		Z: Zero
		
		Must replicate logic from book ALU (Fig. 5.17)
	*/

endmodule 

	
