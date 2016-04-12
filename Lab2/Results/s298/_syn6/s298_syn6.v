
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


  DFFX1 Q_reg ( .D(D), .CLK(CK), .Q(Q) );
endmodule


module s298 ( CK, G0, G1, G117, G118, G132, G133, G2, G66, G67 );
  input CK, G0, G1, G2;
  output G117, G118, G132, G133, G66, G67;
  wire   G10, G29, G11, G30, G12, G34, G13, G39, G14, G44, G15, G56, G16, G86,
         G17, G92, G18, G98, G19, G102, G20, G107, G21, G113, G22, G119, G23,
         G125, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91;
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
  OA22X1 U43 ( .IN1(n60), .IN2(n7), .IN3(n60), .IN4(n18), .Q(n17) );
  AO22X1 U45 ( .IN1(n75), .IN2(n22), .IN3(n23), .IN4(n87), .Q(n19) );
  NAND4X0 U46 ( .IN1(n29), .IN2(n72), .IN3(n88), .IN4(n76), .QN(n28) );
  NOR3X0 U51 ( .IN1(n35), .IN2(n85), .IN3(n53), .QN(G39) );
  XNOR2X1 U53 ( .IN1(n66), .IN2(n37), .Q(n35) );
  OA221X1 U54 ( .IN1(n40), .IN2(G29), .IN3(n77), .IN4(n61), .IN5(n39), .Q(G30)
         );
  XNOR2X1 U55 ( .IN1(G23), .IN2(G1), .Q(n41) );
  XNOR2X1 U56 ( .IN1(n72), .IN2(G2), .Q(n42) );
  OA22X1 U58 ( .IN1(n77), .IN2(n91), .IN3(G21), .IN4(n64), .Q(n43) );
  OA221X1 U59 ( .IN1(n58), .IN2(n7), .IN3(n58), .IN4(n6), .IN5(n46), .Q(n44)
         );
  AND3X1 U60 ( .IN1(n45), .IN2(n47), .IN3(n48), .Q(G102) );
  NAND4X0 U63 ( .IN1(n90), .IN2(n66), .IN3(n15), .IN4(n10), .QN(n47) );
  AO21X1 U64 ( .IN1(n50), .IN2(n9), .IN3(n51), .Q(n15) );
  OR3X1 U65 ( .IN1(n4), .IN2(n16), .IN3(n11), .Q(n50) );
  AND2X1 U66 ( .IN1(G23), .IN2(n90), .Q(n55) );
  NBUFFX2 U67 ( .INP(n36), .Z(n80) );
  INVX0 U68 ( .INP(G11), .ZN(n3) );
  NBUFFX2 U69 ( .INP(n70), .Z(n89) );
  NAND3X1 U70 ( .IN1(n21), .IN2(n3), .IN3(n90), .QN(n14) );
  NOR4X0 U71 ( .IN1(n85), .IN2(n37), .IN3(n80), .IN4(n38), .QN(G34) );
  NOR4X0 U72 ( .IN1(n24), .IN2(n67), .IN3(n62), .IN4(n25), .QN(G86) );
  NBUFFX2 U73 ( .INP(G12), .Z(n87) );
  INVX0 U74 ( .INP(n57), .ZN(n52) );
  NBUFFX2 U75 ( .INP(n33), .Z(n53) );
  AND3X1 U76 ( .IN1(n74), .IN2(n66), .IN3(n33), .Q(n56) );
  NOR4X0 U77 ( .IN1(n54), .IN2(n56), .IN3(n55), .IN4(n52), .QN(G44) );
  AND3X1 U78 ( .IN1(n34), .IN2(n12), .IN3(n64), .Q(n54) );
  NAND3X0 U79 ( .IN1(n15), .IN2(n7), .IN3(n49), .QN(n48) );
  NAND2X1 U80 ( .IN1(n81), .IN2(G13), .QN(n16) );
  INVX0 U81 ( .INP(n87), .ZN(n6) );
  INVX0 U82 ( .INP(G0), .ZN(n57) );
  AND4X1 U83 ( .IN1(n5), .IN2(n15), .IN3(n65), .IN4(n43), .Q(G113) );
  NBUFFX2 U84 ( .INP(G20), .Z(n58) );
  INVX0 U85 ( .INP(n5), .ZN(n62) );
  NBUFFX2 U86 ( .INP(G17), .Z(n59) );
  NBUFFX2 U87 ( .INP(G18), .Z(n60) );
  NBUFFX2 U88 ( .INP(G10), .Z(n61) );
  NOR4X0 U89 ( .IN1(n19), .IN2(n20), .IN3(n63), .IN4(n2), .QN(G92) );
  NBUFFX2 U90 ( .INP(n68), .Z(n86) );
  AOI21X1 U91 ( .IN1(n50), .IN2(n9), .IN3(n51), .QN(n63) );
  NOR4X1 U92 ( .IN1(n72), .IN2(n68), .IN3(n16), .IN4(n3), .QN(n51) );
  AND4X1 U93 ( .IN1(n11), .IN2(n66), .IN3(n77), .IN4(n29), .Q(n27) );
  NBUFFX2 U94 ( .INP(G11), .Z(n82) );
  NBUFFX2 U95 ( .INP(n82), .Z(n77) );
  NBUFFX2 U96 ( .INP(n78), .Z(n90) );
  NBUFFX2 U97 ( .INP(n78), .Z(n91) );
  INVX0 U98 ( .INP(n78), .ZN(n64) );
  NAND2X0 U99 ( .IN1(n86), .IN2(n74), .QN(n18) );
  INVX0 U100 ( .INP(n89), .ZN(n7) );
  INVX0 U101 ( .INP(n77), .ZN(n76) );
  NBUFFX2 U102 ( .INP(n70), .Z(n75) );
  NBUFFX2 U103 ( .INP(n16), .Z(n65) );
  NOR2X0 U104 ( .IN1(n87), .IN2(n74), .QN(n29) );
  NOR2X0 U105 ( .IN1(n84), .IN2(n26), .QN(G56) );
  INVX0 U106 ( .INP(n83), .ZN(n84) );
  NOR2X0 U107 ( .IN1(n90), .IN2(n88), .QN(n24) );
  OA21X1 U108 ( .IN1(n86), .IN2(n7), .IN3(n57), .Q(n40) );
  NOR2X0 U109 ( .IN1(n85), .IN2(n41), .QN(G125) );
  INVX0 U110 ( .INP(G19), .ZN(n10) );
  NOR2X0 U111 ( .IN1(n84), .IN2(n42), .QN(G119) );
  INVX0 U112 ( .INP(G22), .ZN(n11) );
  INVX0 U113 ( .INP(G0), .ZN(n83) );
  INVX0 U114 ( .INP(G15), .ZN(n9) );
  INVX0 U115 ( .INP(G23), .ZN(n12) );
  AND4X1 U116 ( .IN1(n14), .IN2(n15), .IN3(n65), .IN4(n17), .Q(G98) );
  INVX0 U117 ( .INP(n73), .ZN(n78) );
  NBUFFX2 U118 ( .INP(n89), .Z(n66) );
  NBUFFX2 U119 ( .INP(n63), .Z(n67) );
  NOR2X0 U120 ( .IN1(n59), .IN2(n18), .QN(n20) );
  NAND2X0 U121 ( .IN1(n59), .IN2(n91), .QN(n22) );
  NBUFFX2 U122 ( .INP(G12), .Z(n68) );
  INVX0 U123 ( .INP(G14), .ZN(n73) );
  INVX0 U124 ( .INP(n14), .ZN(n2) );
  INVX0 U125 ( .INP(n21), .ZN(n5) );
  NOR2X0 U126 ( .IN1(n86), .IN2(n75), .QN(n21) );
  INVX0 U127 ( .INP(n3), .ZN(n69) );
  NBUFFX2 U128 ( .INP(G13), .Z(n70) );
  INVX0 U129 ( .INP(G22), .ZN(n71) );
  INVX0 U130 ( .INP(n71), .ZN(n72) );
  INVX0 U131 ( .INP(n73), .ZN(n74) );
  OA21X1 U132 ( .IN1(n67), .IN2(n44), .IN3(n45), .Q(G107) );
  OA21X1 U133 ( .IN1(n27), .IN2(n9), .IN3(n28), .Q(n26) );
  NOR2X0 U134 ( .IN1(n39), .IN2(n6), .QN(n37) );
  INVX0 U135 ( .INP(n80), .ZN(n79) );
  OA22X1 U136 ( .IN1(n79), .IN2(n64), .IN3(n18), .IN4(n10), .Q(n49) );
  NAND2X0 U137 ( .IN1(n33), .IN2(n88), .QN(n34) );
  NOR2X0 U138 ( .IN1(n91), .IN2(n76), .QN(n23) );
  OA21X1 U139 ( .IN1(n76), .IN2(n5), .IN3(n91), .Q(n46) );
  NBUFFX2 U140 ( .INP(n75), .Z(n88) );
  NOR2X0 U141 ( .IN1(n52), .IN2(n61), .QN(G29) );
  AND2X1 U142 ( .IN1(n61), .IN2(n80), .Q(n33) );
  NAND2X0 U143 ( .IN1(G10), .IN2(n69), .QN(n39) );
  NOR2X0 U144 ( .IN1(n87), .IN2(n61), .QN(n38) );
  INVX0 U145 ( .INP(n36), .ZN(n4) );
  NOR2X0 U146 ( .IN1(n82), .IN2(G12), .QN(n36) );
  INVX0 U147 ( .INP(G14), .ZN(n81) );
  NAND2X0 U148 ( .IN1(n63), .IN2(n61), .QN(n45) );
  INVX0 U149 ( .INP(n83), .ZN(n85) );
  NOR2X0 U150 ( .IN1(G16), .IN2(n64), .QN(n25) );
endmodule

