
module c17 ( clk, N1, N2, N3, N6, N7, N23, N22 );
  input clk, N1, N2, N3, N6, N7;
  output N23, N22;
  wire   n5;

  AO22X1 U6 ( .IN1(N1), .IN2(N3), .IN3(N2), .IN4(n5), .Q(N22) );
  OA21X1 U7 ( .IN1(N2), .IN2(N7), .IN3(n5), .Q(N23) );
  NAND2X1 U8 ( .IN1(N6), .IN2(N3), .QN(n5) );
endmodule

