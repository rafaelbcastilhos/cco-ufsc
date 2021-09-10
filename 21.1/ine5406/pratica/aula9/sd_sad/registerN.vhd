library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerN is
	generic(	width: natural;
				resetValue: integer := 0 );
	port(	-- control
			clock, reset, load: in std_logic;
			-- data
			input: in std_logic_vector(width-1 downto 0);
			output: out std_logic_vector(width-1 downto 0));
end entity;

architecture behav0 of registerN is
-- COMPLETE COM SINAIS INTERNOS ESPERADOS DE UM CIRCUITO SEQUENCIAL
	signal nextState, currentState: std_logic_vector(width-1 downto 0); --State; 
begin
	-- logica de proximo estado
	-- COMPLETE COM COMANDOS CONCORRENTES 
	nextState <= input when load='1' else currentState;

	-- estado interno (registrador)
	-- COMPLETE COM COMANDO CONCORRENTE PROCESS E COMANDOS SEQUENCIAIS DENTRO DELE 
	process(clock, reset) is -- sequencial 
	begin
		if reset='1' then
			currentState <= std_logic_vector(to_signed(resetValue, currentState'length));
		elsif rising_edge(clock) then
			currentState <= nextState;
		end if;
	end process;

	-- logicas de saida
	-- COMPLETE COM COMANDOS CONCORRENTES 
	output <= currentState;
end architecture;