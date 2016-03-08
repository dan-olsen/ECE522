
module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1;

  XOR2X1 U1 ( .IN1(Y), .IN2(n1), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(n1), .Q(Cout) );
  NBUFFX2 U3 ( .INP(X), .Z(n1) );
endmodule


module HalfAdder_0 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
endmodule


module FullAdder ( A, B, Cin, Cout, S );
  input A, B, Cin;
  output Cout, S;
  wire   i1, i2, i3, n1, n2, n3;

  HalfAdder_1 HA1 ( .X(A), .Y(n3), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(n2), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
  INVX0 U2 ( .INP(Cin), .ZN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U4 ( .INP(B), .Z(n3) );
endmodule

