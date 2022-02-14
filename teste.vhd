library IEEE;
use IEEE.std_logic_1164.all;

entity FULL_ADDER is
	port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end FULL_ADDER;

architecture FULL_ADDER_ARCH of FULL_ADDER is
	begin
		S <= A XOR B XOR Cin;
		Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);
end FULL_ADDER_ARCH;
