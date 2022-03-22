library ieee;
use ieee.std_logic_1164.all;

entity flipflop_jk is port (
    clk, j, k, clr, pr : in std_logic;
    q : out std_logic
);
end flipflop_jk;

architecture jk_arch of flipflop_jk is

    signal jk : std_logic_vector (1 downto 0);
    signal q_buf : std_logic := '0';

begin

    jk <= j & k;

    process(pr, clr, clk)
    begin
        if pr = '1' then q_buf <= '1';
        elsif clr = '1' then q_buf <= '0';
        elsif rising_edge(clk) then
            case jk is
                when "00" => q_buf <= q_buf;
                when "01" => q_buf <= '0';
                when "10" => q_buf <= '1';
                when others => q_buf <= not q_buf;
            end case;
        end if;
    end process;

    q <= q_buf;

end jk_arch;