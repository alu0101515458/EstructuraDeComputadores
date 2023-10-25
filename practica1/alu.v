// Unidad aritmetico logica de 4 bits.

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l); 
  
  //Instanciar señales de control interno.
  wire op1_A, op2_B, cpl, Cin0;

  //Asignar operaciones a las senales de control. ---> operacion resultado de los mapas de karnaugh
  // A ---> l  /// B ---> ALUOp[1] /// C ---> ALUOp[0]
  assign op1_A = ALUOp[1] | l;                          // op1_A = A + B
  assign op2_B = l | ALUOp[1] | ALUOp[0];               // op2_B = A + B + C
  assign cpl = (~ l) & (~ ALUOp[1]) | (~ l) & ALUOp[0]; // cpl = !A!B + !AC
  assign Cin0 = (~ ALUOp[1]) | ALUOp[0];                // cin0 = !B + C

  //Intanciar cables internos ---> de 4 bits
  wire[3:0] salida_Op1, salida_mux, salida_Op2, salida_sum4, salida_ul4;
  
  //Intanciar estructuras internas
  mux2_4 muxA(salida_Op1, 4'b0000, A, op1_A);      // 4'b0000 ---> 0 de 4 bits, MUX OP1_A
  mux2_4 muxB(salida_mux, A, B, op2_B);            // MUX OP2_B
  mux2_4 muxC(R, salida_sum4, salida_ul4, l);      // MUX OP1, OP2.
  compl1 complementador(salida_Op2, salida_mux, cpl);  // Complementador de 1 bit.
  sum4 sumador(salida_sum4, carry, salida_Op1, salida_Op2, Cin0);  // Sumador de 4 bits. TIENE CARRY.
  ul4 unidad_logica(salida_ul4, salida_Op1, salida_Op2, ALUOp);  // Unidad logica de 4 bits.

  // Diseñar las funciones lógicas de los flags.
  assign sign = R[3];                     // Como no importa, siempre bit más significativo de R ---> [3]
  assign zero = (R == 4'b0000) ? 1 : 0;   // (R == 0) ---> zero = 1 
   
endmodule