
module HalfAdder_7 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(n1), .IN2(n2), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  NBUFFX2 U4 ( .INP(X), .Z(n2) );
endmodule


module HalfAdder_6 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(Y), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  INVX0 U3 ( .INP(X), .ZN(n1) );
  INVX0 U4 ( .INP(n1), .ZN(n2) );
endmodule


module FullAdder_3 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_7 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_6 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module FullAdder_0 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_1 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
endmodule


module HalfAdder_2 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3;

  XOR2X1 U1 ( .IN1(n3), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  INVX0 U3 ( .INP(X), .ZN(n1) );
  INVX0 U4 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U5 ( .INP(Y), .Z(n3) );
endmodule


module HalfAdder_3 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(n1), .IN2(n2), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  NBUFFX2 U4 ( .INP(X), .Z(n2) );
endmodule


module FullAdder_1 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_3 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_2 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
endmodule


module HalfAdder_4 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3;

  XOR2X1 U1 ( .IN1(n3), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  INVX0 U3 ( .INP(X), .ZN(n1) );
  INVX0 U4 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U5 ( .INP(Y), .Z(n3) );
endmodule


module HalfAdder_5 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  AND2X1 U2 ( .IN1(n1), .IN2(n2), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  NBUFFX2 U4 ( .INP(X), .Z(n2) );
endmodule


module FullAdder_2 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_5 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_4 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
endmodule


module ClkRstRipAdder4 ( CK, RST, CIN, A, B, SUM, COUT, test_si, test_so, 
        test_se );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CK, RST, CIN, test_si, test_se;
  output COUT, test_so;
  wire   j1, i1, j2, i2, j3, i3, N3, N4, N5, n20, n21, n22, n23, n24, n25, n26,
         n38, n39, n41, n42;

  FullAdder_3 FA0 ( .A(A[0]), .B(B[0]), .Cin(n26), .Cout(j1), .S(SUM[0]) );
  FullAdder_2 FA1 ( .A(A[1]), .B(B[1]), .Cin(i1), .Cout(j2), .S(SUM[1]) );
  FullAdder_1 FA2 ( .A(A[2]), .B(B[2]), .Cin(i2), .Cout(j3), .S(SUM[2]) );
  FullAdder_0 FA3 ( .A(n24), .B(n22), .Cin(i3), .Cout(COUT), .S(SUM[3]) );
  AND2X1 U8 ( .IN1(j3), .IN2(n20), .Q(N5) );
  AND2X1 U9 ( .IN1(j2), .IN2(n20), .Q(N4) );
  AND2X1 U10 ( .IN1(j1), .IN2(n20), .Q(N3) );
  SDFFX1 i1_reg ( .D(N3), .SI(test_si), .SE(n42), .CLK(CK), .Q(i1), .QN(n39)
         );
  SDFFX1 i2_reg ( .D(N4), .SI(n39), .SE(n42), .CLK(CK), .Q(i2), .QN(n38) );
  SDFFX1 i3_reg ( .D(N5), .SI(n38), .SE(n42), .CLK(CK), .Q(i3), .QN(test_so)
         );
  INVX0 U11 ( .INP(B[3]), .ZN(n21) );
  INVX0 U12 ( .INP(n21), .ZN(n22) );
  INVX0 U13 ( .INP(A[3]), .ZN(n23) );
  INVX0 U14 ( .INP(n23), .ZN(n24) );
  INVX0 U15 ( .INP(CIN), .ZN(n25) );
  INVX0 U16 ( .INP(n25), .ZN(n26) );
  INVX0 U17 ( .INP(RST), .ZN(n20) );
  IBUFFX16 U18 ( .INP(test_se), .ZN(n41) );
  IBUFFX16 U19 ( .INP(n41), .ZN(n42) );
endmodule

