
module HalfAdder_7 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  AND2X4 U2 ( .IN1(n2), .IN2(n1), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  NBUFFX2 U4 ( .INP(X), .Z(n2) );
endmodule


module HalfAdder_6 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  AND2X1 U2 ( .IN1(X), .IN2(Y), .Q(Cout) );
  INVX0 U1 ( .INP(n1), .ZN(n2) );
  DELLN1X2 U3 ( .INP(X), .Z(n1) );
  XNOR2X1 U4 ( .IN1(Y), .IN2(n2), .Q(Sum) );
endmodule


module FullAdder_3 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_7 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_6 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  XOR2X2 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
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
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module HalfAdder_2 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  IBUFFX16 U1 ( .INP(Y), .ZN(n1) );
  XNOR2X1 U3 ( .IN1(n1), .IN2(X), .Q(Sum) );
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
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module HalfAdder_4 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  DELLN1X2 U1 ( .INP(Y), .Z(n1) );
  XOR2X1 U3 ( .IN1(n1), .IN2(X), .Q(Sum) );
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
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module RipAdder4 ( CIN, A, B, SUM, COUT );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CIN;
  output COUT;
  wire   j1, j2, j3, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14;

  FullAdder_3 FA0 ( .A(A[0]), .B(B[0]), .Cin(n14), .Cout(j1), .S(SUM[0]) );
  FullAdder_2 FA1 ( .A(n8), .B(n2), .Cin(j1), .Cout(j2), .S(SUM[1]) );
  FullAdder_1 FA2 ( .A(n10), .B(n4), .Cin(j2), .Cout(j3), .S(SUM[2]) );
  FullAdder_0 FA3 ( .A(n12), .B(n6), .Cin(j3), .Cout(COUT), .S(SUM[3]) );
  INVX0 U1 ( .INP(B[1]), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n2) );
  INVX0 U3 ( .INP(B[2]), .ZN(n3) );
  INVX0 U4 ( .INP(n3), .ZN(n4) );
  INVX0 U5 ( .INP(B[3]), .ZN(n5) );
  INVX0 U6 ( .INP(n5), .ZN(n6) );
  INVX0 U7 ( .INP(A[1]), .ZN(n7) );
  INVX0 U8 ( .INP(n7), .ZN(n8) );
  INVX0 U9 ( .INP(A[2]), .ZN(n9) );
  INVX0 U10 ( .INP(n9), .ZN(n10) );
  INVX0 U11 ( .INP(A[3]), .ZN(n11) );
  INVX0 U12 ( .INP(n11), .ZN(n12) );
  INVX0 U13 ( .INP(CIN), .ZN(n13) );
  INVX0 U14 ( .INP(n13), .ZN(n14) );
endmodule

