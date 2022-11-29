module output (
    input logic [9:0] BUS,          //10 bits from input/shared but
    input logic [9:0] REG,          //10 bits from register file Q1
    input logic [1:0] TIME,         //2 bits from counter
    input logic PEEKb, DONE,        //PEEKb - from switch, done - from clr in controller
    output logic [9:0] LED_B,       //shows current values on data bus
    output logic [6:0] DHEX0,       
    output logic [6:0] DHEX1,
    output logic [6:0] DHEX2,
    output logic [6:0] THEX,        //shows current timestep
    output logic LED_D
);

    //if PEEKb = 1, DHEX[0:2] shows current 10-bit value on data bus
        //extract 3bit value, pad with 0?
        hex7decoder busOut ();
    //if PEEKb = 0, DHEX[0:2] shows 10-bit output from register file Q1
        hex7decoder regOut ();
        


endmodule