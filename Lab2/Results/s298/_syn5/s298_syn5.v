
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


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
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
  wire   n1;

  DFFX1 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module s298 ( CK, G0, G1, G117, G118, G132, G133, G2, G66, G67 );
  input CK, G0, G1, G2;
  output G117, G118, G132, G133, G66, G67;
  wire   G10, G29, G11, G30, G12, G34, G13, G39, G14, G44, G15, G56, G16, G86,
         G17, G92, G18, G98, G19, G102, G20, G107, G21, G113, G22, G119, G23,
         G125, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83;
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
  OA22X1 U43 ( .IN1(G18), .IN2(n7), .IN3(G18), .IN4(n18), .Q(n17) );
  NAND4X0 U46 ( .IN1(n68), .IN2(n64), .IN3(n80), .IN4(n29), .QN(n28) );
  AND4X1 U48 ( .IN1(n30), .IN2(n31), .IN3(n32), .IN4(n53), .Q(G44) );
  NOR3X0 U51 ( .IN1(n35), .IN2(n77), .IN3(n33), .QN(G39) );
  XNOR2X1 U53 ( .IN1(n59), .IN2(n37), .Q(n35) );
  OA221X1 U54 ( .IN1(n40), .IN2(G29), .IN3(n62), .IN4(n52), .IN5(n39), .Q(G30)
         );
  XNOR2X1 U55 ( .IN1(G23), .IN2(G1), .Q(n41) );
  XNOR2X1 U56 ( .IN1(n64), .IN2(G2), .Q(n42) );
  OA22X1 U58 ( .IN1(n73), .IN2(n83), .IN3(G21), .IN4(n57), .Q(n43) );
  OA221X1 U59 ( .IN1(G20), .IN2(n7), .IN3(G20), .IN4(n6), .IN5(n46), .Q(n44)
         );
  AND3X1 U60 ( .IN1(n45), .IN2(n47), .IN3(n48), .Q(G102) );
  NAND4X0 U63 ( .IN1(n82), .IN2(n59), .IN3(n15), .IN4(n10), .QN(n47) );
  AO21X1 U64 ( .IN1(n50), .IN2(n9), .IN3(n51), .Q(n15) );
  OR3X1 U65 ( .IN1(n4), .IN2(n16), .IN3(n11), .Q(n50) );
  NAND3X0 U66 ( .IN1(n66), .IN2(n59), .IN3(n33), .QN(n32) );
  NOR4X0 U67 ( .IN1(n19), .IN2(n20), .IN3(n56), .IN4(n2), .QN(G92) );
  AOI21X1 U68 ( .IN1(n50), .IN2(n9), .IN3(n51), .QN(n56) );
  NBUFFX2 U69 ( .INP(n36), .Z(n71) );
  NBUFFX2 U70 ( .INP(n63), .Z(n67) );
  NAND3X0 U71 ( .IN1(n21), .IN2(n68), .IN3(n82), .QN(n14) );
  NBUFFX2 U72 ( .INP(n63), .Z(n81) );
  INVX0 U73 ( .INP(G11), .ZN(n3) );
  INVX0 U74 ( .INP(n81), .ZN(n7) );
  NOR4X0 U75 ( .IN1(n77), .IN2(n38), .IN3(n37), .IN4(n71), .QN(G34) );
  NOR4X0 U76 ( .IN1(n24), .IN2(n60), .IN3(n55), .IN4(n25), .QN(G86) );
  AO22X1 U77 ( .IN1(n67), .IN2(n22), .IN3(n23), .IN4(n79), .Q(n19) );
  NBUFFX2 U78 ( .INP(G12), .Z(n61) );
  NBUFFX2 U79 ( .INP(G12), .Z(n79) );
  AND4X1 U80 ( .IN1(n11), .IN2(n59), .IN3(n62), .IN4(n29), .Q(n27) );
  NAND3X0 U81 ( .IN1(n15), .IN2(n7), .IN3(n49), .QN(n48) );
  INVX0 U82 ( .INP(n79), .ZN(n6) );
  NOR2X0 U83 ( .IN1(n39), .IN2(n6), .QN(n37) );
  DELLN1X2 U84 ( .INP(n16), .Z(n58) );
  NBUFFX2 U85 ( .INP(G10), .Z(n52) );
  INVX0 U86 ( .INP(G0), .ZN(n53) );
  INVX0 U87 ( .INP(n55), .ZN(n54) );
  INVX0 U88 ( .INP(n5), .ZN(n55) );
  NBUFFX2 U89 ( .INP(G11), .Z(n73) );
  NBUFFX2 U90 ( .INP(n61), .Z(n78) );
  NOR4X1 U91 ( .IN1(G22), .IN2(n61), .IN3(n16), .IN4(n3), .QN(n51) );
  NBUFFX2 U92 ( .INP(n69), .Z(n82) );
  NBUFFX2 U93 ( .INP(n69), .Z(n83) );
  INVX0 U94 ( .INP(n69), .ZN(n57) );
  NAND2X0 U95 ( .IN1(n78), .IN2(n66), .QN(n18) );
  INVX0 U96 ( .INP(n62), .ZN(n68) );
  NOR2X0 U97 ( .IN1(n79), .IN2(n66), .QN(n29) );
  NOR2X0 U98 ( .IN1(n76), .IN2(n26), .QN(G56) );
  INVX0 U99 ( .INP(n74), .ZN(n76) );
  NOR2X0 U100 ( .IN1(n82), .IN2(n80), .QN(n24) );
  AND4X1 U101 ( .IN1(n54), .IN2(n15), .IN3(n58), .IN4(n43), .Q(G113) );
  NAND2X0 U102 ( .IN1(G23), .IN2(n82), .QN(n31) );
  NAND3X0 U103 ( .IN1(n57), .IN2(n12), .IN3(n34), .QN(n30) );
  OA21X1 U104 ( .IN1(n78), .IN2(n7), .IN3(n53), .Q(n40) );
  NOR2X0 U105 ( .IN1(n77), .IN2(n41), .QN(G125) );
  NOR2X0 U106 ( .IN1(n76), .IN2(n42), .QN(G119) );
  INVX0 U107 ( .INP(G22), .ZN(n11) );
  INVX0 U108 ( .INP(G0), .ZN(n74) );
  INVX0 U109 ( .INP(G15), .ZN(n9) );
  INVX0 U110 ( .INP(G19), .ZN(n10) );
  INVX0 U111 ( .INP(G23), .ZN(n12) );
  AND4X1 U112 ( .IN1(n15), .IN2(n14), .IN3(n58), .IN4(n17), .Q(G98) );
  INVX0 U113 ( .INP(n65), .ZN(n69) );
  NBUFFX2 U114 ( .INP(n81), .Z(n59) );
  NBUFFX2 U115 ( .INP(n56), .Z(n60) );
  NOR2X0 U116 ( .IN1(G17), .IN2(n18), .QN(n20) );
  NAND2X0 U117 ( .IN1(G17), .IN2(n83), .QN(n22) );
  INVX0 U118 ( .INP(G14), .ZN(n65) );
  INVX0 U119 ( .INP(n14), .ZN(n2) );
  INVX0 U120 ( .INP(n21), .ZN(n5) );
  NOR2X0 U121 ( .IN1(n78), .IN2(n67), .QN(n21) );
  INVX0 U122 ( .INP(n3), .ZN(n62) );
  NBUFFX2 U123 ( .INP(G13), .Z(n63) );
  INVX0 U124 ( .INP(n11), .ZN(n64) );
  INVX0 U125 ( .INP(n65), .ZN(n66) );
  OA21X1 U126 ( .IN1(n60), .IN2(n44), .IN3(n45), .Q(G107) );
  OA21X1 U127 ( .IN1(n27), .IN2(n9), .IN3(n28), .Q(n26) );
  INVX0 U128 ( .INP(n71), .ZN(n70) );
  OA22X1 U129 ( .IN1(n70), .IN2(n57), .IN3(n18), .IN4(n10), .Q(n49) );
  NAND2X0 U130 ( .IN1(n33), .IN2(n67), .QN(n34) );
  NOR2X0 U131 ( .IN1(n83), .IN2(n68), .QN(n23) );
  OA21X1 U132 ( .IN1(n3), .IN2(n5), .IN3(n83), .Q(n46) );
  NBUFFX2 U133 ( .INP(n67), .Z(n80) );
  NOR2X0 U134 ( .IN1(n75), .IN2(G10), .QN(G29) );
  AND2X1 U135 ( .IN1(G10), .IN2(n71), .Q(n33) );
  NAND2X0 U136 ( .IN1(G10), .IN2(n62), .QN(n39) );
  NOR2X0 U137 ( .IN1(n79), .IN2(n52), .QN(n38) );
  INVX0 U138 ( .INP(n36), .ZN(n4) );
  NOR2X0 U139 ( .IN1(n73), .IN2(G12), .QN(n36) );
  INVX0 U140 ( .INP(G14), .ZN(n72) );
  NAND2X0 U141 ( .IN1(n56), .IN2(n52), .QN(n45) );
  INVX0 U142 ( .INP(n53), .ZN(n75) );
  INVX0 U143 ( .INP(n74), .ZN(n77) );
  NOR2X0 U144 ( .IN1(G16), .IN2(n57), .QN(n25) );
  NAND2X0 U145 ( .IN1(n72), .IN2(G13), .QN(n16) );
endmodule

