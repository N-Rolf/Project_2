//top level file for 10-bit processor
module ARM_processor (
    input logic CLKb, CLK, PKb,
    input logic [9:0] Data_in,
	 output logic [9:0] LED_B,
    output logic [7:0] HEX0,
    output logic [7:0] HEX1,
    output logic [7:0] HEX2,
    output logic [7:0] HEX3,
    output logic [7:0] HEX4,
    output logic [7:0] HEX5
);

	//clock key debounce
	debouncer clean (.A_noisy(CLKb), .CLK50M(CLK), .A(CLK_clean)); //CLKb=KEY0, CLK=50mhz PIN_P11

endmodule