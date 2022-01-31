entity tb_or2 is end;

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

architecture test of tb_or2 is

    component or2
    port (
        i1, i2: in std_logic;
        y: out std_logic
    );
    end component;

    signal i_1, i_2: std_logic;

    begin
        or1 : or2 port map (i_1, i_2, open);

        estimulo: process
        begin
            wait for 5 ns; i_1 <= '0'; i_2 <= '0';
            wait for 5 ns; i_1 <= '1';
            wait for 5 ns; i_2 <= '1';
            wait for 5 ns; i_1 <= '0';
            wait;
        end process estimulo;
    
    end test;
