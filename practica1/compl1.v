
/* Complementa a 1 un número de 4 bits.
MODOS DE HACER:
    - asignacion continua -> operador ternario.
    - bloque always y un if.
    - ...
*/
module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

  /* OPERADOR TERNARIO ---> Como solo tenemos dos opciones
    si cpl = 0 -> no complementa --> ~ Inp (operador de negacion not)
    si cpl = 1 -> comPlementa --> Inp
  */
  assign Out = cpl ? ~Inp : Inp;   

endmodule

/**
  module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);
    always @* begin
      if (cpl == 0) Out = Inp;
      else Out = ~ Inp;
  end
*/

