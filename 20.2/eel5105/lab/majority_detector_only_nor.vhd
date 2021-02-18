library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture majority_detector of usertop is
    signal A0, A1, A2,
            A0nor, A1nor, A2nor,
            A0andA1, A0andA2, A1andA2,
            A0andA1norA0andA2, A0A1norA0A2,
            S, Snor: std_logic;
begin 
    A0 <= SW(0);
    A1 <= SW(1);
    A2 <= SW(2);
    LEDR(0) <= S;

    A0nor <= A0 nor A0;
    A1nor <= A1 nor A1;
    A2nor <= A2 nor A2;

    A0andA1 <= A0nor nor A1nor;
    A0andA2 <= A0nor nor A2nor;
    A1andA2 <= A1nor nor A2nor;

    A0andA1norA0andA2 <= A0andA1 nor A0andA2;
    A0A1norA0A2 <= A0andA1norA0andA2 nor A0andA1norA0andA2;

    Snor <= A0A1norA0A2 nor A1andA2;
    S <= Snor nor Snor;
end majority_detector;