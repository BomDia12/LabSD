library ieee;
use ieee.std_logic_1164.all;

entity contador_10 is port (
    clk    : in  std_logic;
    enable : in  std_logic;
    rci    : in  std_logic;
    d      : in  std_logic_vector (3 downto 0);
    load   : in  std_logic;
    rst    : in  std_logic;
    q      : out std_logic_vector (3 downto 0);
    rco    : out std_logic
);
end contador_10;

architecture arch of contador_10 is

    type estado is ( ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9 );
    signal current_state, next_state, load_state : estado;

begin

    with d select
        load_state <= ST0 when "0000",
                      ST1 when "0001",
                      ST2 when "0010",
                      ST3 when "0011",
                      ST4 when "0100",
                      ST5 when "0101",
                      ST6 when "0110",
                      ST7 when "0111",
                      ST8 when "1000",
                      ST9 when "1001",
                      ST0 when others;
    
    sync_proc : process (clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    comb_proc : process (current_state, rst, enable, rci, load, load_state)
    begin
        if (rst = '1') then next_state <= ST0;
        elsif (load = '1') then next_state <= load_state;
        else
            case current_state is
                when ST0 => 
                    q <= "0000";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST1;
                    end if;
                when ST1 => 
                    q <= "0001";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST2;
                    end if;
                when ST2 => 
                    q <= "0010";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST3;
                    end if;
                when ST3 => 
                    q <= "0011";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST4;
                    end if;
                when ST4 => 
                    q <= "0100";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST5;
                    end if;
                when ST5 => 
                    q <= "0101";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST6;
                    end if;
                when ST6 => 
                    q <= "0110";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST7;
                    end if;
                when ST7 => 
                    q <= "0111";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST8;
                    end if;
                when ST8 => 
                    q <= "1000";
                    rco <= '1';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST9;
                    end if;
                when others => 
                    q <= "1001";
                    rco <= '0';
                    if ((enable = '0') and (rci = '0')) then next_state <= ST0;
                    end if;
            end case;
        end if;
    end process;

end arch ; -- arch
