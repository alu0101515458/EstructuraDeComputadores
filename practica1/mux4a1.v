 //Multiplexor de 4 entradas de un bit
module mux4a1(output reg out, input wire a, b, c, d, input wire [1:0] S); // Primero salida--> out

  always @(a, b,c, d,S)   // Bloque always donde se colocan todas las variables que sabemos que van a variar
    begin                
      case (S)            // El case tiene la misma funcion que el switch.           
      2'b00: out = a;     // colocamos un 2'b ---> porque [1:0] S tiene 2 bits.
      2'b01: out = b;     // 2 bits ---> 2^2 = 4 pposibilidades
      2'b10: out = c;
      2'b11: out = d;
      endcase
    end

endmodule

/*

----Es recomenadble colocar las salidas antes que las entradas.

~~~~~~~~PREGUNTAS~~~~~~~
1- Que diferencia existe entre wire y reg? para que sirve cada una?
Ambas son declaraciones de variables,
wire----> cable.
reg----> variables a las que podamos asignar valores.


2- Tipos de bloques:
  bloque always ----> Las variables sabemos que van a cambiar.
  bloque initial 

3- Assign ----> asignacion continua

*/