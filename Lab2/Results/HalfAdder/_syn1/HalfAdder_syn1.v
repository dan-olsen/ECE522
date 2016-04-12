
module HalfAdder ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  XNOR2X1 U3 ( .IN1(n1), .IN2(n2), .Q(Sum) );
  INVX0 U4 ( .INP(Y), .ZN(n1) );
  NBUFFX2 U5 ( .INP(X), .Z(n2) );
  AND2X4 U6 ( .IN1(n2), .IN2(Y), .Q(Cout) );
endmodule

