entity tb_sum is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_sum is

    signal i0, i1, i2 : std_logic;

    component sum
    port (
        a, b, cin : in  std_logic;
        s, cout   : out std_logic
    );
    end component;

begin

    s : sum port map (a => i0, b =>  i1, cin => i2, s => open, cout => open);

    estimulo : process
    begin
        i0 <= '0'; i1 <= '0'; i2 <= '0';  -- 000
        wait for 5 ns; i0 <= '1';         -- 001
        wait for 5 ns; i1 <= '1';         -- 011
        wait for 5 ns; i0 <= '0';         -- 010
        wait for 5 ns; i2 <= '1';         -- 110
        wait for 5 ns; i0 <= '1';         -- 111
        wait for 5 ns; i1 <= '0';         -- 101
        wait for 5 ns; i0 <= '0';         -- 100
        wait;
    end process estimulo;

end test;
