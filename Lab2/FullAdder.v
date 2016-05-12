//verilog code of FullAdder using two HalfAdders
module FullAdder(A, B, Cin, Cout, S);
  input A, B, Cin;
  output Cout, S;
  wire A, B, Cin;
  wire Cout, S;
  wire i1, i2, i3;
  HalfAdder HA1(.X (A), .Y (B), .Cout (i1), .Sum (i2));
  HalfAdder HA2(.X (i2), .Y (Cin), .Cout (i3), .Sum (S));
  or g1 (Cout, i3, i1);
endmodule

