
/*Caja en la que entran los operandos A Y B de 4 bits.
    A se subdivide en :
        A[0] A[1]   A[2]   A[3]
    B se subdivide en :
        B[0] B[1]   B[2]   B[3]
        ....

*/
// La unidad lógica se basa en 4 celdas logicas de 4 bits 

module ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);

	cl cl0(Out[0], A[0], B[0], S);      // cl es el tipo y cl0 el nombre del tipo.
	cl cl1(Out[1], A[1], B[1], S);      // Out[0] es el bit, en este caso 0 es el menos significativo y 3 el más significativo
	cl cl2(Out[2], A[2], B[2], S);
	cl cl3(Out[3], A[3], B[3], S);

endmodule