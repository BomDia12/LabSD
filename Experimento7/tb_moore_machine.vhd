entity tb_moore_machine is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_moore_machine is

    signal i : std_logic_vector (3 downto 0) := "0000";

    component moore_machine is
    port (
        a : in std_logic_vector (1 downto 0);
        clk, reset : in std_logic;
        r_soda, r_c25, r_c50 : out std_logic
    );
    end component;

    -- Timings
    constant time_0 : time := 1  ns;
    constant time_1 : time := 8  ns;
    constant time_2 : time := 16  ns;
    constant time_3 : time := 32 ns;

begin
    i(0) <= not i(0) after time_0/2;
    i(1) <= not i(1) after time_1/2;
    i(2) <= not i(2) after time_2/2;
    i(3) <= not i(3) after time_3/2;

    subject : moore_machine port map (
        clk    => i (0),
        a      => i (2 downto 1),
        reset  => i (3),
        r_soda => open,
        r_c25  => open,
        r_c50  => open
    );
end test ; -- test
