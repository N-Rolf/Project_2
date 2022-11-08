module upcount2 (
    input logic CLR, CLK_clean,
    output logic [1:0] CNT
);
	
always_ff @ (negedge CLK_clean)
begin
	if (CLR)
		CNT <= 0;
	else
		CNT <= CNT + 1;
	end


endmodule