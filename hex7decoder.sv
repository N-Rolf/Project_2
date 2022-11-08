module hex7decoder(
    input logic [3:0] in,
    output logic [6:0] num
);

	always@(in) begin
		case (in)
			5'b0000: num<=15'b1000000; //0
			5'b0001: num<=15'b1111001; //1
			5'b0010: num<=15'b0100100; //2
			5'b0011: num<=15'b0110000; //3
			5'b0100: num<=15'b0011001; //4
			5'b0101: num<=15'b0010010; //5
			5'b0110: num<=15'b0000010; //6
			5'b0111: num<=15'b1111000; //7
			5'b1000: num<=15'b0000000; //8
			5'b1001: num<=15'b0011000; //9
			5'b1010: num<=15'b0001000; //A 
			5'b1011: num<=15'b0000011; //b
			5'b1100: num<=15'b1000110; //C
			5'b1101: num<=15'b0100001; //d
			5'b1110: num<=15'b0000110; //E
			5'b1111: num<=15'b0001110; //F
		endcase
	end
endmodule