module control_circuit (
input logic [9:0] INSTR,
input logic [1:0] T,
output tri [9:0] IMM,
output logic [2:0] ALUcont, Rin, Rout,
output logic ENW, ENR, Ain, Gin, Gout, Ext, IRin, done
);


logic F;
logic [2:0] FN, Xreg, Yreg;
assign F = INSTR[9];
assign FN = INSTR[2:0];
assign Yreg = INSTR[5:3];
assign Xreg = INSTR[8:6];

parameter 	
				LOAD = 3'b000, //load instruction operators
				
				COPY = 3'b001, //copy instruction operators
				
				AND  = 3'b101, //and instruction operators
				
				OR   = 3'b110, //or instruction operators
				
				INV  = 3'b100, //2's comp instruction operators
				
				SUB  = 3'b011, //subtraction instruction operators
				
				XOR  = 3'b111, //xor gate instruction operators
				
				ADD  = 3'b010; //addition instruction operators
				

//date to reg setup
always @(T)
begin
	//set all flags to zero
	IMM = 10'bzzzzzzzzzz;
	Rin = 3'b000;
	Rout = 3'b000;
	ALUcont = 3'b000;
	
	ENW = 1'b0;
	ENR = 1'b0;
	Ain = 1'b0;
	Gin = 1'b0;
	Gout = 1'b0;
	Ext = 1'b0;
	IRin = 1'b0;
	done = 1'b0;

	case(T)
		2'b00:	//timestep 0 (nothing asserted)
				//enable instr reg
				begin
				Ext = 1'b1;
				IRin = 1'b1;
				end
		2'b01:	//timestep 1
			begin	
				if (F) //if F non-zero
				begin
					Rout = Xreg; //assign rout to register x
					ENR = 1'b1; //assign read from reg to 1
					Ain = 1'b1; //set save alu inp a to 1
				end
			else 
				case (FN) //if FN not zero
				LOAD	: //if load instruction called
					begin
						Ext = 1'b1; //set external bus bit 1
						Rin = Xreg; //set rin to register x
						ENW = 1'b1; //set write from reg bit to 1
						done = 1'b1; //set clear bit 1
					end
				COPY	: //if copy instruction called
					begin
						Rout = Yreg; //set rout to register y currently
						Rin = Xreg; //set rin to register x currently
						ENR = 1'b1; //set read bit 1
						ENW = 1'b1; //set write bit 1
						done = 1'b1; //set clear bit one
					end
				AND, OR, SUB, ADD, XOR	: //if any other calls
					begin
						Rout = Xreg; //set rout to rx currently
						ENR = 1'b1; //set enable read 
						Ain = 1'b1; //a register in bit to 1
					end
				INV : //2's comp intruction
					begin
						Rout = Yreg; //set rout to ry currently
						ENR = 1'b1; //set enable read bit to 1
						Gin = 1'b1; //g register input bit to 1
						ALUcont = INV; //set alu continue bit to 
					end
			endcase
		end
		2'b10: //timestep 2
			begin
				if (F) //if F non-zero
				begin
				Gin = 1'b1; //set register g input to 1
				IMM = {4'd0, INSTR[5:0]}; //set IMM bus to fist 4 bits decimal 0, then last 6 bits of instruction
				ALUcont = ADD; //set alu cont to add bits
			end
				else //if f 0
				case (FN) //if FN is non-zero
					AND : //if and instruction called
						begin
							Rout = Yreg; //set rout to ry currently
							ENR = 1'b1; //set enable read to 1
							Gin = 1'b1; //set register g in bit to 1
							ALUcont = AND; //set alu cont to AND instruction
						end
					OR : //if or instruction called
						begin
							Rout = Yreg; //set rout to ry currently
							ENR = 1'b1; //set enable read to 1
							Gin = 1'b1; //set register g in bit to 1
							ALUcont = OR; //set alu cont to OR instruction
						end
					SUB : //if subtraction instruction called
						begin
							Rout = Yreg; //set rout to ry currently
							ENR = 1'b1; //set enable read to 1
							Gin = 1'b1; //set register g in bit to 1
							ALUcont = SUB; //set alu cont to SUB instruction
						end
					ADD : //if addition instruction called
						begin
							Rout = Yreg; //set rout to ry currently
							ENR = 1'b1; //set enable read to 1
							Gin = 1'b1; //set register g in bit to 1
							ALUcont = ADD; //set alu cont to ADD instruction
						end
					XOR : //if xor instruction called
						begin
							Rout = Yreg; //set rout to ry currently
							ENR = 1'b1; //set enable read to 1
							Gin = 1'b1; //set register g in bit to 1
							ALUcont = XOR; //set alu cont to ADD instruction
						end
					INV : //if 2's bit comp instruction called
						begin
							Rin = Xreg; //set rin to rx currently
							ENW = 1'b1; //set enable write to 1
							Gout = 1'b1;  //set g output bit 1
							done = 1'b1; //set clear bit 1
						end
				endcase
		end
		2'b11 :	//if timestep 3 
			begin
				Gout = 1'b1; //set g output bit 1
				Rin = Xreg; //set register in bit to rx currently
				ENW = 1'b1; //set enable write bit to 1
				done = 1'b1; //set clear bit to 1
			end
		endcase
	end
endmodule