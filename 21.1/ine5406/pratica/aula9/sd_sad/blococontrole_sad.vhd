library ieee;
use ieee.std_logic_1164.all;

entity blococontrole_sad is
	port(
		-- control in
		ck, reset, iniciar, 
		menor : in std_logic;
		-- data in
		-- controll out
		zi, ci, cpA, cpB, zsoma, csoma, csad_reg, 
		readmem, pronto: out std_logic
		-- data out
	);
end entity;

architecture archbehav of blococontrole_sad is
-- COMPLETE
	type State is (s0, s1, s2, s3, s4, s5);
	signal currentState, nextState: State;
begin
    -- logica de proximo estado
    -- COMPLETE
	nextState <= s0 when (currentState = s0 and iniciar = '0') or (currentState = s5)
		else s1 when (currentState = s0 and iniciar = '1')    
		else s2 when (currentState = s1) or (currentState = s4)    
		else s3 when (currentState = s2 and menor = '1')
		else s4 when (currentState = s3)
		else s5;
		-- regitrador de estado
	-- COMPLETE
	process(ck, reset) is
	begin
		if reset='1' then
			currentState <= s0;
		elsif (rising_edge(ck)) then 
			currentState <= nextState;
		end if;
	end process;

	-- logica de saida
    -- COMPLETE
	pronto <= '1' when currentState = s0 else '0';
	readmem <= '1' when currentState = s3 else '0';	
	zi <= '1' when currentState = s1 else '0';
	ci <= '1' when currentState = s1 or currentState = s4 else '0';
	zsoma <= '1' when currentState = s1 else '0';
	csoma <= '1' when currentState = s1 or currentState = s4 else '0';
	cpA <= '1' when currentState = s3 else '0';	
	cpB <= '1' when currentState = s3 else '0';
	csad_reg <= '1' when currentState = s5 else '0';
end architecture;