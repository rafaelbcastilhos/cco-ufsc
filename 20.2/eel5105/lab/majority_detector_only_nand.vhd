library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture majority_detector of usertop is
    signal 0nand1, 0nand2, 1nand2, 
            A0out, A1out, A2out, 
            A0or, A1or, A2or, 
            A0, A1, A2, 
            S, Sand, Sout: std_logic;
begin 
    A0 <= SW(0);
    A1 <= SW(1);
    A2 <= SW(2);
    LEDR(0) <= S;

    S <= A0or nand Sout;

    0nand1 <= A0 nand A1;
    0nand2 <= A0 nand A2; 
    1nand2 <= A1 nand A2;

    A0out <= 0nand1 nand 0nand1;
    A1out <= 0nand2 nand 0nand2;
    A2out <= 1nand2 nand 1nand2;

    A0or <= A0out nand A0out;
    A1or <= A1out nand A1out;
    A2or <= A2out nand A2out;

    Sand <= A1or nand A2or;
    Sout <= Sand nand Sand;
end majority_detector;