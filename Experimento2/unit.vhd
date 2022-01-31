library ieee;
use ieee.std_logic_1164.all;

entity unit is port (
    i1, i2, i3 : in std_logic;
    y: out std_logic
);
end unit;

architecture rtl of unit is

    signal s : std_logic_vector (3 downto 0);

begin

    s(0) <= (not i1) and (not i2) and i3;
    s(1) <= (not i1) and i2 and (not i3);
    s(2) <= i1 and (not i2) and (not i3);
    s(3) <= i1 and i2 and i3;
    y <= s(0) or s(1) or s(2) or s(3);

end rtl;
