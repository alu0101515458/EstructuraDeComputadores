
// Fulladder haciendo con una asignación continua y operador de concatenación
//EL fulladder suma bit a bit
//  assign {cout, out} = a + b + cin;

module fa(output wire c_out, sum, input wire a, b, c_in);

assign {c_out, sum} = a + b + c_in;

endmodule

// Otra forma de hacer:
//Sumador completo (full-adder) de tres entradas de 1 bit realizado a partir de puertas l�gicas 
/*module fa(output wire sum, output wire c_out, input wire a, input wire b, input wire c_in);

    wire sum1, carry1, carry2;

    ha    ha1(sum1, carry1, a, b);
    ha    ha2(sum, carry2, c_in, sum1);
    or    or1(c_out, carry1, carry2);
endmodule
*/