module registerFile (
    input logic [9:0] D,
    input logic ENW, ENRO, CLKb,
    input logic [2:0] WRA, RDA0, RDA1,
    output logic [9:0] Q0, Q1
);

logic ENR1;
assign ENR1 = 1'b1;


logic [7:0] Rin, Rout0, Rout1;


//Decode WRA, RDA0, and RDA1 3 to 8 bits
3to8decoder write_decoder (.in(WRA), .EN(ENW), .out(Rin));
3to8decoder read0_decoder (.in(RDA0), .EN(ENR0), .out(Rout0));
3to8decoder read1_decoder (.in(RDA1), .EN(ENR1), .out(Rout1));


trireg10 R0 (.D(D), .CLKb(CLKb), .Rin(Rin[0]), .Rout0(Rout0[0]), .Rout1(Rout1[0]), .Q0(Q0), .Q1(Q1));
trireg10 R1 (.D(D), .CLKb(CLKb), .Rin(Rin[1]), .Rout0(Rout0[1]), .Rout1(Rout1[1]), .Q0(Q0), .Q1(Q1));
trireg10 R2 (.D(D), .CLKb(CLKb), .Rin(Rin[2]), .Rout0(Rout0[2]), .Rout1(Rout1[2]), .Q0(Q0), .Q1(Q1));
trireg10 R3 (.D(D), .CLKb(CLKb), .Rin(Rin[3]), .Rout0(Rout0[3]), .Rout1(Rout1[3]), .Q0(Q0), .Q1(Q1));
trireg10 R4 (.D(D), .CLKb(CLKb), .Rin(Rin[4]), .Rout0(Rout0[4]), .Rout1(Rout1[4]), .Q0(Q0), .Q1(Q1));
trireg10 R5 (.D(D), .CLKb(CLKb), .Rin(Rin[5]), .Rout0(Rout0[5]), .Rout1(Rout1[5]), .Q0(Q0), .Q1(Q1));
trireg10 R6 (.D(D), .CLKb(CLKb), .Rin(Rin[6]), .Rout0(Rout0[6]), .Rout1(Rout1[6]), .Q0(Q0), .Q1(Q1));
trireg10 R7 (.D(D), .CLKb(CLKb), .Rin(Rin[7]), .Rout0(Rout0[7]), .Rout1(Rout1[7]), .Q0(Q0), .Q1(Q1));


endmodule