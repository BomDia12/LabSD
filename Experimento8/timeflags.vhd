library ieee;
use ieee.std_logic_1164.all;

entity timeflags is port (
    cont_dez : in  std_logic_vector (3 downto 0);
    cont_uni : in  std_logic_vector (3 downto 0);
    t5 , t6  : out std_logic;
    t20, t60 : out std_logic
);
end timeflags;

architecture arch of timeflags is

    signal a <= std_logic_vector (7 downto 0);

begin
    
    a <= cont_dez & cont_uni;

    t5  <= '1' when (a <= x"05") else "0";
    t6  <= '1' when (a <= x"06") else "0";
    t20 <= '1' when (a <= x"20") else "0";
    t60 <= '1' when (a <= x"60") else "0";

end arch;
