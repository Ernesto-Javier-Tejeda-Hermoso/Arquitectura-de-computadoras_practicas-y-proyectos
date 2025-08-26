`timescale 1ns/1ns

module  HA_TB();

//2.
reg A_tb, B_tb;
wire S_tb, AS_tb;

//3. assigns, instancias
//Dentro del párentesis al instanciar, se pone  

HA DUV (.A(A_tb),.B(B_tb), .S(S_tb), .AS(AS_tb));

//Initial sirve para comenzar a validar diferentes 
initial 
begin
A_tb = 0;
B_tb = 0;
//# significa unidades de tiempo (en este caso # vale 100 nanosegundos)
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
