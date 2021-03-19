library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity usertest is
end usertest;

architecture tb of usertest is
    signal SA, SB, SSum, SCout : std_logic;
    signal cnt : std_logic_vector(1 downto 0) := "00";

    component halfadder is port ( 
        A,B: in std_logic;
        Sum,Cout: out std_logic );
    end component;
begin
    DUT : halfadder port map (A => SA, B => SB, Sum => SSum, Cout => SCout);
    SA <= cnt(1);
    SB <= cnt(0);
    process
    constant period: time := 10 ns;
    begin
        for k in 1 to 8 loop
            wait for period;
            cnt <= cnt + '1';
        end loop;
        wait;
    end process;    
end tb;