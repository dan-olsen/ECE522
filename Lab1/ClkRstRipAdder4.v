//verilog code of 4-bit RippleCarryAdder using for FullAdders with Clock and Synchronous Reset
module ClkRstRipAdder4(CK,RST, CIN, A, B, SUM, COUT);
  input CK, CIN, RST;
  input [3:0] A, B;
  output [3:0] SUM;
  output COUT;

  reg i1, i2, i3;
  wire j1, j2, j3;

  FullAdder FA0(.A (A[0]), .B (B[0]), .Cin (CIN), .Cout (j1), .S (SUM[0]));
  FullAdder FA1(.A (A[1]), .B (B[1]), .Cin (i1), .Cout (j2), .S (SUM[1]));
  FullAdder FA2(.A (A[2]), .B (B[2]), .Cin (i2), .Cout (j3), .S (SUM[2]));
  FullAdder FA3(.A (A[3]), .B (B[3]), .Cin (i3), .Cout (COUT), .S (SUM[3]));

always  @(posedge CK) 
  begin
    if(RST)
      begin
        i1 <= 0 ;
        i2 <= 0 ;
        i3 <= 0 ; 
      end
    else
      begin
        i1 <= j1 ;
        i2 <= j2 ;
        i3 <= j3 ; 
      end
  end

endmodule
