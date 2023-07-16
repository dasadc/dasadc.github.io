module sigmo_lin32(output signed [13:0] y, input signed [11:0] x);
wire [11:0] xabs = (x>=0) ? x : -x;
reg [14:0] f0, k;
always @* begin
    case (xabs[11:5])
    0: begin f0 = 8192; k = 16; end
    1: begin f0 = 8704; k = 16; end
    2: begin f0 = 9212; k = 16; end
    3: begin f0 = 9712; k = 15; end
    4: begin f0 = 10200; k = 15; end
    5: begin f0 = 10672; k = 14; end
    6: begin f0 = 11128; k = 14; end
    7: begin f0 = 11564; k = 13; end
    8: begin f0 = 11976; k = 12; end
    9: begin f0 = 12368; k = 12; end
    10: begin f0 = 12736; k = 11; end
    11: begin f0 = 13076; k = 10; end
    12: begin f0 = 13396; k = 9; end
    13: begin f0 = 13688; k = 8; end
    14: begin f0 = 13960; k = 8; end
    15: begin f0 = 14204; k = 7; end
    16: begin f0 = 14432; k = 6; end
    17: begin f0 = 14636; k = 6; end
    18: begin f0 = 14820; k = 5; end
    19: begin f0 = 14988; k = 5; end
    20: begin f0 = 15140; k = 4; end
    21: begin f0 = 15276; k = 4; end
    22: begin f0 = 15400; k = 3; end
    23: begin f0 = 15508; k = 3; end
    24: begin f0 = 15608; k = 3; end
    25: begin f0 = 15696; k = 2; end
    26: begin f0 = 15772; k = 2; end
    27: begin f0 = 15840; k = 2; end
    28: begin f0 = 15904; k = 2; end
    29: begin f0 = 15960; k = 2; end
    30: begin f0 = 16008; k = 1; end
    31: begin f0 = 16052; k = 1; end
    32: begin f0 = 16088; k = 1; end
    33: begin f0 = 16124; k = 1; end
    34: begin f0 = 16152; k = 1; end
    35: begin f0 = 16180; k = 1; end
    36: begin f0 = 16204; k = 1; end
    37: begin f0 = 16224; k = 1; end
    38: begin f0 = 16244; k = 0; end
    39: begin f0 = 16260; k = 0; end
    40: begin f0 = 16276; k = 0; end
    41: begin f0 = 16288; k = 0; end
    42: begin f0 = 16300; k = 0; end
    43: begin f0 = 16308; k = 0; end
    44: begin f0 = 16316; k = 0; end
    45: begin f0 = 16324; k = 0; end
    46: begin f0 = 16332; k = 0; end
    47: begin f0 = 16340; k = 0; end
    48: begin f0 = 16344; k = 0; end
    49: begin f0 = 16348; k = 0; end
    50: begin f0 = 16352; k = 0; end
    51: begin f0 = 16356; k = 0; end
    52: begin f0 = 16360; k = 0; end
    53: begin f0 = 16364; k = 0; end
    54: begin f0 = 16364; k = 0; end
    55: begin f0 = 16368; k = 0; end
    56: begin f0 = 16368; k = 0; end
    57: begin f0 = 16372; k = 0; end
    58: begin f0 = 16372; k = 0; end
    59: begin f0 = 16372; k = 0; end
    60: begin f0 = 16376; k = 0; end
    61: begin f0 = 16376; k = 0; end
    62: begin f0 = 16376; k = 0; end
    63: begin f0 = 16376; k = 0; end
    default: begin f0 = 16379; k = 0; end
    endcase
end
wire signed [15:0] yt0 = k*xabs[4:0] + f0;
wire signed [13:0] yt = yt0/4;
wire signed [13:0] diff = 0;
//compensation compensation (.diff(diff), .x(128-xt[6:0]));
wire signed [13:0] yu = yt - diff;
assign y = (x < 0) ? 4096 - yu : yu;
endmodule
