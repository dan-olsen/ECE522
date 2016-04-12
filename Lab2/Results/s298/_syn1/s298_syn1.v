
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
  INVX1 U3 ( .INP(n1), .ZN(Q) );
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
  wire   n1;

  DFFX1 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(Q) );
endmodule


module dff_12 ( CK, Q, D );
  input CK, D;
  output Q;
  wire   n1;

  DFFX2 Q_reg ( .D(D), .CLK(CK), .QN(n1) );
  INVX1 U3 ( .INP(n1), .ZN(Q) );
endmodule


module s298 ( CK, G0, G1, G117, G118, G132, G133, G2, G66, G67 );
  input CK, G0, G1, G2;
  output G117, G118, G132, G133, G66, G67;
  wire   G10, G11, G30, G12, G34, G13, G39, G14, G15, G56, G16, G86, G17, G92,
         G18, G98, G19, G102, G20, G107, G21, G113, G22, G119, G23, G125, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168;
  assign G66 = G16;
  assign G67 = G17;
  assign G117 = G18;
  assign G118 = G19;
  assign G132 = G20;
  assign G133 = G21;

  dff_13 DFF_0 ( .CK(CK), .Q(G10), .D(n54) );
  dff_12 DFF_1 ( .CK(CK), .Q(G11), .D(G30) );
  dff_11 DFF_2 ( .CK(CK), .Q(G12), .D(G34) );
  dff_10 DFF_3 ( .CK(CK), .Q(G13), .D(G39) );
  dff_9 DFF_4 ( .CK(CK), .Q(G14), .D(n168) );
  dff_8 DFF_5 ( .CK(CK), .Q(G15), .D(G56) );
  dff_7 DFF_6 ( .CK(CK), .Q(G16), .D(G86) );
  dff_6 DFF_7 ( .CK(CK), .Q(G17), .D(G92) );
  dff_5 DFF_8 ( .CK(CK), .Q(G18), .D(G98) );
  dff_4 DFF_9 ( .CK(CK), .Q(G19), .D(G102) );
  dff_3 DFF_10 ( .CK(CK), .Q(G20), .D(G107) );
  dff_2 DFF_11 ( .CK(CK), .Q(G21), .D(G113) );
  dff_1 DFF_12 ( .CK(CK), .Q(G22), .D(G119) );
  dff_0 DFF_13 ( .CK(CK), .Q(G23), .D(G125) );
  INVX0 U66 ( .INP(n67), .ZN(n52) );
  NOR4X1 U67 ( .IN1(n114), .IN2(n83), .IN3(n115), .IN4(n84), .QN(G113) );
  INVX0 U68 ( .INP(n79), .ZN(n80) );
  IBUFFX16 U69 ( .INP(G19), .ZN(n127) );
  NBUFFX4 U70 ( .INP(n108), .Z(n106) );
  INVX0 U71 ( .INP(n85), .ZN(n86) );
  NBUFFX2 U72 ( .INP(n76), .Z(n53) );
  NBUFFX2 U73 ( .INP(n62), .Z(n54) );
  NBUFFX2 U74 ( .INP(n77), .Z(n55) );
  NBUFFX2 U75 ( .INP(n91), .Z(n72) );
  NBUFFX2 U76 ( .INP(G0), .Z(n56) );
  NBUFFX4 U77 ( .INP(n151), .Z(n57) );
  NOR2X0 U78 ( .IN1(n60), .IN2(n146), .QN(n116) );
  OAI21X1 U79 ( .IN1(n74), .IN2(n136), .IN3(n135), .QN(n98) );
  NOR4X1 U80 ( .IN1(n148), .IN2(n145), .IN3(n97), .IN4(n144), .QN(G86) );
  MUX21X1 U81 ( .IN1(n129), .IN2(n128), .S(n106), .Q(n132) );
  AND3X1 U82 ( .IN1(n72), .IN2(n104), .IN3(n101), .Q(n129) );
  NBUFFX2 U83 ( .INP(G13), .Z(n107) );
  NAND3X0 U84 ( .IN1(n87), .IN2(n110), .IN3(n58), .QN(n139) );
  NBUFFX2 U85 ( .INP(n102), .Z(n58) );
  NBUFFX2 U86 ( .INP(G14), .Z(n81) );
  INVX0 U87 ( .INP(n99), .ZN(n59) );
  INVX0 U88 ( .INP(n59), .ZN(n60) );
  NBUFFX2 U89 ( .INP(n96), .Z(n61) );
  IBUFFX16 U90 ( .INP(n95), .ZN(n96) );
  XOR2X2 U91 ( .IN1(n159), .IN2(n55), .Q(n156) );
  NAND3X1 U92 ( .IN1(n105), .IN2(n96), .IN3(n163), .QN(n118) );
  AND2X4 U93 ( .IN1(n81), .IN2(n120), .Q(n63) );
  NBUFFX2 U94 ( .INP(n91), .Z(n110) );
  NBUFFX2 U95 ( .INP(n166), .Z(n93) );
  NOR2X0 U96 ( .IN1(n76), .IN2(n70), .QN(n62) );
  NBUFFX2 U97 ( .INP(G12), .Z(n99) );
  INVX0 U98 ( .INP(G18), .ZN(n135) );
  NOR2X0 U99 ( .IN1(n53), .IN2(n112), .QN(G119) );
  NOR2X0 U100 ( .IN1(n53), .IN2(n111), .QN(G125) );
  INVX0 U101 ( .INP(G23), .ZN(n150) );
  INVX0 U102 ( .INP(G20), .ZN(n117) );
  INVX0 U103 ( .INP(G16), .ZN(n143) );
  INVX0 U104 ( .INP(G21), .ZN(n113) );
  NAND3X1 U105 ( .IN1(n89), .IN2(n61), .IN3(n80), .QN(n140) );
  AOI21X1 U106 ( .IN1(n89), .IN2(n75), .IN3(n133), .QN(n147) );
  NBUFFX2 U107 ( .INP(n146), .Z(n64) );
  INVX0 U108 ( .INP(G22), .ZN(n146) );
  NOR2X0 U109 ( .IN1(n53), .IN2(n155), .QN(n157) );
  NBUFFX2 U110 ( .INP(n81), .Z(n65) );
  NBUFFX2 U111 ( .INP(n95), .Z(n66) );
  INVX0 U112 ( .INP(n107), .ZN(n67) );
  INVX0 U113 ( .INP(n94), .ZN(n68) );
  INVX0 U114 ( .INP(n134), .ZN(n115) );
  MUX21X2 U115 ( .IN1(n113), .IN2(n58), .S(n57), .Q(n114) );
  AND2X1 U116 ( .IN1(n134), .IN2(n133), .Q(n69) );
  NBUFFX2 U117 ( .INP(G10), .Z(n70) );
  INVX0 U118 ( .INP(n59), .ZN(n71) );
  AO22X1 U119 ( .IN1(n152), .IN2(n89), .IN3(n65), .IN4(n150), .Q(n153) );
  NAND2X0 U120 ( .IN1(n149), .IN2(n150), .QN(n152) );
  INVX0 U121 ( .INP(n109), .ZN(n73) );
  NBUFFX2 U122 ( .INP(n90), .Z(n74) );
  AND4X1 U123 ( .IN1(n90), .IN2(n105), .IN3(n64), .IN4(n96), .Q(n75) );
  NBUFFX2 U124 ( .INP(n56), .Z(n76) );
  INVX0 U125 ( .INP(G12), .ZN(n158) );
  NBUFFX2 U126 ( .INP(n67), .Z(n77) );
  AND4X4 U127 ( .IN1(n160), .IN2(n159), .IN3(n161), .IN4(n162), .Q(G34) );
  NBUFFX2 U128 ( .INP(n94), .Z(n78) );
  INVX0 U129 ( .INP(n99), .ZN(n79) );
  INVX0 U130 ( .INP(n109), .ZN(n151) );
  INVX0 U131 ( .INP(n56), .ZN(n162) );
  OR2X1 U132 ( .IN1(n77), .IN2(n72), .Q(n134) );
  NBUFFX2 U133 ( .INP(n110), .Z(n82) );
  INVX0 U134 ( .INP(n88), .ZN(n83) );
  NAND3X0 U135 ( .IN1(n118), .IN2(n63), .IN3(n119), .QN(n122) );
  NAND2X0 U136 ( .IN1(n117), .IN2(n74), .QN(n119) );
  INVX0 U137 ( .INP(n133), .ZN(n84) );
  INVX0 U138 ( .INP(G15), .ZN(n133) );
  NBUFFX2 U139 ( .INP(n90), .Z(n108) );
  MUX21X2 U140 ( .IN1(n92), .IN2(n143), .S(n65), .Q(n144) );
  NBUFFX2 U141 ( .INP(G14), .Z(n109) );
  INVX0 U142 ( .INP(G10), .ZN(n85) );
  NAND2X0 U143 ( .IN1(n104), .IN2(n93), .QN(n161) );
  AND2X1 U144 ( .IN1(n103), .IN2(n78), .Q(n87) );
  INVX0 U145 ( .INP(n87), .ZN(n88) );
  NAND2X0 U146 ( .IN1(n110), .IN2(n127), .QN(n128) );
  NBUFFX2 U147 ( .INP(n73), .Z(n89) );
  NBUFFX2 U148 ( .INP(G13), .Z(n90) );
  NBUFFX2 U149 ( .INP(G14), .Z(n91) );
  OA22X1 U150 ( .IN1(G17), .IN2(n92), .IN3(G17), .IN4(n137), .Q(n138) );
  NBUFFX2 U151 ( .INP(n78), .Z(n92) );
  OR3X2 U152 ( .IN1(n103), .IN2(n167), .IN3(n166), .Q(n159) );
  INVX0 U153 ( .INP(n137), .ZN(n136) );
  INVX0 U154 ( .INP(n70), .ZN(n166) );
  INVX0 U155 ( .INP(n107), .ZN(n94) );
  INVX0 U156 ( .INP(G11), .ZN(n95) );
  INVX0 U157 ( .INP(n160), .ZN(n155) );
  INVX0 U158 ( .INP(n52), .ZN(n163) );
  AND2X1 U159 ( .IN1(n130), .IN2(n123), .Q(G107) );
  INVX0 U160 ( .INP(n142), .ZN(n145) );
  NAND2X0 U161 ( .IN1(n126), .IN2(n86), .QN(n130) );
  NAND3X1 U162 ( .IN1(n142), .IN2(n122), .IN3(n141), .QN(n123) );
  INVX0 U163 ( .INP(n88), .ZN(n97) );
  AND3X1 U164 ( .IN1(n98), .IN2(n139), .IN3(n69), .Q(G98) );
  NBUFFX2 U165 ( .INP(n167), .Z(n100) );
  NBUFFX2 U166 ( .INP(n66), .Z(n101) );
  NBUFFX2 U167 ( .INP(n66), .Z(n102) );
  NBUFFX2 U168 ( .INP(n158), .Z(n103) );
  NBUFFX2 U169 ( .INP(n158), .Z(n104) );
  NBUFFX2 U170 ( .INP(n79), .Z(n105) );
  NAND2X0 U171 ( .IN1(n105), .IN2(n102), .QN(n160) );
  NOR2X0 U172 ( .IN1(G22), .IN2(n100), .QN(n121) );
  INVX0 U173 ( .INP(G11), .ZN(n167) );
  INVX0 U174 ( .INP(n141), .ZN(n148) );
  NAND2X0 U175 ( .IN1(n125), .IN2(n141), .QN(n126) );
  NAND2X0 U176 ( .IN1(n117), .IN2(n71), .QN(n120) );
  NAND2X0 U177 ( .IN1(G15), .IN2(n124), .QN(n142) );
  NAND2X0 U178 ( .IN1(n84), .IN2(n124), .QN(n125) );
  NAND2X0 U179 ( .IN1(n81), .IN2(n71), .QN(n137) );
  XOR2X1 U180 ( .IN1(n150), .IN2(G1), .Q(n111) );
  XOR2X1 U181 ( .IN1(n64), .IN2(G2), .Q(n112) );
  NAND4X0 U182 ( .IN1(n73), .IN2(n116), .IN3(n68), .IN4(n100), .QN(n141) );
  NAND4X0 U183 ( .IN1(n103), .IN2(n108), .IN3(n151), .IN4(n121), .QN(n124) );
  AO21X1 U184 ( .IN1(n136), .IN2(G19), .IN3(n84), .Q(n131) );
  OA21X1 U185 ( .IN1(n131), .IN2(n132), .IN3(n130), .Q(G102) );
  AND4X1 U186 ( .IN1(n140), .IN2(n69), .IN3(n139), .IN4(n138), .Q(G92) );
  OA21X1 U187 ( .IN1(n147), .IN2(n148), .IN3(n162), .Q(G56) );
  NAND4X0 U188 ( .IN1(n155), .IN2(n86), .IN3(n106), .IN4(n82), .QN(n154) );
  NAND4X0 U189 ( .IN1(n104), .IN2(n101), .IN3(n74), .IN4(n86), .QN(n149) );
  AND3X1 U190 ( .IN1(n154), .IN2(n153), .IN3(n162), .Q(n168) );
  OA21X1 U191 ( .IN1(n54), .IN2(n157), .IN3(n156), .Q(G39) );
  OA21X1 U192 ( .IN1(n163), .IN2(n80), .IN3(n162), .Q(n164) );
  AO22X1 U193 ( .IN1(n86), .IN2(n164), .IN3(n62), .IN4(n61), .Q(n165) );
  OA21X1 U194 ( .IN1(n101), .IN2(n93), .IN3(n165), .Q(G30) );
endmodule

