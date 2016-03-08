
module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  NBUFFX2 U2 ( .INP(Y), .Z(n1) );
  NBUFFX2 U3 ( .INP(X), .Z(n2) );
  AND2X4 U4 ( .IN1(n2), .IN2(n1), .Q(Cout) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  XOR2X1 U1 ( .IN1(n1), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(X), .IN2(n1), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n1) );
endmodule


module FullAdder ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3;

  HalfAdder_1 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(Cin), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i3), .IN2(i1), .Q(Cout) );
endmodule

