
module c17(clk,N1,N2,N3,N6,N7,N23,N22);
input clk, N1, N2, N3, N6, N7;
output N23, N22;
wire N11, N10, N19, N16;
	nand NAND_1(N11,N3,N6);
	nand NAND_2(N10,N1,N3);
	nand NAND_3(N19,N7,N11);
	nand NAND_4(N16,N2,N11);
	nand NAND_5(N23,N19,N16);
	nand NAND_6(N22,N10,N16);
endmodule


