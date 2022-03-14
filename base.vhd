library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity testbench is port (
    s_gold, s_dut : in  std_logic_vector (4 downto 0);
    a, b          : out std_logic_vector (3 downto 0)
);
end testbench;

architecture test of testbench is

    signal INPUT_signal : std_logic_vector (7 downto 0) := "00000000";
    
    begin
        A(0) <= INPUT_signal(0);
        A(1) <= INPUT_signal(1);
        A(2) <= INPUT_signal(2);
        A(3) <= INPUT_signal(3);
    
        B(0) <= INPUT_signal(4);
        B(1) <= INPUT_signal(5);
        B(2) <= INPUT_signal(6);
        B(3) <= INPUT_signal(7);

        estimulo: PROCESS
        begin
            for I in 0 to 255 loop
                assert (s_gold = s_dut) report "Valores não patem para i = " & integer'image(i) severity error;
                wait for 500 ns; INPUT_signal <= UNSIGNED (INPUT_signal) + 1 ; 
            end loop;
        wait;
        end PROCESS estimulo;

end test;