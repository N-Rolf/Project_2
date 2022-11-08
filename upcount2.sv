module upcount2 (
    input logic CLR, CLKb,
    output logic [1:0] CNT
);
	
always_ff @ (negedge CLKb)
begin
	if (CLR)
		CNT <= 1'b0;
	else
		CNT <= CNT + 1;
	end

endmodule