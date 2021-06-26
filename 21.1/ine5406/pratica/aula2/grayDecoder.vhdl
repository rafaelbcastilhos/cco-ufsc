library ieee;
use ieee.std_logic_1164.all;

entity grayDecoder is
	generic(width: natural);
	port(grayInput: in std_logic_vector(width-1 downto 0);
		binOutput: out std_logic_vector(width-1 downto 0) 
		);
end entity;

architecture behav0 of grayDecoder is
signal tempBinExt: std_logic_vector(width downto 0);
begin
	tempBinExt(width) <= '0';
	f0: for i in width-1 downto 0 generate
		tempBinExt(i) <= grayInput(i) xor tempBinExt(i+1);
	end generate;
	binOutput <= tempBinExt(width-1 downto 0);
end architecture;