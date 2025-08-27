`timescale 1ns/1ns

module CompuertasLogicas( 
    input A,
    input B,
    output D, 
    output O, 
    output NT, 
    output ND, 
    output NR, 
    output XR, 
    output XN 
);

assign D = A & B;     // AND
assign O = A | B;     // OR
assign NT = ~A;        // NOT 
assign ND = ~(A & B);  // NAND
assign NR = ~(A | B);  // NOR
assign XR = A ^ B;     // XOR
assign XN = ~(A ^ B);  // XNOR

endmodule
