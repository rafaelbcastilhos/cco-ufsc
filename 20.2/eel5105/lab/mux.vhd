library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (
    SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture mux of usertop is
    signal D0, D1, D2, D3, D4, D5, D6, D7,
            D0and, D1and, D2and, D3and, D4and, D5and, D6and, D7and,
            A, B, C,
            F: std_logic;
begin 
    D0 <= SW(0);
    D1 <= SW(1);
    D2 <= SW(2);
    D3 <= SW(3);
    D4 <= SW(4);
    D5 <= SW(5);
    D6 <= SW(6);
    D7 <= SW(7);

    A <= SW(17);
    B <= SW(16);
    C <= SW(15);

    LEDR(0) <= F;

    D0and <= D0 and (not A) and (not B) and (not C);
    D1and <= D1 and (not A) and (not B) and C;
    D2and <= D2 and (not A) and B and (not C);
    D3and <= D3 and (not A) and B and C;
    D4and <= D4 and A and (not B) and (not C);
    D5and <= D5 and A and (not B) and C;
    D6and <= D6 and A and B and (not C);
    D7and <= D7 and A and B and C;

    F <= D0and or D1and or D2and or D3and or D4and or D5and or D6and or D7and;
end mux;