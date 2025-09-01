`timescale 1ns/1ns

module PRE_ALU_TB();

reg [3:0] A_tb;
reg [3:0] B_tb;
reg selector_tb;

wire [3:0] C_tb;

PRE_ALU DUV(
    .A(A_tb),
    .B(B_tb),
    .selector(selector_tb),
    .C(C_tb)
);

initial 
begin    
    // Caso 1: AND 
    selector_tb = 1'b0;
    A_tb = 4'd5;    // 0101
    B_tb = 4'd3;    // 0011
    #100;           // AND: 0101 & 0011 = 0001 (1)
    
    // Caso 2: SUMA 
    selector_tb = 1'b1;
    A_tb = 4'd5;    // 0101
    B_tb = 4'd3;    // 0011
    #100;           // SUMA: 5 + 3 = 8 (1000)
    
    // Caso 3: AND 
    selector_tb = 1'b0;
    A_tb = 4'd15;   // 1111
    B_tb = 4'd15;   // 1111
    #100;           // AND: 1111 & 1111 = 1111 (15)
    
    // Caso 4: SUMA
    selector_tb = 1'b1;
    A_tb = 4'd10;   // 1010
    B_tb = 4'd7;    // 0111
    #100;           // SUMA: 10 + 7 = 17 (10001)?(overflow) = 0001 (1) (por que solo son 4 bits (desbordamiento))
    
    // Caso 5: AND 
    selector_tb = 1'b0;
    A_tb = 4'd8;    // 1000
    B_tb = 4'd0;    // 0000
    #100;           // AND: 1000 & 0000 = 0000 (0)
    
    // Caso 6: SUMA 
    selector_tb = 1'b1;
    A_tb = 4'd7;    // 0111
    B_tb = 4'd7;    // 0111
    #100;           // SUMA: 7 + 7 = 14 (1110)
    
    $stop;
end

endmodule
