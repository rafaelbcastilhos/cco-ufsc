library ieee;
use ieee.std_logic_1164.all;

entity grayEncoder is
	generic(width: natural := 8);
	port(binInput: in std_logic_vector(width-1 downto 0);
		grayOutput: out std_logic_vector(width-1 downto 0) 
        );
end entity;

architecture behav0 of grayEncoder is
signal binExtend: std_logic_vector(width downto 0);
begin
	binExtend <= '0' & binInput;
	f0: for i in grayOutput'range generate
		grayOutput(i) <= binExtend(i) xor binExtend(i+1);
	end generate;
end architecture;