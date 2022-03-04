library ieee;
use ieee.std_logic_1164.all;

entity questao1 is port
(
    a, b, c : in  std_logic;
    x, y    : out std_logic
);
end questao1;

architecture arch of questao1 is

    component mux_4
    port(
        d : in std_logic_vector (3 downto 0);
        s : in std_logic_vector (1 downto 0);
        y : out std_logic
    );
    end component;

    signal notc : std_logic;

begin

    notc <= not c;

    first  : mux_4 port map ( s(1) => a, s(0) => b, d(3) => '1', d(2) => notc, d(1) => c   , d(0) => '0', y => x );

    second : mux_4 port map ( s(1) => a, s(0) => b, d(3) =>  c , d(2) => '0' , d(1) => notc, d(0) => '1', y => y );

end arch ;
