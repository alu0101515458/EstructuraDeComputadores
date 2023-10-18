module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);
//Microcontrolador sin memoria de datos de un solo ciclo
// Instanciacion
wire [9:0]Current_pc, salida_mux_sum, New_pc, sal_mux_s;
wire [7:0]wd3, salida_rd1, salida_rd2, salida_alu;
wire [15:0]salida_mp;
memprog memoria(salida_mp, clk, Current_pc);
sum sumador(New_pc, Current_pc, salida_mux_sum);  //salida_mux_sum es el que entra a suma
regfile banco_registros(salida_rd1, salida_rd2, clk, we, salida_mp[11:8], salida_mp[7:4], salida_mp[3:0], wd3);
registro #(10)program_counter(Current_pc, clk, reset, New_pc);
alu alum(salida_alu, zero, carry, salida_rd1, salida_rd2, ALUOp);
mux2 #(10)mux_suma(salida_mux_sum, salida_mp[9:0], sal_mux_s, s_inc);
mux2 #(10)mux_(sal_mux_s, 10'b0000000001, 10'b0000000010, s_skip);
mux2 #(8)mux_alu(wd3, salida_alu, salida_mp[11:4], s_inm);

assign Opcode = salida_mp[15:10];
endmodule
