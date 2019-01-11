`timescale 1ns / 100ps

module top_testbench;  
    logic [3:0] ja;
    logic [2:0] jb;
    logic CLK100MHZ;
    
    top topSim(
        CLK100MHZ,
        ja,
        jb
        );
       
    // clock generation for simulation
    initial CLK100MHZ = 0; 
    always #5 CLK100MHZ = ~CLK100MHZ; 
    
endmodule
