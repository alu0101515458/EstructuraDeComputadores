module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);

  reg Out = s ? B : A;

endmodule