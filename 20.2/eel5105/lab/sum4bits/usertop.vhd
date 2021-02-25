library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture sum4bits of usertop is
    component sum is
        port (A: in std_logic_vector;
            B: in std_logic_vector;
            S: out std_logic_vector);
        end component;

begin
    SUM4BITS: sum port map(A => SW(7 downto 4),
                        B => SW(3 downto 0),
                        S => LEDR(4 downto 0));
end sum4bits;