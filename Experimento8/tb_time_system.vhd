entity tb_time_system is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_time_system is

    signal i : std_logic_vector (1 downto 0) := "00";

    component time_system is
    port (
        clk      : in  std_logic;
        rst_cont : in  std_logic;
        t5       : out std_logic;
        t6       : out std_logic;
        t20      : out std_logic;
        t60      : out std_logic;
        cont_dez : out std_logic_vector (3 downto 0);
        cont_uni : out std_logic_vector (3 downto 0)
    );
    end component;

    -- Timings
    constant time_0  : time := 1   ns;
    constant time_1  : time := 210 ns;

begin

    cont : time_system port map (
        clk      => i(0),
        rst_cont => i(1),
        t5       => open,
        t6       => open,
        t20      => open,
        t60      => open,
        cont_dez => open,
        cont_uni => open 
    );

    i(0)  <= not i(0)  after time_0 /2;
    i(1)  <= not i(1)  after time_1 /2;

end test ; -- test