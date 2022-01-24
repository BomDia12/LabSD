library  IEEE;
use IEEE.std_logic_1164.all;

entity and2  is port (
i1  : in std_logic;
i2  : in  std_logic;
y   : out std_logic
);
end and2;

architecture rtl  of  and2  is

begin

y  <= i1 and  i2;

end rtl;
