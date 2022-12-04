module display (
    input logic [9:0] BUS,          //10 bits from input/shared bus
    input logic [9:0] REG,          //10 bits from register file Q1
    input logic [1:0] TIME,         //2 bits from counter
    input logic PEEKb, DONE, CLK,        //PEEKb - from switch, done - from clr in controller
    output logic [9:0] LED_B,       //shows current values on data bus
    output logic [6:0] DHEX0,       
    output logic [6:0] DHEX1,
    output logic [6:0] DHEX2,
    output logic [6:0] THEX,        //shows current timestep
    output logic LED_D
);


hex7decoder busOut1 (.in(TIME), .num(THEX));
assign LED_D = DONE;


logic [9:0] in;

//always_ff @ (negedge CLK)
always_comb
begin
    if (PEEKb == 1)
			begin
        //DHEX[0:2] shows current 10-bit value on data bus
			in <= BUS;
			end
    else
			begin
        //DHEX[0:2] shows 10-bit output from register file Q1
			in <= REG;
			end
			
	 LED_B = BUS;
end

        hex7decoder regOut03 (.in(in[3:0]), .num(DHEX0));
        hex7decoder busOut04 (.in(in[7:4]), .num(DHEX1));
        hex7decoder busOut05 (.in({2'b00, in[9:8]}), .num(DHEX2));


endmodule