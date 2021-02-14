library IEEE;
use IEEE.Std_Logic_1164.all;
entity usertop is

port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture full_adder of usertop is
    signal A, B, C, S, AxorB, Cand1, AandB, Cout: std_logic;
begin
    A <= SW(2);
    B <= SW(1);
    C <= SW(0);
    LEDR(1) <= S;
    LEDR(0) <= Cout;

    AxorB <= A xor B;
    S <= AxorB xor C;

    Cand1 <= AxorB and C;
    AandB <= A and B;
    Cout <= Cand1 or AandB;
end full_adder;