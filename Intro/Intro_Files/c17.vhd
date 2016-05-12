library IEEE;
use IEEE.std_logic_1164.all;

entity c17 is 
        port(
            N1, N2, N3, N6, N7 : in std_logic;
            N22, N23 : out std_logic
            ); 
end;

architecture DataFlow of c17 is
  signal G10, G11, G16, G19: std_logic;
begin
  G10 <= N1 nand N3;
  G11 <= N3 nand N6;
  G16 <= N2 nand G11;
  G19 <= G11 nand N7;
  N22 <= G10 nand G16;
  N23 <= G16 nand G19;
end;
