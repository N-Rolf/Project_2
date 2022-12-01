module msALU (
	input logic [9:0] OP,
	input logic [2:0] ALUControl,
	input logic Ain, Gin, Gout, CLKb,
	output logic [9:0] Q
	);
	
	logic [9:0] A;
	logic [9:0] Result;
	logic [9:0] G;
	
	
	always_ff @ (negedge CLKb)
	begin
		begin
		if (Ain)
			A <= OP;
		end
	end
	
	parameter		ADD = 3'b000,
					SUB = 3'b001,
					INV = 3'b010,
					AND = 3'b011,
					OR = 3'b100,
					XOR = 3'b101;

	always
	begin
		if (FN == ADD)
		begin
			Result = A + OP;	
		end	
		
		else if (FN == SUB)
		begin
			Result = A - OP;
		end

		else if (FN == INV)
		begin
			Result = -(OP);
		end

		else if (FN == AND)
		begin
			Result = A & OP;
		end
		
		else if (FN == OR)
		begin
			Result = A | OP;
		end
		
		else if (FN == XOR)
		begin
			Result = A ^ OP;
		end
	end
	
			
	always_ff @ (negedge CLKb)
	begin
		begin
		if (Gin)
			G <= Result;
		end
		begin
		if (Gout)
			Q <= G;
		end
	end
		
endmodule 

	