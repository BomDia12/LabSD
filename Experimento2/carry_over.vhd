library ieee;
use ieee.std_logic_1164.all;

entity carry_over is port (
    i1, i2, i3: in std_logic;
    y: out std_logic
);
end carry_over;

architecture rtl of carry_over is

    signal s1, s2, s3: std_logic;

begin

    s1 <= i1 and i2;
    s2 <= i1 and i3;
    s3 <= i2 and i3;
    y  <= s1 or s2 or s3;

end rtl;
