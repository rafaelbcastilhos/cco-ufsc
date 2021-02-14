library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
	LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture majority_detector of usertop is
    signal D, E, F, A, B, C, Y: std_logic;
begin 
	A <= SW(0);
	B <= SW(1);
	C <= SW(2);
	LEDR(0) <= Y;
	Y <= D or E or F;
	D <= A and B;
	E <= A and C; 
	F <= B and C;
end majority_detector;