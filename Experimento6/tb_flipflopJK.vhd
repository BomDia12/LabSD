library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflop_jk is end;

architecture test of tb_flipflop_jk is

    signal i : std_logic_vector (4 downto 0) := "00000";

    -- Time constants
    constant time_0 : time := 2   ns;
    constant time_1 : time := 4   ns;
    constant time_2 : time := 8   ns;
    constant time_3 : time := 16  ns;
    constant time_4 : time := 32  ns;

    component flipflop_jk is
    port (
        clk, j, k, clr, pr : in std_logic;
        q : out std_logic
    );
    end component;

begin

    subject : flipflop_jk port map (i(0), i(1), i(2), i(3), i(4), q => open);

    i(0) <= not i(0) after time_0/2;
    i(1) <= not i(1) after time_1/2;
    i(2) <= not i(2) after time_2/2;
    i(3) <= not i(3) after time_3/2;
    i(4) <= not i(4) after time_4/2;

end test ; -- test
