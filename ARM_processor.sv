//top level file for 10-bit processor
module ARM_processor (
    input logic CLKb, CLK, PKb,
    input logic [9:0] Data_in,
    output logic done,
	output logic [9:0] LED_B,
    output logic [7:0] HEX0,
    output logic [7:0] HEX1,
    output logic [7:0] HEX2,
    output logic [7:0] HEX3,
    output logic [7:0] HEX4,
    output logic [7:0] HEX5
);

	//clock key debounce
	debouncer CLKclean (.A_noisy(CLKb), .CLK50M(CLK), .A(CLK_clean)); //CLKb=KEY0, CLK=50mhz PIN_P11
    //peek key debounce
	debouncer PKclean (.A_noisy(PKb), .CLK50M(CLK), .A(PK_clean)); //PKb=KEY1

    //instruction register
    logic IRin = 0; //debug only
    logic nextInst_out, INSTR;
    reg10 nextInst (.D(Data_in), .EN(IRin), .CLKb(CLK_clean), .Q(nextInst_out));
    assign INSTR = nextInst_out;

    //counter
    logic count;
    counter timeStep (.CLR(CLR), .CLK(CLK_clean), .CNT(count));

    //controller
    //borked, debug with manual values

    //register file
    logic [9:0] Q1_out;
    logic [9:0] Q0_out;
    registerFile regBank (.D(Data_in), .ENW(), .ENRO(), .CLKb(CLK_clean), .WRA(), .RDA0(), .RDA1(), .Q0(Q0_out), .Q1(Q1_out));
    //multi-ALU
    logic [9:0] RES_out;
    msALU doMath (.OP(Data_in), .FN(), .Ain(), .Gin(), .Gout(), .CLKb(CLK_clean), .Q(RES_out));

    //output
    display displayStuff (.BUS(RES_out), .REG(Q1_out), .TIME(count), .PEEKb(KEY1), .DONE(done), .LED_B(LED_B), .DHEX0(HEX0), .DHEX1(HEX1), .DHEX2(HEX2), .THEX(HEX5), .LED_D());


endmodule