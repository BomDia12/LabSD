library ieee;
use ieee.std_logic_1164.all;

entity top_level is port (
    clock        : in  std_logic;
    sensorA      : in  std_logic;
    sensorb      : in  std_logic;
    ligadeseliga : in  std_logic;
    semaforoA    : out std_logic_vector (2 downto 0);
    semaforoB    : out std_logic_vector (2 downto 0);
    cont_uni     : out std_logic_vector (3 downto 0);
    cont_dez     : out std_logic_vector (3 downto 0)
);
end top_level;

architecture arch of top_level is

    signal rst_cont         : std_logic;
    signal T5, T6, T20, T60 : std_logic;

    component time_system is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        t5       : out std_logic;
        t6       : out std_logic;
        t20      : out std_logic;
        t60      : out std_logic;
        cont_dez : out std_logic_vector (3 downto 0);
        cont_uni : out std_logic_vector (3 downto 0)
    );
    end component;

    component maqmealy is
    port (
        clk      : in  std_logic;
        T5,  T6  : in  std_logic;
        T20, T60 : in  std_logic;
        car_ns   : in  std_logic;
        car_lo   : in  std_logic;
        on_off   : in  std_logic;
        light_a  : out std_logic_vector (2 downto 0);
        light_b  : out std_logic_vector (2 downto 0);
        rst_cont : out std_logic
    );
    end component;

begin

    cont        : time_system port map (
        clk      => clock,
        rst      => rst_cont,
        t5       => T5,
        t6       => T6,
        t20      => T20,
        t60      => T60,
        cont_dez => cont_dez,
        cont_uni => cont_uni
    );

    maq_estados : maqmealy port map (
        clk      => clock,
        T5       => T5, 
        T6       => T6,
        T20      => T20,
        T60      => T60,
        car_ns   => sensorA,
        car_lo   => sensorB,
        on_off   => ligadeseliga,
        light_a  => semaforoA,
        light_b  => semaforoB,
        rst_cont => rst_cont
    );

end arch ; -- arch
