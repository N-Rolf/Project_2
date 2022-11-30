module registerFile (
    input logic [9:0] D,
    input logic ENW, ENRO, ENR1, CLKb,
    input logic [2:0] WRA, RDA0, RDA1,
    output logic [9:0] Q0, Q1
);

assign ENR1 = 1'b1;
assign RDA1 = D[2:0];
logic _WQ, _RQ1, _RQ0;

logic dWRA, dRDA1, dRDA0;

always_ff@(negedge CLKb)
begin
	if (ENW)
		Q0 <= _WQ;
end 

always
begin
	begin
	if (ENR1)
		Q1 <= _RQ1;
	end
	begin
	if (ENR0)
		Q0 <= _RQ0;
	end
end

//decode WRA and RAD0 and RDA1?




reg10 Write1 (.D(D), .EN(dWRA), .CLKb(CLKb), .Q(_WQ));

reg10 Read1 (.D(D), .EN(dRDA1), .CLKb(CLKb), .Q(_RQ1));

reg10 Read0 (.D(D), .EN(dRDA0), .CLKb(CLKb), .Q(_RQ0));




endmodule