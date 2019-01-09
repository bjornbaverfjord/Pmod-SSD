module Pmod_SSD (
    input clk, [7:0] value,
    output reg [6:0] segments, 
    output reg digit_select
);

wire [3:0] curvalue = digit_select ? value[7:4] : value[3:0];
reg [14:0] timer;
wire ce = timer[14:0] == 15'h0; 

always @(posedge(clk)) begin
    timer <= timer + 1;

    if (ce) begin
        digit_select <= ~digit_select;
    end
end

always @(*) begin
    case (curvalue[3:0])
        4'h0 : segments <= 7'b1111011;
        4'h1 : segments <= 7'b0110000;
        4'h2 : segments <= 7'b1011101;
        4'h3 : segments <= 7'b1111100;
        4'h4 : segments <= 7'b0110110;
        4'h5 : segments <= 7'b1101110;
        4'h6 : segments <= 7'b1101111;
        4'h7 : segments <= 7'b0111000;
        4'h8 : segments <= 7'b1111111;
        4'h9 : segments <= 7'b1111110;
        4'ha : segments <= 7'b0111111;
        4'hb : segments <= 7'b1100111;
        4'hc : segments <= 7'b1001011;
        4'hd : segments <= 7'b1110101;
        4'he : segments <= 7'b1001111;
        4'hf : segments <= 7'b0001111;
    endcase    
end

endmodule



module Demo_Pmod_SSD (
    input CLK12MHZ,
    output [3:0] led, [3:0] jc, [3:0] jd
    );
    
    reg [28:0] counter = 0;
    assign led[3:0] = counter[24:21];
    
    always @ (posedge(CLK12MHZ)) begin
        counter <= counter + 1;       
    end
    
    Pmod_SSD Pmod_SSD (.clk(CLK12MHZ), .value(counter[28:21]), .segments({jc[3:0], jd[2:0]}), .digit_select(jd[3]));

endmodule