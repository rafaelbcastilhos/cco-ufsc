library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture mult34bits of usertop is
    signal S: std_logic_vector(4 downto 0);

    component mult is
        port (A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0));
        end component;

begin
    SUM1: mult port map(A => SW(3 downto 0),
                        B => SW(3 downto 0),
                        S => S);

    SUM2: mult port map(A => SW(3 downto 0),
                        B => S(3 downto 0),
                        S => LEDR(4 downto 0));
end mult34bits;