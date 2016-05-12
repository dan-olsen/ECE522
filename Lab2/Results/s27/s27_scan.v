
module dff_test_0 ( CK, Q, D, test_si, test_so, test_se );
  input CK, D, test_si, test_se;
  output Q, test_so;
  wire   n1;

  SDFFX1 Q_reg ( .D(D), .SI(test_si), .SE(test_se), .CLK(CK), .Q(test_so), 
        .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_test_1 ( CK, Q, D, test_si, test_so, test_se );
  input CK, D, test_si, test_se;
  output Q, test_so;


  SDFFX1 Q_reg ( .D(D), .SI(test_si), .SE(test_se), .CLK(CK), .Q(Q), .QN(
        test_so) );
endmodule


module dff_test_2 ( CK, Q, D, test_si, test_so, test_se );
  input CK, D, test_si, test_se;
  output Q, test_so;


  SDFFX1 Q_reg ( .D(D), .SI(test_si), .SE(test_se), .CLK(CK), .Q(Q), .QN(
        test_so) );
endmodule


module s27 ( CK, G0, G1, G17, G2, G3, test_si, test_so, test_se );
  input CK, G0, G1, G2, G3, test_si, test_se;
  output G17, test_so;
  wire   G5, G10, G6, G11, G7, G13, n11, n12, n14, n15, n16, n17, n18, n19,
         n20, n21, n24, n25, n27, n28, n29, n30;

  dff_test_2 DFF_0 ( .CK(CK), .Q(G5), .D(G10), .test_si(test_si), .test_so(n25), .test_se(n29) );
  dff_test_0 DFF_1 ( .CK(CK), .Q(G6), .D(G11), .test_si(n25), .test_so(n24), 
        .test_se(n30) );
  dff_test_1 DFF_2 ( .CK(CK), .Q(G7), .D(G13), .test_si(n24), .test_so(test_so), .test_se(n28) );
  AND2X1 U18 ( .IN1(n21), .IN2(G0), .Q(G10) );
  NOR3X0 U19 ( .IN1(n12), .IN2(G5), .IN3(n20), .QN(G11) );
  OR2X1 U21 ( .IN1(n14), .IN2(G3), .Q(n15) );
  NAND3X0 U22 ( .IN1(n15), .IN2(n16), .IN3(n17), .QN(n21) );
  INVX0 U23 ( .INP(n12), .ZN(n16) );
  INVX0 U24 ( .INP(G5), .ZN(n17) );
  AND2X1 U25 ( .IN1(G6), .IN2(n18), .Q(n14) );
  INVX0 U26 ( .INP(G0), .ZN(n18) );
  INVX0 U27 ( .INP(G11), .ZN(G17) );
  NOR2X0 U28 ( .IN1(G2), .IN2(n11), .QN(G13) );
  OA22X1 U29 ( .IN1(G0), .IN2(n19), .IN3(G1), .IN4(G7), .Q(n12) );
  INVX0 U30 ( .INP(G6), .ZN(n19) );
  NOR2X0 U31 ( .IN1(G1), .IN2(G7), .QN(n11) );
  NOR2X0 U32 ( .IN1(G3), .IN2(n14), .QN(n20) );
  IBUFFX16 U33 ( .INP(test_se), .ZN(n27) );
  IBUFFX16 U34 ( .INP(n27), .ZN(n28) );
  IBUFFX16 U35 ( .INP(n27), .ZN(n29) );
  IBUFFX16 U36 ( .INP(n27), .ZN(n30) );
endmodule

