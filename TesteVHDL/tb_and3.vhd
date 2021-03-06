entity tb_and3 is end;

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all

architecture test of tb_and3 is

    component and3
    port(
        i1, i2, i3: in std_logic;
        y: out std_logic
    );
    end component;

    signal  i_1:  std_logic;
    signal  i_2:  std_logic;
    signal  i_3:  std_logic;

    Begin
        and1: and3 port map (i_1, i_2, i_3, open);
        estimulo : process
        begin
            wait for 5 ns; i_1 <= '0' ; i_2 <= '0' ; i_3 <= '0' ;
            wait for 5 ns; i_1 <= '1' ;
            wait for 5 ns; i_2 <= '1' ;
            wait for 5 ns; i_1 <= '0' ;
            wait for 5 ns; i_3 <= '1' ;
            wait for 5 ns; i_2 <= '0' ;
            wait for 5 ns; i_1 <= '1' ;
            wait for 5 ns; i_2 <= '1' ;
            wait;
        end process  estimulo;

end test;
