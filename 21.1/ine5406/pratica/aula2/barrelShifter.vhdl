library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity barrelShifter is
	generic(width: positive;
            toLeft: boolean
            );
	port(input: in std_logic_vector(width-1 downto 0);
        shift: in std_logic_vector(integer(ceil(log2(real(width))))-1 downto 0);
        output: out std_logic_vector(width-1 downto 0)
    );
end entity;

use ieee.numeric_std.all;
architecture behav0 of barrelShifter is
begin
	if0: if toLeft generate
		output <= std_logic_vector(shift_left(unsigned(input), to_integer(unsigned(shift))));
	end generate;
	if1: if not toLeft generate
		output <= std_logic_vector(shift_right(unsigned(input), to_integer(unsigned(shift))));
		end generate;
end architecture;