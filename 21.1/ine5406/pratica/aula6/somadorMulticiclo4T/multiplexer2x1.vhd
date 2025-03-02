library ieee;
use ieee.std_logic_1164.all;

entity multiplexer2x1 is
	generic(	width: positive );
	port(	input0, input1: in std_logic_vector(width-1 downto 0);
			sel: in std_logic;
			output: out std_logic_vector(width-1 downto 0) );
end entity;

architecture behav0 of multiplexer2x1 is
begin
    -- COMPLETE COM COMANDOS CONCORRENTES
	output <= input0 when sel='0' else input1;
end architecture;