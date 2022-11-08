module sev_seg(
	input logic hexIn_0, hexIn_1, hexIn_2, hexIn_3,
	output a,b,c,d,e,f,g,dec
);
	//variables
	logic [15:0]y;
	logic nhexIn_0, nhexIn_1, nhexIn_2, nhexIn_3;
	not(nhexIn_0, hexIn_0);
	not(nhexIn_1, hexIn_1);
	not(nhexIn_2, hexIn_2);
	not(nhexIn_3, hexIn_3);

	//decoder block
	and(y[0],nhexIn_3,nhexIn_0,nhexIn_1,nhexIn_2);		//0000 
	and(y[1],nhexIn_3,nhexIn_0,nhexIn_1,hexIn_2);		//0001 
	and(y[2],nhexIn_3,nhexIn_0,hexIn_1,nhexIn_2);		//0010 
	and(y[3],nhexIn_3,nhexIn_0,hexIn_1,hexIn_2);		//0011 
	and(y[4],nhexIn_3,hexIn_0,nhexIn_1,nhexIn_2);		//0100 
	and(y[5],nhexIn_3,hexIn_0,nhexIn_1,hexIn_2);		//0101 
	and(y[6],nhexIn_3,hexIn_0,hexIn_1,nhexIn_2);		//0110 
	and(y[7],nhexIn_3,hexIn_0,hexIn_1,hexIn_2);			//0111 
	and(y[8],hexIn_3,nhexIn_0,nhexIn_1,nhexIn_2);		//1000 
	and(y[9],hexIn_3,nhexIn_0,nhexIn_1,hexIn_2);		//1001 
	and(y[10],hexIn_3,nhexIn_0,hexIn_1,nhexIn_2);		//1010
	and(y[11],hexIn_3,nhexIn_0,hexIn_1,hexIn_2);		//1011
	and(y[12],hexIn_3,hexIn_0,nhexIn_1,nhexIn_2);		//1100
	and(y[13],hexIn_3,hexIn_0,nhexIn_1,hexIn_2);		//1101
	and(y[14],hexIn_3,hexIn_0,hexIn_1,nhexIn_2);		//1110
	and(y[15],hexIn_3,hexIn_0,hexIn_1,hexIn_2);			//1111

	nor(a, y[0],y[2],y[3],y[5],y[6],y[7],y[8],y[9],y[10],y[12],y[14],y[15]); 	    	//a segment
	nor(b, y[0],y[1],y[2],y[3],y[4],y[7],y[8],y[9],y[10],y[13]);				 	    //b segment
	nor(c, y[0],y[1],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],y[11],y[13]);        		//c segment
	nor(d, y[0],y[2],y[3],y[5],y[6],y[8],y[11],y[12],y[13],y[14]);				      	//d segment
	nor(e, y[0],y[2],y[6],y[8],y[10],y[11],y[12],y[13],y[14],y[15]);			       	//e segment
	nor(f, y[0],y[4],y[5],y[6],y[8],y[9],y[10],y[11],y[12],y[14],y[15]);		 		//f segment
	nor(g, y[2],y[3],y[4],y[5],y[6],y[8],y[9],y[10],y[11],y[13],y[14],y[15]);			//g segment
	//and(dec, dec, 0);
	
endmodule