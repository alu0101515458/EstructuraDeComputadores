module cl(output wire out, input wire a, b, input wire [1:0] S);

  wire conector1, conector2, conector3, conector4;
  and and1(conector1, a, b);
  or or1(conector2, a, b);
  xor xor1(conector3, a, b);
  not not1(conector4, a);
  
  mux4_1 mi_mux(out, conector1, conector2, conector3, conector4, S);

endmodule