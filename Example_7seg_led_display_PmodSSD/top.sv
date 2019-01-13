module top(
    input CLK100MHZ, // input clock
    input  sw0,      // button on/off display
    output [3:0] ja, // pmod JA, led segment 0 - 3
    output [3:0] jb  // pmod JB, led segment 4 - 7
    );
    
    localparam N=32;   // number of bits for counter, increase this num=slower increment hex num on display
    
    logic [7:0]   hex; // hex digit which will be on led display 
    logic [N-1:0] cnt; // counter

    // increment counter
    always @ (posedge CLK100MHZ)
    begin
        cnt = cnt + 1;
    end 

    assign hex = cnt[N-1:N-8]; // from counter we take number to display

    PmodSSD pmodSSD1 (.clk(cnt[8]), .on(sw0), .hex(hex), .seg( { jb[3:0], ja[3:0] } ) );
endmodule

// double 7 seg led display
module PmodSSD(
    input  clk, // clock is necessary, must be > 100Hz  and < 5MHz
    input  on,  // if on==1 then LED enabled, if on==0 then all segments are off
    input  [7:0] hex, // input digit to display
    output [7:0] seg  // 7-display selector, 6:0 - segments
    );

    logic dispNum = 0;  // flag for switch left-right display
    logic [3:0] hexVal; // value to show on left-right display
    always @(posedge clk)
    begin
        dispNum = ~dispNum;
        if(dispNum == 1) 
           hexVal = hex[7:4];
        else
           hexVal = hex[3:0];
    end

    logic [6:0] segVal;
    hexToSeg hts( .on(on), .hex(hexVal), .seg( segVal) ); 
    assign seg = {dispNum, segVal}; // set output led  
endmodule

//  ---A0--
//  |     |     
//  F5    B1
//  |     |
//  ---G6--
//  |     |     
//  E4    C2
//  |     |
//  ---D3--
//  0 - 0111111
//  1 - 0000110
//  2 - 1011011
//  3 - 1001111
//  4 - 1100100
//  5 - 1101101
//  6 - 1111101
//  7 - 0000111
//  8 - 1111111
//  9 - 1101111
//  A - 1110111
//  b - 1111100
//  C - 0111001
//  d - 1011110
//  E - 1111001
//  F - 1110001
module hexToSeg(
    input  on, // if on==1 then LED enabled, if on==0 then all segments are off
    input  [3:0] hex, // input digit to display
    output [6:0] seg  // output for seven led display
    );

assign seg = on==0  ? 7'b0000000 : 
             hex==0 ? 7'b0111111 : 
             hex==1 ? 7'b0000110 :
             hex==2 ? 7'b1011011 :
             hex==3 ? 7'b1001111 :
             hex==4 ? 7'b1100100 :
             hex==5 ? 7'b1101101 :
             hex==6 ? 7'b1111101 : 
             hex==7 ? 7'b0000111 : 
             hex==8 ? 7'b1111111 : 
             hex==9 ? 7'b1101111 : 
             hex==4'hA ? 7'b1110111 : 
             hex==4'hB ? 7'b1111100 : 
             hex==4'hC ? 7'b0111001 : 
             hex==4'hD ? 7'b1011110 : 
             hex==4'hE ? 7'b1111001 : 
             hex==4'hF ? 7'b1110001 : 
             7'b0000000; // blank 
                 
endmodule



