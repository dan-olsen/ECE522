
module FullAdder ( X, Y, Cin, Cout, Sum );
  input X, Y, Cin;
  output Cout, Sum;
  wire   n2;

  XOR2X1 U4 ( .IN1(Y), .IN2(n2), .Q(Sum) );
  AO22X1 U5 ( .IN1(Cin), .IN2(X), .IN3(Y), .IN4(n2), .Q(Cout) );
  XOR2X1 U6 ( .IN1(Cin), .IN2(X), .Q(n2) );
endmodule

