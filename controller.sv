module control_circuit (
input clk, run,
output [7:0] R_in, R_out,
output A_in, G_in, extern, done,
output [3:0] func,
input [2:0] Rx, Ry, ALU_en
);

if(ALU_en == 3'b000)
	begin
	if(func == 4'b0000)
	//open data
	//open XXX_in
	//close all
	else if (func == 4'b0001)
	//open YYY tri
	//open XXX_in
	//close all
	end
else if(ALU_en == 3'b100)
	begin
			case(func)
			4'b0010:
			begin
			//open XXX tri 
			//open a in
			//close XXX tri
			//close a in
			//open YYY tri
			//do thing
			//close YYY
			//open g in
			//open g out
			//open xxx_in
			//close all
			
			end
			4'b0011:
			begin
			//open a in
			//open XXX tri
			//close a in
			//close xxx_tri
			//open YYY tri
			//do thing
			//close YYY
			//open g in
			//open g out
			//open xxx_in
			//close all
			
			end
			4'b0100:
			begin
			//open YYY
			//close YYY
			//do thing
			//open g_in 
			//open g_out
			//open XXX_in
			//close all 
			end
			4'b0101:
			begin
			//open XXX tri 
			//open a in
			//close XXX tri
			//close a in
			//open YYY tri
			//do thing
			//close YYY
			//open g in
			//open g out
			//open xxx_in
			//close all
			end
			4'b0110:
			begin
			//open XXX tri 
			//open a in
			//close XXX tri
			//close a in
			//open YYY tri
			//do thing
			//close YYY
			//open g in
			//open g out
			//open xxx_in
			//close all
			end
			4'b0111:
			begin
			//open XXX tri 
			//open a in
			//close XXX tri
			//close a in
			//open YYY tri
			//do thing
			//close YYY
			//open g
			in
			//open g out
			//open xxx_in
			//close all
			end
			endcase
	
	end
 

msALU doMath (.func(func),.A_in(A_in),.G_in(G_in),.G_out(G_out));

endmodule