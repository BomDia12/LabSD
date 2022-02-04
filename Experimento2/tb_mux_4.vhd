entity tb_mux_4 is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_mux_4 is

    component mux_4
    port (
        d : in std_logic_vector (3 downto 0);
        s : in std_logic_vector (1 downto 0);
        y : out std_logic
    );
    end component;

    signal i : std_logic_vector (5 downto 0);

    -- Time Constants
    constant f : time := 160 ns;
    constant e : time := 80  ns;
    constant d : time := 40  ns;
    constant c : time := 20  ns;
    constant b : time := 10  ns;
    constant a : time := 5   ns;

begin

    m : mux_4 port map (d => i (3 downto 0), s => i (5 downto 4), y => open);

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
        i(3) <= '0', '1' after d/2, '0' after d;
        wait for d;
    end process;

    i_4 : process
    begin
        i(4) <= '0', '1' after e/2, '0' after e;
        wait for e;
    end process;

    i_5 : process
    begin
        i(5) <= '0', '1' after f/2, '0' after f;
        wait for f;
    end process;

end test;
