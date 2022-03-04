entity tb_questao2 is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_questao2 is

    signal i : std_logic_vector (6 downto 0) := "0000000";

    component questao2
    port (
        e : in  std_logic_vector (6 downto 0);
        s : out std_logic
    );
    end component;

    -- Time Constants
    constant time_6 : time := 128 ns;
    constant time_5 : time := 64  ns;
    constant time_4 : time := 32  ns;
    constant time_3 : time := 16  ns;
    constant time_2 : time := 8   ns;
    constant time_1 : time := 4   ns;
    constant time_0 : time := 2   ns;

begin

    subject : questao2 port map ( e => i, s => open );

    -- Clocks
    i(6) <= not i(6) after time_6/2;
    i(5) <= not i(5) after time_5/2;
    i(4) <= not i(4) after time_4/2;
    i(3) <= not i(3) after time_3/2;
    i(2) <= not i(2) after time_2/2;
    i(1) <= not i(1) after time_1/2;
    i(0) <= not i(0) after time_0/2;

end test ;
