//top level file for 10-bit processor
module ARM_processor (
    input logic CLKb, CLK50M, PKb,
    input logic [9:0] Data_in,
    output logic done,
	output logic [9:0] LED_B,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2,
    output logic [7:0] HEX5
);

	logic [9:0] data;
	
	always_comb
	begin
	if (C_Ext)
		data <= Data_in;
	else
		data = 10'bzzzzzzzzzz;
	end

	//clock key debounce
	debouncer CLKclean (.A_noisy(CLKb), .CLK50M(CLK50M), .A(CLK_clean)); //CLKb=KEY0, CLK=50mhz PIN_P11
    //peek key debounce
	debouncer PKclean (.A_noisy(PKb), .CLK50M(CLK50M), .A(PK_clean)); //PKb=KEY1

    //instruction register
    logic [9:0] nextInst_out;
    logic INSTR;
    reg10 nextInst (.D(data), .EN(IRin), .CLKb(CLK_clean), .Q(nextInst_out));

    //counter
    logic [2:0] count;
    counter timeStep (.CLR(done), .CLK(CLK_clean), .CNT(count));

	 
    //controller
    logic [9:0] C_IMM;
    logic [2:0] C_Rin;
	 logic C_Rout, C_ENW, C_ENR, C_Ain, C_Gin, C_Gout, C_Ext, C_IRin;
	 logic [2:0] ALUcont;
	 logic [2:0] RDA0;
    control_circuit borked (.INSTR(nextInst_out), .T(count), .IMM(data), .ALUcont(ALUcont), .Rin(C_Rin), .Rout(RDA0), .ENW(C_ENW), .ENR(C_ENR), .Ain(C_Ain), .Gin(C_Gin), .Gout(C_Gout), .Ext(C_Ext), .IRin(C_IRin), .done(done));

    //register file
    logic [9:0] Q1_out;
    registerFile regBank (.D(data), .ENW(C_ENW), .ENR0(C_ENR), .CLKb(CLK_clean), .WRA(C_Rin), .RDA0(RDA0), .RDA1(Data_in[2:0]), .Q0(data), .Q1(Q1_out));
    //multi-ALU
    logic [9:0] RES_out;
    msALU doMath (.OP(data), .ALUControl(ALUcont), .Ain(C_Ain), .Gin(C_Gin), .Gout(C_Gout), .CLKb(CLK_clean), .Q(data));

    //output
    display displayStuff (.BUS(data), .REG(Q1_out), .TIME(count), .PEEKb(PK_clean), .DONE(done), .LED_B(LED_B), .DHEX0(HEX0), .DHEX1(HEX1), .DHEX2(HEX2), .THEX(HEX5));


endmodule