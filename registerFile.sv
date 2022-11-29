module registerFile (
    input logic [9:0] D,
    input logic ENW, ENRO, ENR1, CLKb,
    input logic [2:0] WRA, RDA0, RDA1,
    output logic [9:0] Q0, Q1
);

assign ENR1 = 1'b1;
assign RDA1 = D[2:0];
logic _Q;
logic dWRA, dRDA1, dRDA0;

always_ff@(negedge CLKb)
begin
	if (ENW)
		Q0 <= WRA;
end 


//decode WRA and RAD0 and RDA1





reg10 Write1 (.D(D), .EN(dWRA), .CLKb(CLKb), .Q(_Q));



reg10 Read01 (.D(D), .EN(RDA0[2]), .CLKb(CLKb), .Q(_Q));
reg10 Read02 (.D(D), .EN(RDA0[1]), .CLKb(CLKb), .Q(_Q));
reg10 Read03 (.D(D), .EN(RDA0[0]), .CLKb(CLKb), .Q(_Q));

reg10 Read11 (.D(D), .EN(RDA1[2]), .CLKb(CLKb), .Q(_Q));
reg10 Read12 (.D(D), .EN(RDA1[1]), .CLKb(CLKb), .Q(_Q));
reg10 Read13(.D(D), .EN(RDA1[0]), .CLKb(CLKb), .Q(_Q));




always
begin
	if (ENR1)
		Q1 <= RDA1;
	else
		Q1 <= 1'b0000000000;
	
	if (ENR0)
		Q0 <= RAD0;
	else
		Q0 <= 1'b0000000000;

end







endmodule