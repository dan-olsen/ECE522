
module dff_13 ( CK, Q, D );
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


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_2 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_3 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_4 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_5 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_6 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_7 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_8 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_9 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX1 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_10 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_11 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module dff_12 ( CK, Q, D );
  input CK, D;
  output Q;


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module s298 ( CK, G0, G1, G117, G118, G132, G133, G2, G66, G67 );
  input CK, G0, G1, G2;
  output G117, G118, G132, G133, G66, G67;
  wire   G10, G29, G11, G30, G12, G34, G13, G39, G14, G44, G15, G56, G16, G86,
         G17, G92, G18, G98, G19, G102, G20, G107, G21, G113, G22, G119, G23,
         G125, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82;
  assign G66 = G16;
  assign G67 = G17;
  assign G117 = G18;
  assign G118 = G19;
  assign G132 = G20;
  assign G133 = G21;

  dff_13 DFF_0 ( .CK(CK), .Q(G10), .D(G29) );
  dff_12 DFF_1 ( .CK(CK), .Q(G11), .D(G30) );
  dff_11 DFF_2 ( .CK(CK), .Q(G12), .D(G34) );
  dff_10 DFF_3 ( .CK(CK), .Q(G13), .D(G39) );
  dff_9 DFF_4 ( .CK(CK), .Q(G14), .D(G44) );
  dff_8 DFF_5 ( .CK(CK), .Q(G15), .D(G56) );
  dff_7 DFF_6 ( .CK(CK), .Q(G16), .D(G86) );
  dff_6 DFF_7 ( .CK(CK), .Q(G17), .D(G92) );
  dff_5 DFF_8 ( .CK(CK), .Q(G18), .D(G98) );
  dff_4 DFF_9 ( .CK(CK), .Q(G19), .D(G102) );
  dff_3 DFF_10 ( .CK(CK), .Q(G20), .D(G107) );
  dff_2 DFF_11 ( .CK(CK), .Q(G21), .D(G113) );
  dff_1 DFF_12 ( .CK(CK), .Q(G22), .D(G119) );
  dff_0 DFF_13 ( .CK(CK), .Q(G23), .D(G125) );
  NOR4X1 U13 ( .IN1(G0), .IN2(n37), .IN3(n66), .IN4(n38), .QN(G34) );
  AND4X1 U42 ( .IN1(n14), .IN2(n56), .IN3(n61), .IN4(n17), .Q(G98) );
  OA22X1 U43 ( .IN1(G18), .IN2(n7), .IN3(G18), .IN4(n18), .Q(n17) );
  AO22X1 U45 ( .IN1(n78), .IN2(n22), .IN3(n23), .IN4(n77), .Q(n19) );
  NAND4X0 U46 ( .IN1(n60), .IN2(n52), .IN3(n78), .IN4(n29), .QN(n28) );
  AND4X1 U48 ( .IN1(n30), .IN2(n31), .IN3(n32), .IN4(n13), .Q(G44) );
  OA221X1 U54 ( .IN1(n40), .IN2(G29), .IN3(n74), .IN4(n57), .IN5(n39), .Q(G30)
         );
  XNOR2X1 U55 ( .IN1(G23), .IN2(G1), .Q(n41) );
  OA22X1 U58 ( .IN1(n74), .IN2(n69), .IN3(G21), .IN4(n59), .Q(n43) );
  OA221X1 U59 ( .IN1(G20), .IN2(n7), .IN3(G20), .IN4(n6), .IN5(n46), .Q(n44)
         );
  AND3X1 U60 ( .IN1(n45), .IN2(n47), .IN3(n48), .Q(G102) );
  NAND4X0 U63 ( .IN1(n81), .IN2(n79), .IN3(n70), .IN4(n10), .QN(n47) );
  AO21X1 U64 ( .IN1(n50), .IN2(n9), .IN3(n51), .Q(n15) );
  NAND3X0 U66 ( .IN1(n21), .IN2(n60), .IN3(n81), .QN(n14) );
  NBUFFX2 U67 ( .INP(n8), .Z(n68) );
  NOR2X0 U68 ( .IN1(n61), .IN2(n53), .QN(n51) );
  INVX0 U69 ( .INP(n66), .ZN(n65) );
  INVX0 U70 ( .INP(G11), .ZN(n3) );
  INVX0 U71 ( .INP(n80), .ZN(n7) );
  INVX0 U72 ( .INP(n73), .ZN(n74) );
  AO21X1 U73 ( .IN1(n9), .IN2(n50), .IN3(n51), .Q(n70) );
  NOR2X0 U74 ( .IN1(n62), .IN2(n63), .QN(G39) );
  XNOR2X1 U75 ( .IN1(n37), .IN2(n79), .Q(n62) );
  INVX0 U76 ( .INP(n33), .ZN(n64) );
  NAND3X0 U77 ( .IN1(n69), .IN2(n79), .IN3(n33), .QN(n32) );
  NOR4X0 U78 ( .IN1(n19), .IN2(n20), .IN3(n1), .IN4(n2), .QN(G92) );
  XNOR2X1 U79 ( .IN1(n52), .IN2(G2), .Q(n42) );
  INVX0 U80 ( .INP(G11), .ZN(n73) );
  NBUFFX2 U81 ( .INP(G22), .Z(n52) );
  NBUFFX2 U82 ( .INP(n55), .Z(n69) );
  NBUFFX2 U83 ( .INP(n55), .Z(n82) );
  OR2X1 U84 ( .IN1(n58), .IN2(n3), .Q(n53) );
  NBUFFX2 U85 ( .INP(G12), .Z(n54) );
  OR3X1 U86 ( .IN1(n11), .IN2(n16), .IN3(n4), .Q(n50) );
  NBUFFX2 U87 ( .INP(G14), .Z(n55) );
  NBUFFX2 U88 ( .INP(n15), .Z(n56) );
  NBUFFX2 U89 ( .INP(G10), .Z(n57) );
  OR2X1 U90 ( .IN1(G22), .IN2(n75), .Q(n58) );
  NBUFFX2 U91 ( .INP(n68), .Z(n59) );
  NBUFFX2 U92 ( .INP(n3), .Z(n60) );
  NBUFFX2 U93 ( .INP(n16), .Z(n61) );
  NAND2X1 U94 ( .IN1(n64), .IN2(n71), .QN(n63) );
  AND4X1 U95 ( .IN1(n79), .IN2(n11), .IN3(n74), .IN4(n29), .Q(n27) );
  NBUFFX2 U96 ( .INP(n54), .Z(n76) );
  NAND3X0 U97 ( .IN1(n34), .IN2(n12), .IN3(n59), .QN(n30) );
  NBUFFX2 U98 ( .INP(n36), .Z(n66) );
  INVX0 U99 ( .INP(n21), .ZN(n5) );
  INVX0 U100 ( .INP(n72), .ZN(n13) );
  NAND3X0 U101 ( .IN1(n70), .IN2(n7), .IN3(n49), .QN(n48) );
  NOR2X0 U102 ( .IN1(n39), .IN2(n6), .QN(n37) );
  NOR2X0 U103 ( .IN1(n76), .IN2(n80), .QN(n21) );
  AND2X1 U104 ( .IN1(G10), .IN2(n66), .Q(n33) );
  NAND2X1 U105 ( .IN1(G23), .IN2(n81), .QN(n31) );
  NOR2X0 U106 ( .IN1(G17), .IN2(n18), .QN(n20) );
  INVX0 U107 ( .INP(n14), .ZN(n2) );
  NBUFFX2 U108 ( .INP(G13), .Z(n80) );
  NOR2X0 U109 ( .IN1(n81), .IN2(n78), .QN(n24) );
  AND4X1 U110 ( .IN1(n5), .IN2(n70), .IN3(n61), .IN4(n43), .Q(G113) );
  OA21X1 U111 ( .IN1(n76), .IN2(n7), .IN3(n13), .Q(n40) );
  NBUFFX2 U112 ( .INP(G12), .Z(n75) );
  INVX0 U113 ( .INP(G22), .ZN(n11) );
  DELLN1X2 U114 ( .INP(G13), .Z(n78) );
  INVX0 U115 ( .INP(G14), .ZN(n8) );
  NBUFFX2 U116 ( .INP(n54), .Z(n77) );
  NOR2X0 U117 ( .IN1(n72), .IN2(n42), .QN(G119) );
  NOR2X0 U118 ( .IN1(G0), .IN2(n41), .QN(G125) );
  INVX0 U119 ( .INP(G19), .ZN(n10) );
  INVX0 U120 ( .INP(G15), .ZN(n9) );
  INVX0 U121 ( .INP(G23), .ZN(n12) );
  NOR2X0 U122 ( .IN1(G0), .IN2(n26), .QN(G56) );
  NAND2X0 U123 ( .IN1(n33), .IN2(n78), .QN(n34) );
  NBUFFX2 U124 ( .INP(n80), .Z(n79) );
  NOR4X0 U125 ( .IN1(n67), .IN2(n24), .IN3(n21), .IN4(n25), .QN(G86) );
  INVX0 U126 ( .INP(n56), .ZN(n67) );
  OA21X1 U127 ( .IN1(n9), .IN2(n27), .IN3(n28), .Q(n26) );
  OA21X1 U128 ( .IN1(n44), .IN2(n67), .IN3(n45), .Q(G107) );
  AND2X1 U129 ( .IN1(n6), .IN2(n68), .Q(n29) );
  INVX0 U130 ( .INP(n77), .ZN(n6) );
  OA22X1 U131 ( .IN1(n65), .IN2(n68), .IN3(n18), .IN4(n10), .Q(n49) );
  NOR2X0 U132 ( .IN1(G11), .IN2(n75), .QN(n36) );
  INVX0 U133 ( .INP(n36), .ZN(n4) );
  NOR2X0 U134 ( .IN1(n69), .IN2(n60), .QN(n23) );
  NAND2X0 U135 ( .IN1(G17), .IN2(n69), .QN(n22) );
  OA21X1 U136 ( .IN1(n3), .IN2(n5), .IN3(n69), .Q(n46) );
  NAND2X0 U137 ( .IN1(n76), .IN2(n82), .QN(n18) );
  NOR2X0 U138 ( .IN1(n77), .IN2(n57), .QN(n38) );
  NAND2X0 U139 ( .IN1(G10), .IN2(n74), .QN(n39) );
  NOR2X0 U140 ( .IN1(n72), .IN2(G10), .QN(G29) );
  NBUFFX2 U141 ( .INP(n82), .Z(n81) );
  INVX0 U142 ( .INP(G0), .ZN(n71) );
  INVX0 U143 ( .INP(n71), .ZN(n72) );
  NAND2X0 U144 ( .IN1(n1), .IN2(n57), .QN(n45) );
  NOR2X0 U145 ( .IN1(G16), .IN2(n59), .QN(n25) );
  INVX0 U146 ( .INP(n15), .ZN(n1) );
  NAND2X0 U147 ( .IN1(G13), .IN2(n8), .QN(n16) );
endmodule

