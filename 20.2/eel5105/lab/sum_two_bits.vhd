library IEEE;
use IEEE.Std_Logic_1164.all;
entity usertop is

port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture sum_two_bits of usertop is
    signal A0, A1, B0, B1, 
            A0andB0, A1xorB1, A1xorB1andA0andB0, A1andB1,
            S0, S1, S2: std_logic;
begin
    A1 <= SW(3);
    A0 <= SW(2);
    B1 <= SW(1);
    B0 <= SW(0);

    LEDR(2) <= S2;
    LEDR(1) <= S1;
    LEDR(0) <= S0;

    S0 <= A0 xor B0;
    A0andB0 <= A0 and B0;
    A1xorB1 <= A1 xor B1;
    S1 <= A0andB0 xor A1xorB1;
    A1xorB1andA0andB0 <= A1xorB1 and A0andB0;
    A1andB1 <= A1 and B1;
    S2 <= A1xorB1andA0andB0 or A1andB1;
end sum_two_bits;
