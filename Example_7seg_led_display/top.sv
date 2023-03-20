module top(
    input CLK100MHZ,
    output [3:0] ja, // pmod JA, led segment 0 - 3
    output [2:0] jb  // pmod JB, led segment 4 - 7
    );
    
    localparam N=32; 
    
    logic [3:0]   hex; // hex digit which will be on led display 
    logic [N-1:0] cnt; // counter

    // increment counter
    always @ (posedge CLK100MHZ)
    begin
        cnt <= cnt + 1;
    end 

    assign hex = cnt[N-1:N-5]; // take 4 MSB

    // show hex number on display
    led8seg ledL (.hex(hex), .seg( { jb[2:0], ja[3:0] } ));
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
module led8seg(
    input  [3:0] hex, // input digit to display
    output [6:0] seg  // output for seven led display
    );

assign seg = hex==0 ? 7'b0111111 : 
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


