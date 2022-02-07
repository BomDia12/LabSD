entity tb_decoder is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_decoder is

    component decoder
    port (
        s : in  std_logic_vector (3  downto 0);
        d : out std_logic_vector (15 downto 0)
    );
    end component;

    signal i : std_logic_vector (3 downto 0);

    -- Time Constants
    constant e : time := 8 ns;
    constant c : time := 4 ns;
    constant b : time := 2 ns;
    constant a : time := 1 ns;

begin

    d : decoder port map (s => i, d => open);

    i_0 : process
    begin
        i(0) <= '0', '1' after a/2, '0' after a;
        wait for a;
    end process;

    i_1 : process
    begin
        i(1) <= '0', '1' after b/2, '0' after b;
        wait for b;
    end process;

    i_2 : process
    begin
        i(2) <= '0', '1' after c/2, '0' after c;
        wait for c;
    end process;

    i_3 : process
    begin
        i(3) <= '0', '1' after e/2, '0' after e;
        wait for e;
    end process;

end test;
