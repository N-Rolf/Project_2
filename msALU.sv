module msALU (
	input logic [9:0] OP,
	input logic [2:0] ALUControl,
	input logic Ain, Gin, Gout, CLKb,
	output logic [9:0] Q
	);
	
	logic [9:0] A;
	logic [9:0] Result;
	logic [9:0] G;
	
	//saves into register A
	reg10 regOne (.D(OP), .EN(Ain), .CLKb(CLKb), .Q(A));
	
	
	
	parameter	ADD = 3'b000,
					SUB = 3'b001,
					INV = 3'b010,
					AND = 3'b011,
					OR = 3'b100,
					XOR = 3'b101;

	always_comb
	begin
		Result = 10'b0;
		
		case(ALUControl)
			ADD : Result = A + OP;
			
			SUB: Result = A - OP;
			
			INV: Result = 10'b00_0000_0000 - OP;
			
			AND: Result = A & OP;
			
			OR: Result = A | OP;
			
			XOR: Result = A ^ OP;
			
			endcase
	end
			

	reg10 regTwo (.D(Result), .EN(Gin), .CLKb(CLKb), .Q(G));
	
	
	always_comb
    begin  
        if(Gout) //check if exit bit non-zero
            Q = G; //if exitbit not zero save instruction to tri-state buffer output
			
        else
            Q = 10'bz; //save a 10 bit buffer zone if exit bit zero
    end
	 
endmodule

	