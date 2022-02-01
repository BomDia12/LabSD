library ieee;
use ieee.std_logic_1164.all;

entity complete_sum is port (
    i0, i1, i2 : in std_logic;
    c, u : out std_logic
);
end complete_sum;

architecture rtl of complete_sum is

    component carry_over
    port (
        i1, i2, i3 : in std_logic;
        y : out std_logic
    );
    end component;

    component unit
    port (
        i1, i2, i3 : in std_logic;
        y : out std_logic
    );
    end component;

begin

    carry: carry_over port map (i0, i1, i2, c);
    un   : unit       port map (i0, i1, i2, u);

end rtl;
