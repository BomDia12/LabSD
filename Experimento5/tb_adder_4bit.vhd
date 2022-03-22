entity tb_adder_4bit is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_adder_4bit is

    component adder_4bit
    port (
        a, b : in  std_logic_vector (3 downto 0);
        s    : out std_logic_vector (4 downto 0)
    );
    end component;

    signal i : std_logic_vector (7 downto 0) := "00000000";

    -- Timings
    constant time_0 : time := 2   ns;
    constant time_1 : time := 4   ns;
    constant time_2 : time := 8   ns;
    constant time_3 : time := 16  ns;
    constant time_4 : time := 32  ns;
    constant time_5 : time := 64  ns;
    constant time_6 : time := 128 ns;
    constant time_7 : time := 256 ns;

begin  
    subject : adder_4bit port map (a => i (3 downto 0), b => i (7 downto 4), s => open);

    i(0) <= not i(0) after time_0/2;
    i(1) <= not i(1) after time_1/2;
    i(2) <= not i(2) after time_2/2;
    i(3) <= not i(3) after time_3/2;
    i(4) <= not i(4) after time_4/2;
    i(5) <= not i(5) after time_5/2;
    i(6) <= not i(6) after time_6/2;
    i(7) <= not i(7) after time_7/2;
end test;
