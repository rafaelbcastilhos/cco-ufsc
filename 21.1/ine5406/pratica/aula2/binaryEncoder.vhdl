library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity binaryEncoder is
	generic(inputWidth: positive;
			priorityMSB: boolean
        );
	port(input: in std_logic_vector(inputWidth-1 downto 0);
        output: out std_logic_vector(integer(ceil(log2(real(inputWidth))))-1 downto 0) 
        );
end entity;

use ieee.numeric_std.all;
architecture behav0 of binaryEncoder is
begin
	if0: if priorityMSB generate
		process(input) is
		begin
			output <= (others=>'0');
			for i in 0 to input'high loop
				if input(i)='1' then
					output <= std_logic_vector(to_unsigned(i, output'length));
				end if;
			end loop;
		end process;
	end generate;
	if1: if not priorityMSB generate
		process(input) is
		begin
			output <= (others=>'0');
			for i in input'high downto 0 loop
				if input(i)='1' then
					output <= std_logic_vector(to_unsigned(i, output'length));
				end if;
			end loop;
		end process;
	end generate;
end architecture;