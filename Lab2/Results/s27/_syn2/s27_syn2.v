
module dff_2 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_0 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_1 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX2 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module s27 ( CK, G0, G1, G17, G2, G3 );
  input CK, G0, G1, G2, G3;
  output G17;
  wire   G5, G10, G6, G7, G13, n3, n4, n5, n6, n7, n8, n9;

  dff_2 DFF_0 ( .CK(CK), .Q(G5), .D(G10) );
  dff_1 DFF_1 ( .CK(CK), .Q(G6), .D(n9) );
  dff_0 DFF_2 ( .CK(CK), .Q(G7), .D(G13) );
  AND2X1 U8 ( .IN1(G17), .IN2(G0), .Q(G10) );
  NOR2X0 U11 ( .IN1(n7), .IN2(G3), .QN(n6) );
  AND2X1 U12 ( .IN1(G6), .IN2(n8), .Q(n7) );
  INVX0 U13 ( .INP(G0), .ZN(n8) );
  NOR2X0 U14 ( .IN1(G2), .IN2(n4), .QN(G13) );
  OA22X1 U15 ( .IN1(G0), .IN2(n3), .IN3(G7), .IN4(G1), .Q(n5) );
  INVX0 U16 ( .INP(G6), .ZN(n3) );
  NOR2X0 U17 ( .IN1(G1), .IN2(G7), .QN(n4) );
  OR3X1 U18 ( .IN1(n6), .IN2(n5), .IN3(G5), .Q(G17) );
  INVX0 U19 ( .INP(G17), .ZN(n9) );
endmodule

