library ieee;
use ieee.std_logic_1164.all;

entity questao2 is port (
    e : in  std_logic_vector (6 downto 0);
    s : out std_logic
);
end questao2;

architecture arch of questao2 is
    component decoder
    port (
        s : in  std_logic_vector (3 downto 0);
        d : out std_logic_vector (15 downto 0)
    );
    end component;
    component mux8
    port (
        d : in  std_logic_vector (7 downto 0);
        s : in  std_logic_vector (2 downto 0);
        y : out std_logic
    );
    end component;

    signal decoder_out : std_logic_vector (15 downto 0);
    signal mux_in      : std_logic_vector (7  downto 0);
begin
    mux_in(7) <= '1';
    mux_in(6) <= decoder_out(10) or decoder_out(11);
    mux_in(5) <= '0';
    mux_in(4) <= decoder_out(15) or decoder_out(9);
    mux_in(3) <= '1';
    mux_in(2) <= decoder_out(7);
    mux_in(1) <= decoder_out(15) or decoder_out(0);
    mux_in(0) <= '0';

    dec : decoder port map ( s => e (6 downto 3), d => decoder_out );
    mux : mux8    port map ( s => e (2 downto 0), d => mux_in, y => s );
end arch ;
