`timescale 1ns/1ns

module ALU(
input [3:0] selector,  
input [7:0] A,
input [7:0] B,
output reg [15:0] C,    
output reg carry,        
output reg overflow,     
output reg negativo,     
output reg cero          
);
reg [16:0] D; 
    
always @(*) begin
C = 16'b0;
carry = 1'b0;
overflow = 1'b0;
negativo = 1'b0;
cero = 1'b0;
D = 17'b0;
    
case(selector)
4'b0000: begin // suma
D = {1'b0, A} + {1'b0, B};
C = D[15:0]; 
carry = D[8];
overflow = (A[7] == B[7]) && (C[7] != A[7]);
end
        
4'b0001: begin // resta
D = {1'b0, A} - {1'b0, B};
C = D[15:0]; 
carry = D[8];
overflow = (A[7] != B[7]) && (C[7] != A[7]);
end
        
4'b0010: begin // multiplicacion
D = A * B;       
C = D[15:0];
carry = 1'b0;            
overflow = 1'b0;             
end
        
4'b0011: begin // mayor que
C = (A > B) ? 16'd1 : 16'd0;
 end
        
4'b0100: begin // menor que
C = (A < B) ? 16'd1 : 16'd0;
end
        
4'b0101: begin // igual (comparacion)           
C = (A == B) ? 16'd1 : 16'd0;        
end
                
4'b0110: begin // AND           
C = A & B;        
end        
        
4'b0111: begin // OR            
C = A | B;        
end
                
4'b1000: begin // XOR            
C = A ^ B;        
end
                
4'b1001: begin // shift izquierda            
if (B < 16) begin                
C = A << B;                  
carry = (B > 0) ? A[8 - B] : 1'b0;            
end        
end
               
4'b1010: begin // Shift derecha            
C = A >> B;              
carry = (B > 0) ? A[B-1] : 1'b0;        
end
            
endcase
    
negativo = C[15];
cero = (C == 16'b0);
end

endmodule
