module sigmo_lin32_tb;

wire signed [13:0] y, yexact;
reg signed [13:0] wcy;
reg signed [11:0] x, wcx;
real rx, ry, ryexact;

real ed, sed, ssed, med, wced;

always @* begin
    rx = x/256.0;
    ry = y/4096.0;
    ryexact = yexact/4096.0;
end

initial begin
    //$monitor("x = %d, y = %d, yexact = %d, rx = %f, ry = %f, ryexact = %f",x, y, yexact, rx, ry, ryexact);
    x = -2048;
    sed = 0;
    ssed = 0;
    wced = 0;
    forever begin
        #5
        if (y>yexact) ed = y-yexact; else ed = yexact-y;
        sed = sed + ed;
        ssed = ssed + ed*ed;
        if (ed>wced) begin wced = ed; wcx = x; wcy = y; end
        #5
        if (x==2047) begin
            //$display("wced = %f, wcx = %d, wcy = %d, med = %f, RMSE = %f",wced,wcx,wcy,sed/4096.0,$sqrt(ssed/4096.0));
            $display("RMSE = %f",$sqrt(ssed/4096.0));
            #1 $finish;
        end
        x = x + 1;
    end
end

sigmo_lin32 i0 (.y(y), .x(x));
sigmo_exact i1 (.y(yexact), .x(x));
endmodule
