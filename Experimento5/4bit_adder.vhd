library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is port (
    a, b : in  std_logic_vector (3 downto 0);
    s    : out std_logic_vector (4 downto 0)
);
end adder_4bit;

architecture arch of adder_4bit is

    component complete_adder
    port (
        a, b, cin : in  std_logic;
        s, cout   : out std_logic
    );
    end component;

    signal carry_over : std_logic_vector(2 downto 0);

begin

    first  : complete_adder port map (a => a(0), b => b(0), cin => '0',           s => s(0), cout => carry_over(0));
    second : complete_adder port map (a => a(1), b => b(1), cin => carry_over(0), s => s(1), cout => carry_over(1));
    third  : complete_adder port map (a => a(2), b => b(2), cin => carry_over(1), s => s(2), cout => carry_over(2));
    fourth : complete_adder port map (a => a(3), b => b(3), cin => carry_over(2), s => s(3), cout => s(4)         );

end arch;
