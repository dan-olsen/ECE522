
module c17 ( clk, N1, N2, N3, N6, N7, N23, N22 );
  input clk, N1, N2, N3, N6, N7;
  output N23, N22;
  wire   n6;

  AO22X1 U9 ( .IN1(N1), .IN2(N3), .IN3(N2), .IN4(n6), .Q(N22) );
  OA21X1 U10 ( .IN1(N2), .IN2(N7), .IN3(n6), .Q(N23) );
  NAND2X1 U11 ( .IN1(N6), .IN2(N3), .QN(n6) );
endmodule

