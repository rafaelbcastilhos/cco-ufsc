library IEEE;
use IEEE.Std_Logic_1164.all;

entity fulladder is
port (A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    S: out std_logic;
    Cout: out std_logic
);
end fulladder;

architecture fullA of fulladder is
    signal AxorB, Cand1, AandB: std_logic;
begin
    AxorB <= A xor B;
    S <= AxorB xor C;

    Cand1 <= AxorB and C;
    AandB <= A and B;
    Cout <= Cand1 or AandB;
end fullA;