module display (
    input logic [9:0] BUS,         //10 bits from input/shared bus
    input logic [9:0] REG,          //10 bits from register file Q1
    input logic [1:0] TIME,         //2 bits from counter
    input logic PEEKb, DONE,        //PEEKb - from switch, done - from clr in controller
    output logic [9:0] LED_B,       //shows current values on data bus
    output logic [6:0] DHEX0,       
    output logic [6:0] DHEX1,
    output logic [6:0] DHEX2,
    output logic [7:0] THEX       //shows current timestep

);




logic [9:0] in;

assign LED_B = BUS;


always_comb
begin
    if (PEEKb)
			begin
			in <= BUS;
			end
    else
			begin
			in <= REG;
			end
			
end

        hex7decoder decodeDHEX0 (.in(in[3:0]), .num(DHEX0));
        hex7decoder decodeDHEX1 (.in(in[7:4]), .num(DHEX1));
        hex7decoder decodeDHEX2 (.in({2'b00, in[9:8]}), .num(DHEX2));
		  hex7decoder decodeTHEX (.in({2'b00, TIME[1:0]}), .num(THEX[6:0]));
		  assign THEX [7] = ~DONE;

endmodule