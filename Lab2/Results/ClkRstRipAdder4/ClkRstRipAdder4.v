
module HalfAdder_7 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_6 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
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


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_3 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
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


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_5 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module FullAdder_2 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_5 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_4 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
endmodule


module ClkRstRipAdder4 ( CK, RST, CIN, A, B, SUM, COUT );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CK, RST, CIN;
  output COUT;
  wire   j1, i1, j2, i2, j3, i3, N3, N4, N5, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;

  FullAdder_3 FA0 ( .A(n11), .B(n3), .Cin(n19), .Cout(j1), .S(SUM[0]) );
  FullAdder_2 FA1 ( .A(n13), .B(n5), .Cin(i1), .Cout(j2), .S(SUM[1]) );
  FullAdder_1 FA2 ( .A(n15), .B(n7), .Cin(i2), .Cout(j3), .S(SUM[2]) );
  FullAdder_0 FA3 ( .A(n17), .B(n9), .Cin(i3), .Cout(COUT), .S(SUM[3]) );
  DFFX1 i1_reg ( .D(N3), .CLK(CK), .Q(i1) );
  DFFX1 i2_reg ( .D(N4), .CLK(CK), .Q(i2) );
  DFFX1 i3_reg ( .D(N5), .CLK(CK), .Q(i3) );
  AND2X1 U4 ( .IN1(j3), .IN2(n1), .Q(N5) );
  AND2X1 U5 ( .IN1(j2), .IN2(n1), .Q(N4) );
  AND2X1 U6 ( .IN1(j1), .IN2(n1), .Q(N3) );
  INVX0 U7 ( .INP(B[0]), .ZN(n2) );
  INVX0 U8 ( .INP(n2), .ZN(n3) );
  INVX0 U9 ( .INP(B[1]), .ZN(n4) );
  INVX0 U10 ( .INP(n4), .ZN(n5) );
  INVX0 U11 ( .INP(B[2]), .ZN(n6) );
  INVX0 U12 ( .INP(n6), .ZN(n7) );
  INVX0 U13 ( .INP(B[3]), .ZN(n8) );
  INVX0 U14 ( .INP(n8), .ZN(n9) );
  INVX0 U15 ( .INP(A[0]), .ZN(n10) );
  INVX0 U16 ( .INP(n10), .ZN(n11) );
  INVX0 U17 ( .INP(A[1]), .ZN(n12) );
  INVX0 U18 ( .INP(n12), .ZN(n13) );
  INVX0 U19 ( .INP(A[2]), .ZN(n14) );
  INVX0 U20 ( .INP(n14), .ZN(n15) );
  INVX0 U21 ( .INP(A[3]), .ZN(n16) );
  INVX0 U22 ( .INP(n16), .ZN(n17) );
  INVX0 U23 ( .INP(CIN), .ZN(n18) );
  INVX0 U24 ( .INP(n18), .ZN(n19) );
  INVX0 U25 ( .INP(RST), .ZN(n1) );
endmodule

