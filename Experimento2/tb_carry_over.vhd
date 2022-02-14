entity tb_carry_over is end;

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

architecture test of tb_carry_over is
    component carry_over port (
        i1, i2, i3: in std_logic;
        y: out std_logic
    );
    end component;

    signal i: std_logic_vector (2 downto 0);

    -- Constantes de intervalos
    constant c : time := 20 ns;
    constant b : time := 10 ns;
    constant a : time := 5 ns;
begin
    c1: carry_over port map (i(0), i(1), i(2), open);

    i_0 : process
    begin
        i(0) <= '0', '1' after (a/2), '0' after a;
        wait for a;
    end process;

    i_1 : process
    begin
        i(1) <= '0', '1' after (b/2), '0' after b;
        wait for b;
    end process;

    i_2 : process
    begin
        i(2) <= '0', '1' after (c/2), '0' after c;
        wait for c;
    end process;
end test;
