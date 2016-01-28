
module FullAdder ( X, Y, Cin, Cout, Sum );
  input X, Y, Cin;
  output Cout, Sum;
  wire   N0, N1, N2, N3, N4;

  GTECH_XOR2 C8 ( .A(N0), .B(Cin), .Z(Sum) );
  GTECH_XOR2 C9 ( .A(X), .B(Y), .Z(N0) );
  GTECH_OR2 C10 ( .A(N3), .B(N4), .Z(Cout) );
  GTECH_OR2 C11 ( .A(N1), .B(N2), .Z(N3) );
  GTECH_AND2 C12 ( .A(X), .B(Y), .Z(N1) );
  GTECH_AND2 C13 ( .A(X), .B(Cin), .Z(N2) );
  GTECH_AND2 C14 ( .A(Y), .B(Cin), .Z(N4) );
endmodule

