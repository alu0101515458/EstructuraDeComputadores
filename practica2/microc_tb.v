// testbench para modulo microc.v
`timescale 1 ns/ 10ps   // Directiva que fija la unidad de tiempo de simulación
module microc_tb;
    
  reg clk, reset;   // Intanciamos cable del reloj
  wire[5:0] t_Opc; // Intanciamos el cable del opcode
  reg [2:0] t_AOp;
  reg t_s, t_skip, t_inc, t_inm, t_we;
  wire t_z, t_c;

  // Intanciamos modulo a testear
  microc microc1(t_Opc, t_z, t_c, clk, reset, t_skip, t_inc, t_inm, t_we, t_AOp);
  always begin
    clk = 1;
    #20;
    clk = 0;
    #20;
  end

  initial begin
    $dumpfile("microc.vcd");
    $dumpvars;
    reset = 1;
    #20;
    reset = 0;
  end

  initial begin
    // LI #3, R5  ---> Primera instrucción li
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b1;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // LI #1, R4 ---> Segunda intrucción li
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b1;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // IT: OR, R0, R5, 53 ----> R3 <-- R0 | R5
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b101;
    #20;
    // ADD R3, R4, R3 ----> R5 <-- R5 + R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b010;
    #20;
    // SUB R5, R4, R5 ----> R5 <-- R5 - R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b011;
    #20;
    // SKIPGT R5, R0 ----> Salta si R5 > R0
    t_inc = 1'b1;
    t_skip = 1'b1;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // JR IT ----> Salto relativo a IT  ------------- PRIMER SALTO ------------------
    t_inc = 1'b0;
    t_skip = 1'b1;
    t_inm = 1'b1;
    t_we = 1'b0;
    t_AOp = 3'b000;
    #20;
    // IT: OR, R0, R5, 53 ----> R3 <-- R0 | R5
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b101;
    #20;
    // ADD R3, R4, R3 ----> R5 <-- R5 + R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b010;
    #20;
    // SUB R5, R4, R5 ----> R5 <-- R5 - R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b011;
    #20;
    // SKIPGT R5, R0 ----> Salta si R5 > R0
    t_inc = 1'b1;
    t_skip = 1'b1;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // JR IT ----> Salto relativo a IT ------------------- SEGUNDO SALTO --------------------
    t_inc = 1'b0;
    t_skip = 1'b1;
    t_inm = 1'b1;
    t_we = 1'b0;
    t_AOp = 3'b000;
    #20;
    // IT: OR, R0, R5, 53 ----> R3 <-- R0 | R5
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b101;
    #20;
    // ADD R3, R4, R3 ----> R5 <-- R5 + R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b010;
    #20;
    // SUB R5, R4, R5 ----> R5 <-- R5 - R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b011;
    #20;
    // SKIPGT R5, R0 ----> Salta si R5 > R0
    t_inc = 1'b1;
    t_skip = 1'b1;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // JR IT ----> Salto relativo a IT ------------------- TERCER SALTO --------------------
    t_inc = 1'b0;
    t_skip = 1'b1;
    t_inm = 1'b1;
    t_we = 1'b0;
    t_AOp = 3'b000;
    #20;
    // IT: OR, R0, R5, 53 ----> R3 <-- R0 | R5
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b101;
    #20;
    // ADD R3, R4, R3 ----> R5 <-- R5 + R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b010;
    #20;
    // SUB R5, R4, R5 ----> R5 <-- R5 - R4
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b011;
    #20;
    // SKIPGT R5, R0 ----> Salta si R5 > R0
    t_inc = 1'b1;
    t_skip = 1'b0;
    t_inm = 1'b0;
    t_we = 1'b1;
    t_AOp = 3'b000;
    #20;
    // FIN: JR FIN -------------------------- FIN --------------------
    t_inc = 1'b0;
    t_skip = 1'b1;
    t_inm = 1'b0;
    t_we = 1'b0;
    t_AOp = 3'b000;
    #20;
    $finish;
  end    
endmodule