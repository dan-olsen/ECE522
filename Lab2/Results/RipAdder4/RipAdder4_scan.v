
module HalfAdder_7 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n3, n4;

  XOR2X1 U1 ( .IN1(n3), .IN2(n4), .Q(Sum) );
  AND2X4 U2 ( .IN1(n4), .IN2(n3), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n3) );
  NBUFFX2 U4 ( .INP(X), .Z(n4) );
endmodule


module HalfAdder_6 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n3, n4;

  AND2X1 U2 ( .IN1(X), .IN2(Y), .Q(Cout) );
  INVX0 U1 ( .INP(n3), .ZN(n4) );
  DELLN1X2 U3 ( .INP(X), .Z(n3) );
  XNOR2X1 U4 ( .IN1(Y), .IN2(n4), .Q(Sum) );
endmodule


module FullAdder_3 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_7 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_6 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module HalfAdder_5 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module HalfAdder_4 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n2;

  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  DELLN1X2 U1 ( .INP(Y), .Z(n2) );
  XOR2X1 U3 ( .IN1(n2), .IN2(X), .Q(Sum) );
endmodule


module FullAdder_2 ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_5 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_4 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule


module HalfAdder_2 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n2;

  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
  IBUFFX16 U1 ( .INP(Y), .ZN(n2) );
  XNOR2X1 U3 ( .IN1(n2), .IN2(X), .Q(Sum) );
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


module RipAdder4 ( CIN, A, B, SUM, COUT );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CIN;
  output COUT;
  wire   j1, j2, j3, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  FullAdder_3 FA0 ( .A(A[0]), .B(B[0]), .Cin(n28), .Cout(j1), .S(SUM[0]) );
  FullAdder_2 FA1 ( .A(n22), .B(n16), .Cin(j1), .Cout(j2), .S(SUM[1]) );
  FullAdder_1 FA2 ( .A(n24), .B(n18), .Cin(j2), .Cout(j3), .S(SUM[2]) );
  FullAdder_0 FA3 ( .A(n26), .B(n20), .Cin(j3), .Cout(COUT), .S(SUM[3]) );
  INVX0 U1 ( .INP(B[1]), .ZN(n15) );
  INVX0 U2 ( .INP(n15), .ZN(n16) );
  INVX0 U3 ( .INP(B[2]), .ZN(n17) );
  INVX0 U4 ( .INP(n17), .ZN(n18) );
  INVX0 U5 ( .INP(B[3]), .ZN(n19) );
  INVX0 U6 ( .INP(n19), .ZN(n20) );
  INVX0 U7 ( .INP(A[1]), .ZN(n21) );
  INVX0 U8 ( .INP(n21), .ZN(n22) );
  INVX0 U9 ( .INP(A[2]), .ZN(n23) );
  INVX0 U10 ( .INP(n23), .ZN(n24) );
  INVX0 U11 ( .INP(A[3]), .ZN(n25) );
  INVX0 U12 ( .INP(n25), .ZN(n26) );
  INVX0 U13 ( .INP(CIN), .ZN(n27) );
  INVX0 U14 ( .INP(n27), .ZN(n28) );
endmodule

