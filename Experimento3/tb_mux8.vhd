entity tb_mux8 is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_mux8 is

    component mux8
    port (
        d : in  std_logic_vector (7 downto 0);
        s : in  std_logic_vector (2 downto 0);
        y : out std_logic
    );
    end component;

    signal i : std_logic_vector (10 downto 0);

    -- Time constants
    constant k : time := 1024 ns;
    constant j : time := 512  ns;
    constant l : time := 256  ns;
    constant h : time := 128  ns;
    constant g : time := 64   ns;
    constant f : time := 32   ns;
    constant e : time := 16   ns;
    constant d : time := 8    ns;
    constant c : time := 4    ns;
    constant b : time := 2    ns;
    constant a : time := 1    ns;

begin

    m : mux8 port map (d => i (7 downto 0), s => i (10 downto 8), y => open);

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

    i_6 : process
    begin
        i(6) <= '0', '1' after g/2, '0' after g;
        wait for g;
    end process;

    i_7 : process
    begin
        i(7) <= '0', '1' after h/2, '0' after h;
        wait for h;
    end process;
    
    i_8 : process
    begin
        i(8) <= '0', '1' after l/2, '0' after l;
        wait for l;
    end process;

    i_9 : process
    begin
        i(9) <= '0', '1' after j/2, '0' after j;
        wait for j;
    end process;

    i_10 : process
    begin
        i(10) <= '0', '1' after k/2, '0' after k;
        wait for k;
    end process;

    -- i(10) <= not i(10) after k/2;
    -- i(9)  <= not i(9)  after j/2;
    -- i(8)  <= not i(8)  after l/2;
    
    
    -- a <= "000" after 128 ns,
    --      "001" after 128 ns,
    --      "010" after 128 ns, 
    --      "011" after 128 ns,
    --      "100" after 128 ns,
    --      "101" after 128 ns,
    --      "110" after 128 ns,
    --      "111" after 128 ns;

end test;
