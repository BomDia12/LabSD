entity tb_contador_100 is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_contador_100 is

    component contador_100 is
    port (
        clk      : in  std_logic;
        enable   : in  std_logic;
        uniload  : in  std_logic_vector (3 downto 0);
        dezload  : in  std_logic_vector (3 downto 0);
        load     : in  std_logic;
        rst      : in  std_logic;
        cont_uni : out std_logic_vector (3 downto 0);
        cont_dez : out std_logic_vector (3 downto 0)
    );
    end component;

    signal i :std_logic_vector (11 downto 0) := "000000000000";

    -- Timings
    constant time_0  : time := 2    ns;
    constant time_1  : time := 4    ns;
    constant time_2  : time := 8    ns;
    constant time_3  : time := 16   ns;
    constant time_4  : time := 32   ns;
    constant time_5  : time := 64   ns;
    constant time_6  : time := 128  ns;
    constant time_7  : time := 256  ns;
    constant time_8  : time := 512  ns;
    constant time_9  : time := 1024 ns;
    constant time_10 : time := 2048 ns;
    constant time_11 : time := 4096 ns;

begin

    cont : contador_100 port map (
        clk      => i(0),
        enable   => i(1),
        uniload  => i(5 downto 2),
        dezload  => i(9 downto 6),
        load     => i(10),
        rst      => i(11),
        cont_uni => open,
        cont_dez => open
    );

    i(0)  <= not i(0)  after time_0 /2;
    i(1)  <= not i(1)  after time_1 /2;
    i(2)  <= not i(2)  after time_2 /2;
    i(3)  <= not i(3)  after time_3 /2;
    i(4)  <= not i(4)  after time_4 /2;
    i(5)  <= not i(5)  after time_5 /2;
    i(6)  <= not i(6)  after time_6 /2;
    i(7)  <= not i(7)  after time_7 /2;
    i(8)  <= not i(8)  after time_8 /2;
    i(9)  <= not i(9)  after time_9 /2;
    i(10) <= not i(10) after time_10/2;
    i(11) <= not i(11) after time_11/2;

end test ; -- test
