library ieee;
use ieee.std_logic_1164.all;
use work.BC_State.all;

entity blocoControle4T is
	port(
		-- control in
		clock, reset, iniciar: in std_logic;
		-- control in (status signals from BC)
		zero, ov: in std_logic;
		-- control out 
		erro, pronto: out std_logic;
		-- control out (command signals to BC)
		scont, ccont, zAC, cAC, cT: out std_logic;
		-- Tests
		stateBC: out State
	);
end entity;

architecture descricaoComportamental of blocoControle4T is
    -- não acrescente nada aqui. State está definido no package work.BC_State
    signal nextState, currentState: State;
	begin
    -- next-state logic (nao exclua e nem mude esta linha)
    -- COMPLETE
	nextState <= S0 when (currentState = S2 and zero = '1') or (currentState = S0 and iniciar = '0')
		else S1 when (currentState = S0 or currentState = E) and iniciar = '1'
		else S2 when (currentState = S1) or (currentState = S3 and ov = '0')
		else S3 when currentState = S2 and zero = '0'
		else E when currentState = S3 and ov = '1';

	-- memory element --state register--  (nao exclua e nem mude esta linha)
    -- COMPLETE
   process(clock, reset) is
	begin
		if reset='1' then
			currentState <= S0;
		elsif (rising_edge(clock)) then 
			currentState <= nextState;
		end if;
	end process;

	-- output logic  (nao exclua e nem mude esta linha)
	-- COMPLETE
	scont <= '1' when currentState = S1 else '0' when currentState = S3 else '0';
	ccont <= '1' when currentState = S1 or currentState = S3 else '0';
	pronto <= '1' when currentState = S0 or currentState = E else '0';
	erro <= '1' when currentState = E else '0';
	zAC <= '1' when currentState = S1 else '0' when currentState = S3 else '0';
	cAC <= '1' when currentState = S1 or currentState = S3 else '0';
	cT <= '1' when currentState = S1 or currentState = S3 else '0';
	stateBC <= currentState;
end architecture;