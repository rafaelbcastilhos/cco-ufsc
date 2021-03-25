library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux8 is
port (
    INPUT: in std_logic_vector(7 downto 0);
    INPUT_SELECT: in std_logic_vector(2 downto 0);
    ENABLE: in std_logic;
    OUTPUT: out std_logic
);
end mux8;

architecture mux of mux8 is
    signal D0, D1, D2, D3, D4, D5, D6, D7,
            D0and, D1and, D2and, D3and, D4and, D5and, D6and, D7and,
            A, B, C,
            F: std_logic;
begin 
    D0 <= INPUT(0);
    D1 <= INPUT(1);
    D2 <= INPUT(2);
    D3 <= INPUT(3);
    D4 <= INPUT(4);
    D5 <= INPUT(5);
    D6 <= INPUT(6);
    D7 <= INPUT(7);

    A <= INPUT_SELECT(2);
    B <= INPUT_SELECT(1);
    C <= INPUT_SELECT(0);

    OUTPUT <= F;

    D0and <= D0 and (not A) and (not B) and (not C) and ENABLE;
    D1and <= D1 and (not A) and (not B) and C and ENABLE;
    D2and <= D2 and (not A) and B and (not C) and ENABLE;
    D3and <= D3 and (not A) and B and C and ENABLE;
    D4and <= D4 and A and (not B) and (not C) and ENABLE;
    D5and <= D5 and A and (not B) and C and ENABLE;
    D6and <= D6 and A and B and (not C) and ENABLE;
    D7and <= D7 and A and B and C and ENABLE;

    F <= D0and or D1and or D2and or D3and or D4and or D5and or D6and or D7and;
end mux;