library ieee;
use ieee.std_logic_1164.all;

entity decoder is port (
    s : in  std_logic_vector (3 downto 0);
    d : out std_logic_vector (15 downto 0)
);
end decoder;

architecture rtl of decoder is

begin

    with s select
        d(0)  <= '1' when "0000",
                 '0' when others;

    with s select
        d(1)  <= '1' when "0001",
                 '0' when others;

    with s select
        d(2)  <= '1' when "0010",
                 '0' when others;

    with s select
        d(3)  <= '1' when "0011",
                 '0' when others;

    with s select
        d(4)  <= '1' when "0100",
                 '0' when others;

    with s select
        d(5)  <= '1' when "0101",
                 '0' when others;

    with s select
        d(6)  <= '1' when "0110",
                 '0' when others;

    with s select
        d(7)  <= '1' when "0111",
                 '0' when others;

    with s select
        d(8)  <= '1' when "1000",
                 '0' when others;

    with s select
        d(9)  <= '1' when "1001",
                 '0' when others;

    with s select
        d(10) <= '1' when "1010",
                 '0' when others;

    with s select
        d(11) <= '1' when "1011",
                 '0' when others;

    with s select
        d(12) <= '1' when "1100",
                 '0' when others;

    with s select
        d(13) <= '1' when "1101",
                 '0' when others;

    with s select
        d(14) <= '1' when "1110",
                 '0' when others;

    with s select
        d(15) <= '1' when "1111",
                 '0' when others;

end rtl;
