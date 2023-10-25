/*  Celda lógica -> 
Si la s es 00 devuelve a & b -----> entrada con puerta and
si 01 out -> a | b -------> puerta or
si 10 out -> a ^ b -------> puerta XOR
si 11 out -> ~ a -------> inverSor/ puerta NOT
*/ 

module cl(output wire out, input wire a, b, input wire [1:0] S); //output e input paalabras reservadas que solo se ppueden usar fuera.
    
  //Estructura interna.
  //Intanciar cables salidas internas
  wire salida_puerta_and, salida_puerta_or, salida_puerta_xor, salida_puerta_not;

  //Instanciar las puertas.
  and puerta_and(salida_puerta_and, a, b);     // and es el tipo y puerta_and es el nombre de la puerta instanciada.
  or puerta_or(salida_puerta_or, a, b);
  xor puerta_xor(salida_puerta_xor, a, b);
  not puerta_not(salida_puerta_not, a);
  mux4a1 mux(out, salida_puerta_and, salida_puerta_or, salida_puerta_xor, salida_puerta_not, S);
  
endmodule

/** Otra forma de hacer ---> hacer la celda logica pero usando reg.
module cl1(output reg out, input wire a, b, input wire [1:0] S);
  always @* begin
    case(S)
    2'b00: out = a & b;
    2'b01: out = a | b;
    2'b10: out = a ^ b;
    2'b11: out = ~ a;
  end
endmodule
