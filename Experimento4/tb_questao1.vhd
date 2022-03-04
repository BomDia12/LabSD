entity tb_questao1 is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_questao1 is

    component questao1
    port (
        a, b, c : in  std_logic;
        x, y    : out std_logic
    );
    end component;

    signal i : std_logic_vector (2 downto 0) := "000";

    -- Time Constants
    constant time_2 : time := 8 ns;
    constant time_1 : time := 4 ns;
    constant time_0 : time := 2 ns;

begin

    subject : questao1 port map ( a => i(2), b => i(1), c => i(0), x => open, y => open );

    i(2) <= not i(2) after time_2/2;
    i(1) <= not i(1) after time_1/2;
    i(0) <= not i(0) after time_0/2;

end test ;
