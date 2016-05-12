
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

  DFFX2 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_10 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX1 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
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
         G125, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n29, n30, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96;
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
  AO22X1 U45 ( .IN1(n92), .IN2(n22), .IN3(n23), .IN4(n91), .Q(n19) );
  NOR3X0 U51 ( .IN1(n35), .IN2(G0), .IN3(n33), .QN(G39) );
  OA221X1 U54 ( .IN1(n40), .IN2(G29), .IN3(n83), .IN4(n82), .IN5(n39), .Q(G30)
         );
  XNOR2X1 U55 ( .IN1(G23), .IN2(G1), .Q(n41) );
  XNOR2X1 U56 ( .IN1(n71), .IN2(G2), .Q(n42) );
  OA22X1 U58 ( .IN1(n83), .IN2(n95), .IN3(G21), .IN4(n72), .Q(n43) );
  OA221X1 U59 ( .IN1(G20), .IN2(n7), .IN3(G20), .IN4(n6), .IN5(n46), .Q(n44)
         );
  AND3X1 U60 ( .IN1(n48), .IN2(n47), .IN3(n45), .Q(G102) );
  NAND4X0 U63 ( .IN1(n85), .IN2(n93), .IN3(n86), .IN4(n10), .QN(n47) );
  OR3X1 U65 ( .IN1(n70), .IN2(n62), .IN3(n11), .Q(n50) );
  NAND3X0 U66 ( .IN1(n21), .IN2(n77), .IN3(n95), .QN(n14) );
  NOR4X0 U67 ( .IN1(n19), .IN2(n20), .IN3(n52), .IN4(n2), .QN(G92) );
  INVX0 U68 ( .INP(G15), .ZN(n9) );
  INVX0 U69 ( .INP(G22), .ZN(n11) );
  NBUFFX2 U70 ( .INP(G12), .Z(n89) );
  INVX0 U71 ( .INP(G19), .ZN(n10) );
  XNOR2X1 U72 ( .IN1(n37), .IN2(n93), .Q(n35) );
  NAND3X1 U73 ( .IN1(n72), .IN2(n12), .IN3(n34), .QN(n30) );
  NAND3X1 U74 ( .IN1(n85), .IN2(n93), .IN3(n33), .QN(n32) );
  AND4X1 U75 ( .IN1(n5), .IN2(n86), .IN3(n62), .IN4(n43), .Q(G113) );
  AND2X1 U76 ( .IN1(n59), .IN2(n60), .Q(n52) );
  OR3X1 U77 ( .IN1(n24), .IN2(n75), .IN3(n25), .Q(n53) );
  AND3X1 U78 ( .IN1(n29), .IN2(n11), .IN3(n83), .Q(n54) );
  NBUFFX4 U79 ( .INP(n73), .Z(n95) );
  NOR2X0 U80 ( .IN1(n55), .IN2(n78), .QN(n66) );
  AND2X1 U81 ( .IN1(G23), .IN2(n85), .Q(n55) );
  AND2X1 U82 ( .IN1(n56), .IN2(n64), .Q(n51) );
  NOR2X0 U83 ( .IN1(n71), .IN2(n65), .QN(n56) );
  INVX0 U84 ( .INP(n94), .ZN(n7) );
  OA22X1 U85 ( .IN1(G18), .IN2(n7), .IN3(G18), .IN4(n58), .Q(n17) );
  NAND2X0 U86 ( .IN1(n59), .IN2(n60), .QN(n57) );
  NBUFFX2 U87 ( .INP(n18), .Z(n58) );
  NAND2X0 U88 ( .IN1(n90), .IN2(n96), .QN(n18) );
  NAND2X0 U89 ( .IN1(n50), .IN2(n9), .QN(n59) );
  INVX0 U90 ( .INP(n51), .ZN(n60) );
  NBUFFX2 U91 ( .INP(n16), .Z(n61) );
  NOR4X0 U92 ( .IN1(G0), .IN2(n38), .IN3(n36), .IN4(n37), .QN(G34) );
  NBUFFX2 U93 ( .INP(n73), .Z(n84) );
  NBUFFX2 U94 ( .INP(n16), .Z(n62) );
  NOR2X0 U95 ( .IN1(n67), .IN2(n53), .QN(G86) );
  INVX0 U96 ( .INP(n5), .ZN(n75) );
  AO21X1 U97 ( .IN1(n50), .IN2(n9), .IN3(n51), .Q(n86) );
  AND2X1 U98 ( .IN1(n13), .IN2(n63), .Q(G56) );
  AO21X1 U99 ( .IN1(G15), .IN2(n68), .IN3(n69), .Q(n63) );
  NAND2X0 U100 ( .IN1(n93), .IN2(n54), .QN(n68) );
  NOR2X0 U101 ( .IN1(n80), .IN2(n61), .QN(n64) );
  NBUFFX2 U102 ( .INP(n3), .Z(n65) );
  AND3X1 U103 ( .IN1(n32), .IN2(n30), .IN3(n66), .Q(G44) );
  INVX0 U104 ( .INP(G14), .ZN(n8) );
  DELLN1X2 U105 ( .INP(G13), .Z(n92) );
  INVX0 U106 ( .INP(n91), .ZN(n6) );
  INVX0 U107 ( .INP(n79), .ZN(n80) );
  NOR2X0 U108 ( .IN1(n74), .IN2(n88), .QN(n36) );
  AND4X1 U109 ( .IN1(n29), .IN2(n71), .IN3(n92), .IN4(n77), .Q(n69) );
  AND2X1 U110 ( .IN1(G10), .IN2(n36), .Q(n33) );
  INVX0 U111 ( .INP(G10), .ZN(n81) );
  INVX0 U112 ( .INP(G23), .ZN(n12) );
  INVX0 U113 ( .INP(n57), .ZN(n67) );
  NAND3X0 U114 ( .IN1(n49), .IN2(n86), .IN3(n7), .QN(n48) );
  NOR2X0 U115 ( .IN1(n39), .IN2(n6), .QN(n37) );
  INVX0 U116 ( .INP(n14), .ZN(n2) );
  NBUFFX2 U117 ( .INP(G13), .Z(n94) );
  OR2X1 U118 ( .IN1(n89), .IN2(n88), .Q(n70) );
  NOR2X0 U119 ( .IN1(G17), .IN2(n58), .QN(n20) );
  NAND2X0 U120 ( .IN1(G17), .IN2(n84), .QN(n22) );
  NOR2X0 U121 ( .IN1(n91), .IN2(n82), .QN(n38) );
  AND4X1 U122 ( .IN1(n14), .IN2(n57), .IN3(n61), .IN4(n17), .Q(G98) );
  INVX0 U123 ( .INP(G11), .ZN(n3) );
  NOR2X0 U124 ( .IN1(n85), .IN2(n92), .QN(n24) );
  NAND2X0 U125 ( .IN1(n33), .IN2(n92), .QN(n34) );
  OA21X1 U126 ( .IN1(n90), .IN2(n7), .IN3(n13), .Q(n40) );
  NBUFFX2 U127 ( .INP(G22), .Z(n71) );
  INVX0 U128 ( .INP(G14), .ZN(n72) );
  INVX0 U129 ( .INP(n8), .ZN(n73) );
  NBUFFX2 U130 ( .INP(n84), .Z(n96) );
  INVX0 U131 ( .INP(G11), .ZN(n87) );
  INVX0 U132 ( .INP(n79), .ZN(n74) );
  INVX0 U133 ( .INP(G12), .ZN(n79) );
  INVX0 U134 ( .INP(n21), .ZN(n5) );
  NOR2X0 U135 ( .IN1(n90), .IN2(n94), .QN(n21) );
  INVX0 U136 ( .INP(n95), .ZN(n76) );
  INVX0 U137 ( .INP(n72), .ZN(n85) );
  OA22X1 U138 ( .IN1(n70), .IN2(n76), .IN3(n10), .IN4(n18), .Q(n49) );
  NBUFFX2 U139 ( .INP(n65), .Z(n77) );
  INVX0 U140 ( .INP(n13), .ZN(n78) );
  NOR2X0 U141 ( .IN1(n74), .IN2(n96), .QN(n29) );
  NBUFFX2 U142 ( .INP(n80), .Z(n91) );
  NBUFFX2 U143 ( .INP(n89), .Z(n90) );
  OA21X1 U144 ( .IN1(n44), .IN2(n67), .IN3(n45), .Q(G107) );
  NBUFFX2 U145 ( .INP(n94), .Z(n93) );
  INVX0 U146 ( .INP(n81), .ZN(n82) );
  NOR2X0 U147 ( .IN1(n95), .IN2(n77), .QN(n23) );
  OA21X1 U148 ( .IN1(n77), .IN2(n5), .IN3(n84), .Q(n46) );
  INVX0 U149 ( .INP(n3), .ZN(n83) );
  NAND2X0 U150 ( .IN1(G10), .IN2(n83), .QN(n39) );
  NOR2X0 U151 ( .IN1(n78), .IN2(n41), .QN(G125) );
  NOR2X0 U152 ( .IN1(n78), .IN2(n42), .QN(G119) );
  NOR2X0 U153 ( .IN1(G0), .IN2(G10), .QN(G29) );
  INVX0 U154 ( .INP(G0), .ZN(n13) );
  NAND2X0 U155 ( .IN1(n52), .IN2(n82), .QN(n45) );
  INVX0 U156 ( .INP(n87), .ZN(n88) );
  NOR2X0 U157 ( .IN1(G16), .IN2(n72), .QN(n25) );
  NAND2X0 U158 ( .IN1(n8), .IN2(G13), .QN(n16) );
endmodule

