
module dff_2 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX2 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_0 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX1 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_1 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module s27 ( CK, G0, G1, G17, G2, G3 );
  input CK, G0, G1, G2, G3;
  output G17;
  wire   G5, G10, G6, G7, G13, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n21;

  dff_2 DFF_0 ( .CK(CK), .Q(G5), .D(G10) );
  dff_1 DFF_1 ( .CK(CK), .Q(G6), .D(n21) );
  dff_0 DFF_2 ( .CK(CK), .Q(G7), .D(G13) );
  NOR2X0 U11 ( .IN1(n19), .IN2(n18), .QN(G10) );
  NBUFFX4 U12 ( .INP(G5), .Z(n10) );
  AOI21X2 U13 ( .IN1(n8), .IN2(n14), .IN3(G2), .QN(G13) );
  AND2X4 U14 ( .IN1(n16), .IN2(n15), .Q(G17) );
  INVX0 U15 ( .INP(G0), .ZN(n18) );
  INVX0 U16 ( .INP(n17), .ZN(n11) );
  INVX0 U17 ( .INP(G1), .ZN(n14) );
  INVX0 U18 ( .INP(G7), .ZN(n8) );
  INVX0 U19 ( .INP(n8), .ZN(n9) );
  INVX0 U20 ( .INP(G7), .ZN(n13) );
  INVX0 U21 ( .INP(G5), .ZN(n12) );
  NAND2X0 U22 ( .IN1(n15), .IN2(n16), .QN(n21) );
  NAND3X0 U23 ( .IN1(n12), .IN2(n18), .IN3(G6), .QN(n16) );
  NAND2X1 U24 ( .IN1(G3), .IN2(n14), .QN(n17) );
  NAND3X0 U25 ( .IN1(n12), .IN2(n11), .IN3(n13), .QN(n15) );
  NOR3X0 U26 ( .IN1(n9), .IN2(n10), .IN3(n17), .QN(n19) );
endmodule

