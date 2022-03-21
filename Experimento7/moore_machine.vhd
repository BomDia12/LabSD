library ieee;
use ieee.std_logic_1164.all;

entity moore_machine is port (
    a : in std_logic_vector (1 downto 0);
    clk, reset : in std_logic;
    r_soda, r_25c, r_50c : out std_logic
);
end moore_machine;

architecture arch of moore_machine is

    type estado is (init, 25c, 50c, 75c, 100c, 125c, d25, d50, d75);

    signal current_state, next_state : estado;

begin

    sync_process : process (clk, reset)
    begin
        if reset = '1' then current_state <= init;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process sync_process;

    comp_process : process(current_state, a)
    begin
        case current_state is
            when init =>
                r_soda <= '0';
                r_25c <= '0';
                r_50c <= '0';
                case a is
                    when "00" => next_state <= init;
                    when "01" => next_state <= 25c;
                    when "10" => next_state <= 50c;
                    when others => next_state <= init;
                end case;
            when 25c =>
                r_soda <= '0';
                r_25c <= '0';
                r_50c <= '0';
                case a is
                    when "00" => next_state <= 25c;
                    when "01" => next_state <= 50c;
                    when "10" => next_state <= 75c;
                    when others => next_state <= d75;
                end case;
            when 50c =>
                r_soda <= '0';
                r_25c <= '0';
                r_50c <= '0';
                case a is
                    when "00" => next_state <= 50c;
                    when "01" => next_state <= 75c;
                    when "10" => next_state <= 100c;
                    when others => next_state <= d50c;
                end case;