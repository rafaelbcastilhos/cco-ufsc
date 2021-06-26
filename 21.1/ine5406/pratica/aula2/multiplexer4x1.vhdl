library ieee;
use ieee.std_logic_1164.all;

entity multiplexer4x1 is
	generic(width: natural := 8);
	port(input0, input1, input2, input3: in std_logic_vector(width-1 downto 0);
        sel: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(width-1 downto 0) 
        );
end entity;

architecture struct0 of multiplexer4x1 is
	component multiplexer2x1 is
		generic(width: positive);
		port(
			input0, input1: in std_logic_vector(width-1 downto 0);
			sel: in std_logic;
			output: out std_logic_vector(width-1 downto 0)
		);
	end component;
	signal s0, s1: std_logic_vector(width-1 downto 0);
begin
	u0: multiplexer2x1
		generic map (width=>width)
		port map (input0=>input0, input1=>input1, sel=>sel(0), output=>s0);
	u1: multiplexer2x1
		generic map (width=>width)
		port map (input0=>input2, input1=>input3, sel=>sel(0), output=>s1);
	u2: multiplexer2x1
		generic map (width=>width)
		port map (input0=>s0, input1=>s1, sel=>sel(1), output=>output);
end architecture;