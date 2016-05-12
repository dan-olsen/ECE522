
module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2, n3, n4;

  XOR2X2 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  IBUFFX16 U2 ( .INP(n2), .ZN(n4) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
  NBUFFX2 U4 ( .INP(X), .Z(n2) );
  NOR2X0 U5 ( .IN1(n4), .IN2(n3), .QN(Cout) );
  INVX0 U6 ( .INP(n1), .ZN(n3) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  AND2X1 U1 ( .IN1(X), .IN2(Y), .Q(Cout) );
  XOR2X1 U2 ( .IN1(Y), .IN2(X), .Q(Sum) );
endmodule


module FullAdder ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3, n1, n2, n3, n4;

  HalfAdder_1 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(n2), .Cout(i3), .Sum(S) );
  INVX0 U2 ( .INP(Cin), .ZN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(n2) );
  NAND2X0 U4 ( .IN1(n3), .IN2(n4), .QN(Cout) );
  INVX0 U5 ( .INP(i3), .ZN(n3) );
  INVX0 U6 ( .INP(i1), .ZN(n4) );
endmodule

