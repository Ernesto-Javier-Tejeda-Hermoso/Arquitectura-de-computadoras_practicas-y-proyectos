`timescale 1ns/1ns

module PRE_ALU(
    input [3:0] A,
    input [3:0] B,
    input selector,        
    output reg [3:0] C  
);

always @(*)
begin
    case(selector)
        1'b0: C = A & B;  
        1'b1: C = A + B;  
    endcase
end

endmodule
