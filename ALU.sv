module ALU(
	input  logic [9:0] A, B,
	input  logic [2:0] ALUControl,
	output logic [9:0] Result,
);


	parameter			ADD = 3'b000,
					SUB = 3'b001,
					INV = 3'b010,
					AND = 3'b011,
					OR = 3'b100,
					XOR = 3'b101;

	always
	begin
		if (ALUControl == ADD)
		begin
			Result = A + B;	
		end	
		
		else if (ALUControl == SUB)
		begin
			Result = A + ~B + 1;
		end

		else if (ALUControl == INV)
		begin
			Result = -(B);
		end

		else if (ALUControl == AND)
		begin
			Result = A & B;
		end
		
		else if (ALUControl == OR)
		begin
			Result = A | B;
		end
		
		else if (ALUControl == XOR)
		begin
			Result = A ^ B
		end

	end
		
endmodule 

	
