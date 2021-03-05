library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture sumsub4bits of usertop is
    component sumsub is
        port (A: in std_logic_vector;
            B: in std_logic_vector;
            C: in std_logic_vector;
            S: out std_logic_vector;
            Overflow: out std_logic);
        end component;

begin
    SUMSUB1: sumsub port map(A => SW(7 downto 4),
                        B => SW(3 downto 0),
                        C => SW(17 downto 16),
                        S => LEDR(4 downto 0),
                        Overflow => LEDR(17));
end sumsub4bits;