module counter (
    input logic CLR, CLK,
    output logic [1:0] CNT
);
	
always_ff @ (negedge CLK)
begin
	if (CLR)
		CNT <= 0;
	else
		CNT <= CNT + 1'b1;
	end


endmodule