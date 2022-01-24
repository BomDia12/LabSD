library IEEE;
use IEEE.std_logic_1164.all;

entity and3 is port (
    i1, i2, i3: in std_logic;
    y: out std_logic
);
end and3;

architecture rtl of and3 is
begin

y <= i1 and i2 and i3;

end rtl;