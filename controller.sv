module control_circuit (
input logic [9:0] INSTR,
input logic [1:0] T,
output logic [9:0] IMM,
output logic [2:0] ALUcont,
output logic Rin, Rout, ENW, ENR, Ain, Gin, Gout, Ext, IRin, done
);

logic [2:0] Xreg;
logic [2:0] Yreg;

//date to reg setup

always @(T)
begin
	//set all flags to zero
	ENW = 1'b0;
	ENR = 1'b0;
	Ain = 1'b0;
	Gin = 1'b0;
	Gout = 1'b0;
	EXT = 1'b0;
	IRin = 1'b0;
	done = 1'b0;

	case(T)
		2'b00:	//timestep 0 (nothing asserted)
				//enable instr reg
		2'b01:	//timestep 1
			case(I)
				3'b000: begin //LOAD
					ENW = 1'b1;
					Rin = Xreg;
					done = 1'b1;
					end
				3'b001: begin //MOVE
					Rout = Y;
					Rin = Xreg;
					done = 1'b1;
					end
				3'b010: begin //ADD
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b000;
					end
				3'b011: begin //SUB
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b001;
					end
				3'b100: begin //INV
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b010;
					end
				3'b101: begin //AND
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b011;
					end
				3'b110: begin //OR
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b100;
					end
				3'b111: begin //XOR
					Rout = Xreg;
					Ain = 1'b1;
					ALUcont = 3'b101;
					end
				default: begin //ADDI
					
					end
			endcase
		2'b10: //timestep 2
			case(I)
				3'b010: begin //ADD

					end
				3'b011: begin //SUB

					end
				3'b100: begin //INV

					end
				3'b101: begin //AND

					end
				3'b110: begin //OR

					end
				default: begin //XOR

					end
			endcase
	endcase
end

endmodule