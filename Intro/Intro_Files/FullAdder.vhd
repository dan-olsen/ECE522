library IEEE; 
use IEEE.std_logic_1164.all;

entity FullAdder is
	port( X, Y, Cin: in std_logic; Cout, Sum: out std_logic );
end FullAdder;

architecture Behave of FullAdder is
begin
	Sum  <= X xor Y xor Cin;
	Cout <= (X and Y) or (X and Cin) or (Y and Cin);
end;
