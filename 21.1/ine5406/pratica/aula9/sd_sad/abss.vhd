library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity abss is
	generic(	width: positive );
	port(	input: in std_logic_vector(width-1 downto 0);
			output: out std_logic_vector(width-1 downto 0) );
end entity;

architecture absol of abss is
   constant ONE: UNSIGNED(output'RANGE) := (0 => '1', others => '0');
	signal a: std_logic_vector(width-1 downto 0);
	signal temp: std_logic_vector(width-1 downto 0);
begin
	process(input) is
	begin
		a <= std_logic_vector(signed(input));
		if a(width-1) = '0' then
			output <= input;
		else
		  output <= std_logic_vector(unsigned (not a) + ONE);
		end if;
	end process;
end architecture;