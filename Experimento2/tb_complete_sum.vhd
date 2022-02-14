entity tb_complete_sum is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_complete_sum is
    component complete_sum
    port (
        i0, i1, i2 : in std_logic;
        c, u : out std_logic
    );
    end component;

    signal i : std_logic_vector (2 downto 0);

    -- Time Constants
    constant c : time := 20 ns;
    constant b : time := 10 ns;
    constant a : time := 5  ns;
begin
    sum : complete_sum port map (i(0), i(1), i(2), open);

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
