entity  testbench1 is end;

library  ieee;
use ieee.std_logic_1164.all;
use  std.textio.all;

architecture tb_and2 of  testbench1 is

component and2
port(
      i1  : in  std_logic;
      i2  : in  std_logic;
      y   : out std_logic
);
end component;

signal  i_1:  std_logic;
signal  i_2:  std_logic;

Begin

and1:  and2   port map (i1 => i_1, i2 => i_2,  y => open );

estimulo : process
begin
wait for  5 ns;  i_1 <= '0' ;  i_2 <=  '0' ;
wait for  5 ns; i_1 <= '1' ;
wait for  5 ns; i_2 <= '1' ;
wait for  5 ns;  i_1 <= '0' ; 
wait;
end process  estimulo;

end tb_and2;
