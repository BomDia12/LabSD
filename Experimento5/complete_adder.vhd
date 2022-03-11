library ieee;
use ieee.std_logic_1164.all;

entity complete_adder is port (
    a, b, cin : in  std_logic;
    s, cout   : out std_logic
);
end complete_adder;

architecture arch of complete_adder is
begin
    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end arch;
