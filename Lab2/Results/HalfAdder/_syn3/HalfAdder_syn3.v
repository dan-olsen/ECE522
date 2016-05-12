
module HalfAdder ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  AND2X4 U3 ( .IN1(n2), .IN2(n1), .Q(Cout) );
  NBUFFX2 U4 ( .INP(Y), .Z(n1) );
  NBUFFX2 U5 ( .INP(X), .Z(n2) );
endmodule

