module registerFile (
    input logic [9:0] D,
    input logic ENW, ENRO, CLKb,
    input logic [2:0] WRA, RDA0, RDA1,
    output logic [9:0] Q0, Q1
);

logic ENR1;



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





endmodule