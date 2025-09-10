`timescale 1ns/1ns

module ALU_TB();
reg [3:0] selector;
reg [7:0] A;
reg [7:0] B;    
wire [15:0] C;
wire carry;
wire overflow;
wire negativo;
wire cero;
    
ALU DUV(
.selector(selector),
.A(A),
.B(B),
.C(C),
.carry(carry),
.overflow(overflow),
.negativo(negativo),
.cero(cero)
);
    
initial 
begin
selector = 4'b0000;
A = 8'b0;
B = 8'b0;
    
//suma 
selector = 4'b0000;
A = 8'd50;
B = 8'd30;
#100;
   
//suma
selector = 4'b0000; 
A = 8'd115;
B = 8'd45;
#100;

//resta
selector = 4'b0001;
A = 8'd40;
B = 8'd100;
#100;

//resta
selector = 4'b0001;
A = 8'd100;
B = 8'd40;
#100;

//multiplicacion
selector = 4'b0010;
A = 8'd15;
B = 8'd10;
#100;
        
//mayor que 
selector = 4'b0011;
A = 8'd50;
B = 8'd30;
#100;

//menor que        
selector = 4'b0100;
A = 8'd30; 
B = 8'd50; 
#100;

//igual que         
selector = 4'b0101;
A = 8'd50;
B = 8'd50; 
#100;
        
//AND, OR, XOR
A = 8'b10101010;
B = 8'b11001100;
//AND        
selector = 4'b0110; 
#100;
//OR        
selector = 4'b0111; 
#100;
//XOR        
selector = 4'b1000;
#100;
        
//shifts
A = 8'b10010110;
B = 8'd2;
//desplazamiento izquierdo        
selector = 4'b1001; 
#100;
//desplazamiento derecho        
selector = 4'b1010; 
#100;

//bandera 0 (resta)
selector = 4'b0001;
A = 8'd1;
B = 8'd1;
#100;

$stop;
end
    
endmodule