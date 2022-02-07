library ieee;
use ieee.std_logic_1164.all;

entity mux8 is port (
    d : in  std_logic_vector (7 downto 0);
    s : in  std_logic_vector (2 downto 0);
    y : out std_logic
);
end mux8;

architecture rtl of mux8 is

begin

    y <= d(0) when s = "000" else
         d(1) when s = "001" else
         d(2) when s = "010" else
         d(3) when s = "011" else
         d(4) when s = "100" else
         d(5) when s = "101" else
         d(6) when s = "110" else
         d(7);

end rtl;
