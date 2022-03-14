library ieee;
use ieee.std_logic_1164.all;

entity topmodule is end;

architecture topmodel_arch of topmodule is 

    component adder_4bit is
    port (
        a, b : in  std_logic_vector (3 downto 0);
        s    : out std_logic_vector (4 downto 0)
    );
    end component;

    component arithmatic_adder is
    port (
        a, b : in  std_logic_vector (3 downto 0);
        s    : out std_logic_vector (4 downto 0)
    );
    end component;

    component testbench is
    port (
        s_gold, s_dut : in  std_logic_vector (4 downto 0);
        a, b          : out std_logic_vector (3 downto 0)
    );
    end component;

    signal a, b          : std_logic_vector (3 downto 0);
    signal s_gold, s_dut : std_logic_vector (4 downto 0);

begin 

    u0 : adder_4bit       port map (a, b, s_dut );
    u1 : arithmatic_adder port map (a, b, s_gold);
    u2 : testbench        port map (s_dut, s_gold, a, b);

end topmodel_arch;
