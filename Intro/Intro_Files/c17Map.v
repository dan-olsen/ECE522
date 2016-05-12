
module c17 ( clk, N1, N2, N3, N6, N7, N23, N22 );
  input clk, N1, N2, N3, N6, N7;
  output N23, N22;
  wire   n4;

  OA21X1 U4 ( .IN1(N2), .IN2(N7), .IN3(n4), .Q(N23) );
  AO22X1 U5 ( .IN1(N1), .IN2(N3), .IN3(N2), .IN4(n4), .Q(N22) );
  NAND2X0 U6 ( .IN1(N6), .IN2(N3), .QN(n4) );
endmodule

