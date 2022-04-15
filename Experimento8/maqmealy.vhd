library ieee;
use ieee.std_logic_1164.all;

entity maqmealy is port (
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
end maqmealy;

architecture arch of maqmealy is

    type estado is (GR, YY, NN, RR2, RY, RG, RR1, YR);

    signal current_state, next_state : estado;
    signal rst : std_logic;

begin

    sync_process : process (clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
            rst_cont <= rst;
        end if;
    end process;

    comp_process : process (T5, T6, T20, T60, car_ns, car_lo, on_off, clk)
    begin
        if on_off = '1' then
            if    current_state = YY then 
                next_state <= NN;
                light_a  <= "010";
                light_b  <= "010";
                rst <= '1';
            elsif current_state = NN then 
                next_state <= YY;
                light_a  <= "000";
                light_b  <= "000";
                rst <= '1';
            else
                next_state <= YY;
            end if;
        else
            case current_state is
                when GR =>
                    light_a <= "100";
                    light_b <= "001";
                    if (T60 = '1' or (T20 = '1' and car_ns = '0' and car_lo = '1')) then
                        next_state <= YR ;
                        rst   <= '1';
                    else
                        next_state <= GR ;
                        rst   <= '0';
                    end if;
                when YR =>
                    light_a <= "010";
                    light_b <= "001";
                    if (T6 = '1') then
                        next_state <= RR1;
                        rst   <= '1';
                    else
                        next_state <= YR ;
                        rst   <= '0';
                    end if;
                when RR1 =>
                    light_a <= "001";
                    light_b <= "001";
                    if (T5 = '1') then
                        next_state <= RG ;
                        rst   <= '1';
                    else
                        next_state <= RR1;
                        rst   <= '0';
                    end if;
                when RG =>
                    light_a <= "001";
                    light_b <= "100";
                    if (T60 = '1' or (T20 = '1' and car_ns = '1' and car_lo = '0')) then
                        next_state <= RY ;
                        rst   <= '1';
                    else
                        next_state <= RG ;
                        rst   <= '0';
                    end if;
                when RY =>
                    light_a <= "001";
                    light_b <= "010";
                    if (T6 = '1') then
                        next_state <= RR2;
                        rst   <= '1';
                    else
                        next_state <= RY ;
                        rst   <= '0';
                    end if;
                when RR2 =>
                    light_a <= "001";
                    light_b <= "001";
                    if (T5 = '1') then
                        next_state <= GR ;
                        rst   <= '1';
                    else
                        next_state <= RR2;
                        rst   <= '0';
                    end if;
                when NN  =>
                    light_a  <= "000";
                    light_b  <= "000";
                    if (on_off = '0') then 
                        next_state <= GR;
                        rst <= '1';
                    end if;
                when others =>
                    light_a  <= "000";
                    light_b  <= "000";
                    rst <= '1';
            end case;
        end if;
    end process;
end arch;
