//verilog code of HalfAdders
module HalfAdder(X, Y, Cout, Sum);
  input X, Y;
  output Cout, Sum;
  wire X, Y;
  wire Cout, Sum;
  xor g1 (Sum, X, Y);
  and g2 (Cout, X, Y);
endmodule

