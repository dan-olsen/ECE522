
module HalfAdder ( X, Y, Cout, Sum );
  input X, Y;
  output Cout, Sum;
  wire   n1, n2;

  AND2X4 U3 ( .IN1(n1), .IN2(Y), .Q(Cout) );
  XNOR2X1 U4 ( .IN1(n2), .IN2(n1), .Q(Sum) );
  NBUFFX2 U5 ( .INP(X), .Z(n1) );
  INVX0 U6 ( .INP(Y), .ZN(n2) );
endmodule

