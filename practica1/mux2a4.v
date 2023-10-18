//Multiplexor de 2 entradas a una salida en el que las entradas son de 4 bits. Funcionamineto de un mux 2_1
module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);

  // Esta puede ser una opción.
  // Si aplicamos esta opción tendriamos que  camnbiar la salida Out de wire a reg
  // para poder almacenar los valores de Out

  /*always @(A, B, s)  // Cuando es un multiplexor, sabemos que las salidas van a cambiar, por eso --> always
    begin
      case (s)
      1'b0 Out = A;  // Colocamos 1'b ---> vemos que input wire s tiene solo 1 bit.
      1'b1 Out = B;  // Por tanto, solo dos opciones de salida, 0 y 1.
      endcase
    end
  */

  // Como es de 1 bit y tiene solo dos posibles salidas se puede hacer con un operador ternario de C
  // OPERADOR TERNARIO -> X = Y ? W:Z;
 
  assign Out = s ? B:A;

  //Si salida Out = 0 --> A
  //Si salida Out = 1 --> B
endmodule

