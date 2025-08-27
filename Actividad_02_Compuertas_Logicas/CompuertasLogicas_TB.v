`timescale 1ns/1ns

module CompuertasLogicas_TB();

reg A_tb, B_tb;
wire D_tb, O_tb, NT_tb, ND_tb, NR_tb, XR_tb, XN_tb;

CompuertasLogicas DUV (.A(A_tb),.B(B_tb),.D(D_tb),.O(O_tb),.NT(NT_tb),.ND(ND_tb),
.NR(NR_tb),.XR(XR_tb),.XN(XN_tb));

initial 
begin
A_tb = 0;
B_tb = 0;
#100;
A_tb = 1;
B_tb = 0;
#100;
A_tb = 0;
B_tb = 1;
#100;
A_tb = 1;
B_tb = 1;
#100;
$stop; 
end

endmodule