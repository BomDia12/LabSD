library IEEE;
use IEEE.std_logic_1164.all;

entity or2 is port (
    i1, i2: in std_logic;
    y: out std_logic
);
end or2;

architecture rtl of or2 is
begin
    
    y <= i1 or i2;

end rtl;
