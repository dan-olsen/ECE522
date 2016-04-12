
module HalfAdder_7 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n4, n5;

  XNOR2X2 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  IBUFFX16 U2 ( .INP(n1), .ZN(n4) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  INVX0 U4 ( .INP(X), .ZN(n2) );
  INVX0 U5 ( .INP(X), .ZN(n5) );
  NOR2X0 U6 ( .IN1(n5), .IN2(n4), .QN(Cout) );
endmodule


module HalfAdder_6 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  XOR2X1 U1 ( .IN1(Y), .IN2(n1), .Q(Sum) );
  DELLN1X2 U2 ( .INP(X), .Z(n1) );
  AND2X1 U3 ( .IN1(X), .IN2(Y), .Q(Cout) );
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


  AND2X1 U1 ( .IN1(Y), .IN2(X), .Q(Cout) );
  XOR2X2 U2 ( .IN1(Y), .IN2(X), .Q(Sum) );
endmodule


module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3, n4;

  NOR2X0 U1 ( .IN1(n4), .IN2(n3), .QN(Cout) );
  NBUFFX2 U2 ( .INP(Y), .Z(n1) );
  NBUFFX2 U3 ( .INP(X), .Z(n2) );
  INVX0 U4 ( .INP(n2), .ZN(n4) );
  INVX0 U5 ( .INP(n1), .ZN(n3) );
  XOR2X1 U6 ( .IN1(n1), .IN2(n2), .Q(Sum) );
endmodule


module FullAdder_0 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3, n1, n2;

  HalfAdder_1 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  NAND2X0 U1 ( .IN1(n1), .IN2(n2), .QN(Cout) );
  INVX0 U2 ( .INP(i3), .ZN(n1) );
  INVX0 U3 ( .INP(i1), .ZN(n2) );
endmodule


module HalfAdder_2 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  XNOR2X2 U1 ( .IN1(n1), .IN2(X), .Q(Sum) );
  IBUFFX16 U2 ( .INP(Y), .ZN(n1) );
  AND2X1 U3 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_3 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3, n4;

  NBUFFX2 U1 ( .INP(Y), .Z(n1) );
  NBUFFX2 U2 ( .INP(X), .Z(n2) );
  NOR2X0 U3 ( .IN1(n4), .IN2(n3), .QN(Cout) );
  INVX0 U4 ( .INP(n2), .ZN(n4) );
  INVX0 U5 ( .INP(n1), .ZN(n3) );
  XOR2X1 U6 ( .IN1(n1), .IN2(n2), .Q(Sum) );
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

  XOR2X1 U1 ( .IN1(n1), .IN2(X), .Q(Sum) );
  DELLN1X2 U2 ( .INP(Y), .Z(n1) );
  AND2X1 U3 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_5 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3, n4;

  NBUFFX2 U1 ( .INP(Y), .Z(n1) );
  NBUFFX2 U2 ( .INP(X), .Z(n2) );
  NOR2X0 U3 ( .IN1(n4), .IN2(n3), .QN(Cout) );
  INVX0 U4 ( .INP(n2), .ZN(n4) );
  INVX0 U5 ( .INP(n1), .ZN(n3) );
  XOR2X1 U6 ( .IN1(n1), .IN2(n2), .Q(Sum) );
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
  wire   j1, j2, j3, n1, n2;

  FullAdder_3 FA0 ( .A(A[0]), .B(B[0]), .Cin(n2), .Cout(j1), .S(SUM[0]) );
  FullAdder_2 FA1 ( .A(A[1]), .B(B[1]), .Cin(j1), .Cout(j2), .S(SUM[1]) );
  FullAdder_1 FA2 ( .A(A[2]), .B(B[2]), .Cin(j2), .Cout(j3), .S(SUM[2]) );
  FullAdder_0 FA3 ( .A(A[3]), .B(B[3]), .Cin(j3), .Cout(COUT), .S(SUM[3]) );
  INVX0 U1 ( .INP(CIN), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n2) );
endmodule

