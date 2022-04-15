library ieee;
use ieee.std_logic_1164.all;

entity time_system is port (
    clk      : in  std_logic;
    rst_cont : in  std_logic;
    t5       : out std_logic;
    t6       : out std_logic;
    t20      : out std_logic;
    t60      : out std_logic;
    cont_dez : out std_logic_vector (3 downto 0);
    cont_uni : out std_logic_vector (3 downto 0)
);
end time_system;

architecture arch of time_system is

    signal dez, uni : std_logic_vector (3 downto 0);

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

    component timeflags is
    port (
        cont_dez : in  std_logic_vector (3 downto 0);
        cont_uni : in  std_logic_vector (3 downto 0);
        t5 , t6  : out std_logic;
        t20, t60 : out std_logic
    );
    end component;

begin

    cont : contador_100 port map (
        clk      => clk,
        enable   => '0',
        uniload  => "0000",
        dezload  => "0000",
        load     => '0',
        rst      => rst_cont,
        cont_uni => uni,
        cont_dez => dez
    );

    flag : timeflags port map (
        cont_dez => dez,
        cont_uni => uni,
        t5       => t5,
        t6       => t6,
        t20      => t20,
        t60      => t60
    );

    cont_dez <= dez;
    cont_uni <= uni;

end arch ; -- arch
