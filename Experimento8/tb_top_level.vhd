entity tb_top_level is end;

library ieee;
use ieee.std_logic_1164.all;

architecture test of tb_top_level is

    signal i : std_logic_vector (3 downto 0) := "0000";

    component top_level is
    port (
        clock        : in  std_logic;
        sensorA      : in  std_logic;
        sensorb      : in  std_logic;
        ligadeseliga : in  std_logic;
        semaforoA    : out std_logic_vector (2 downto 0);
        semaforoB    : out std_logic_vector (2 downto 0);
        cont_uni     : out std_logic_vector (3 downto 0);
        cont_dez     : out std_logic_vector (3 downto 0)
    );
    end component;

    -- Timings
    constant time_0 : time := 1000    ms;
    constant time_1 : time := 8000    ms;
    constant time_2 : time := 16000   ms;
    constant time_3 : time := 1024000 ms;

begin

    i(0) <= not i(0) after time_0/2;
    i(1) <= not i(1) after time_1/2;
    i(2) <= not i(2) after time_2/2;
    i(3) <= not i(3) after time_3/2;

    subject : top_level port map (
        clock        => i(0),
        sensorA      => i(1),
        sensorb      => i(2),
        ligadeseliga => i(3),
        semaforoA    => open,
        semaforoB    => open,
        cont_uni     => open,
        cont_dez     => open
    );

end test ; -- test