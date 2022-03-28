library ieee;
use ieee.std_logic_1164.all;

entity contador_100 is port (
    clk      : in  std_logic;
    enable   : in  std_logic;
    uniload  : in  std_logic_vector (3 downto 0);
    dezload  : in  std_logic_vector (3 downto 0);
    load     : in  std_logic;
    rst      : in  std_logic;
    cont_uni : out std_logic_vector (3 downto 0);
    cont_dez : out std_logic_vector (3 downto 0)
);
end contador_100;

architecture arch of contador_100 is

    signal rc : std_logic;
    
    component contador_10 is
    port (
        clk    : in  std_logic;
        enable : in  std_logic;
        rci    : in  std_logic;
        d      : in  std_logic_vector (3 downto 0);
        load   : in  std_logic;
        rst    : in  std_logic;
        q      : out std_logic_vector (3 downto 0);
        rco    : out std_logic
    );
    end component;

begin

    uni : contador_10 port map (
        clk    => clk,
        enable => enable,
        rci    => '0',
        d      => uniload,
        load   => load,
        rst    => rst,
        q      => cont_uni,
        rco    => rc
    );

    dez : contador_10 port map (
        clk    => clk,
        enable => enable,
        rci    => rc,
        d      => dezload,
        load   => load,
        rst    => rst,
        q      => cont_dez,
        rco    => open
    );

end arch ; -- arch
