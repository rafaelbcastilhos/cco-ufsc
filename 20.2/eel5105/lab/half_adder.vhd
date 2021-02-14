library IEEE;
use IEEE.Std_Logic_1164.all;
entity usertop is

port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture half_adder of usertop is
    signal A, B, S, Cout: std_logic;
begin
    A <= SW(1);
    B <= SW(0);
    LEDR(1) <= S;
    LEDR(0) <= Cout;

    S <= A xor B;
    Cout <= A and B;
end half_adder;