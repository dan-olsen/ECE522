
module c17 ( clk, N1, N2, N3, N6, N7, N23, N22 );
  input clk, N1, N2, N3, N6, N7;
  output N23, N22;
  wire   N0, N4, N5, N8, N9, N12, N11, N10, N19, N16;

  GTECH_AND2 NAND_1 ( .A(N3), .B(N6), .Z(N0) );
  GTECH_NOT I_0 ( .A(N0), .Z(N11) );
  GTECH_AND2 NAND_2 ( .A(N1), .B(N3), .Z(N4) );
  GTECH_NOT I_1 ( .A(N4), .Z(N10) );
  GTECH_AND2 NAND_3 ( .A(N7), .B(N11), .Z(N5) );
  GTECH_NOT I_2 ( .A(N5), .Z(N19) );
  GTECH_AND2 NAND_4 ( .A(N2), .B(N11), .Z(N8) );
  GTECH_NOT I_3 ( .A(N8), .Z(N16) );
  GTECH_AND2 NAND_5 ( .A(N19), .B(N16), .Z(N9) );
  GTECH_NOT I_4 ( .A(N9), .Z(N23) );
  GTECH_AND2 NAND_6 ( .A(N10), .B(N16), .Z(N12) );
  GTECH_NOT I_5 ( .A(N12), .Z(N22) );
endmodule

