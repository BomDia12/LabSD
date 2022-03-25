library ieee;
use ieee.std_logic_1164.all;

entity registry is port (
    d : in std_logic_vector (3 downto 0);
    l, r, dir, load, rst, clk : in std_logic;
    q : out std_logic_vector (3 downto 0)
);
end registry;

architecture arch of registry is

    signal aux : std_logic_vector (3 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then aux <= "0000";
            elsif load = '1' then aux <= d;
            elsif dir = '0' then
                aux <= aux(2) & aux(1) & aux(0) & l;
            elsif dir = '1' then
                aux <= r & aux(3) & aux(2) & aux(1);
            end if;
        else
            aux <= aux;
        end if;
    end process;

    q <= aux;

end arch;
