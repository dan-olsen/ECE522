
module HalfAdder_1 ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;


  XOR2X1 U1 ( .IN1(Y), .IN2(X), .Q(Sum) );
  AND2X1 U2 ( .IN1(Y), .IN2(X), .Q(Cout) );
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
  wire   i1, i2, i3, n1, n2, n3, n4, n5, n6;

  HalfAdder_1 HA1 ( .X(n6), .Y(n4), .Cout(i1), .Sum(i2) );
  HalfAdder_0 HA2 ( .X(i2), .Y(n2), .Cout(i3), .Sum(S) );
  OR2X1 U1 ( .IN1(i1), .IN2(i3), .Q(Cout) );
  INVX0 U2 ( .INP(Cin), .ZN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(n2) );
  INVX0 U4 ( .INP(B), .ZN(n3) );
  INVX0 U5 ( .INP(n3), .ZN(n4) );
  INVX0 U6 ( .INP(A), .ZN(n5) );
  INVX0 U7 ( .INP(n5), .ZN(n6) );
endmodule

