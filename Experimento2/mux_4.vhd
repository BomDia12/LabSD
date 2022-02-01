library ieee;
use ieee.std_logic_1164.all;

entity mux_4 is port (
    d : in std_logic_vector (3 downto 0);
    s : in std_logic_vector (1 downto 0);.
    y : out std_logic;
);
end mux_4;

architecture rtl of mux4 is

begin

    y <= d(0) when s = "00" else
         d(1) when s = "01" else
         d(2) when s = "10" else
         d(3);

end rtl;
