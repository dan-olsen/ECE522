
module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n3, n4;

  XOR2X1 U1 ( .IN1(n3), .IN2(n4), .Q(Sum) );
  AND2X1 U2 ( .IN1(n4), .IN2(n3), .Q(Cout) );
  NBUFFX2 U3 ( .INP(Y), .Z(n3) );
  NBUFFX2 U4 ( .INP(X), .Z(n4) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(X), .IN2(Y), .Q(Cout) );
endmodule


module FullAdder ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3, n3, n4;

  HalfAdder_1 HA1 ( .X(A), .Y(B), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(n4), .Cout(i3), .Sum(S) );
  OR2X1 U2 ( .IN1(i3), .IN2(i1), .Q(Cout) );
  INVX0 U3 ( .INP(Cin), .ZN(n3) );
  INVX0 U4 ( .INP(n3), .ZN(n4) );
endmodule

