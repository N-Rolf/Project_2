module display (
    input logic [9:0] BUS,          //10 bits from input/shared bus
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

hex7decoder busOut (.in(BUS), .num(LED_B));
hex7decoder busOut (.in(TIME), .num(THEX));
assign LED_D = DONE;

begin
    if (PEEKb == 1)
        //DHEX[0:2] shows current 10-bit value on data bus
        hex7decoder busOut (.in(BUS), .num(DHEX0));
        hex7decoder busOut (.in(BUS), .num(DHEX1));
        hex7decoder busOut (.in(BUS), .num(DHEX2));
    else
        //DHEX[0:2] shows 10-bit output from register file Q1
        hex7decoder regOut (.in(REG), .num(DHEX0));
        hex7decoder busOut (.in(REG), .num(DHEX1));
        hex7decoder busOut (.in(REG), .num(DHEX2));
end



endmodule