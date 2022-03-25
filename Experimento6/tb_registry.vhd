entity tb_registry is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_registry is

    signal i : std_logic_vector (9 downto 0) := "0000000000";

    component registry is
    port (
        d : in std_logic_vector (3 downto 0);
        l, r, dir, load, rst, clk : in std_logic;
        q : out std_logic_vector (3 downto 0)
    );
    end component;

    -- Timings
    constant time_0 : time := 2    ns;
    constant time_1 : time := 4    ns;
    constant time_2 : time := 8    ns;
    constant time_3 : time := 16   ns;
    constant time_4 : time := 32   ns;
    constant time_5 : time := 64   ns;
    constant time_6 : time := 128  ns;
    constant time_7 : time := 256  ns;
    constant time_8 : time := 512  ns;
    constant time_9 : time := 1024 ns;

begin
    
    subject : registry port map (
        clk  => i(0),
        r    => i(1),
        l    => i(2),
        dir  => i(3),
        d    => i(7 downto 4),
        load => i(8),
        rst  => i(9)
    );

    i(0) <= not i(0) after time_0/2;
    i(1) <= not i(1) after time_1/2;
    i(2) <= not i(2) after time_2/2;
    i(3) <= not i(3) after time_3/2;
    i(4) <= not i(4) after time_4/2;
    i(5) <= not i(5) after time_5/2;
    i(6) <= not i(6) after time_6/2;
    i(7) <= not i(7) after time_7/2;
    i(8) <= not i(8) after time_8/2;
    i(9) <= not i(9) after time_9/2;

end test;
