library ieee;
use ieee.std_logic_1164.all;

entity sum is port (
    a, b, cin : in  std_logic;
    s, cout   : out std_logic
);
end sum;

architecture rtl of sum is

begin

    cout <= (a and b) or (a and cin) or (b and cin);

    s    <= a xor b xor cin;

end rtl;
