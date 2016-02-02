//verilog code of 4-bit RippleCarryAdder using for FullAdders
module RipAdder4(CIN, A, B, SUM, COUT);
  input  CIN;
  input [3:0] A, B;
  output [3:0] SUM;
  output COUT;


  wire j1, j2, j3;

  FullAdder FA0(.A (A[0]), .B (B[0]), .Cin (CIN), .Cout (j1), .S (SUM[0]));
  FullAdder FA1(.A (A[1]), .B (B[1]), .Cin (j1), .Cout (j2), .S (SUM[1]));
  FullAdder FA2(.A (A[2]), .B (B[2]), .Cin (j2), .Cout (j3), .S (SUM[2]));
  FullAdder FA3(.A (A[3]), .B (B[3]), .Cin (j3), .Cout (COUT), .S (SUM[3]));


endmodule

