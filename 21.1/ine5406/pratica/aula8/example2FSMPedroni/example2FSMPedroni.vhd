library ieee;
use ieee.std_logic_1164.all;

entity example2FSMPedroni is
	port(
		-- control inputs
		clock, reset: in std_logic;
		-- data inputs
		inp: in std_logic;
		-- control outputs
		-- data outputs
		outp: out std_logic_vector(1 downto 0)
	);
end entity;

architecture archstudenttryPg195 of example2FSMPedroni is
	type State is (state1, state2, state3, state4);
	signal currentState, nextState: State;
begin
	-- next-state logic
	-- COMPLETE
	nextState <= state1 when (currentState = state1 and inp = '0') or (currentState = state4 and inp = '1')
		else state2 when (currentState = state1 and inp = '1') or (currentState = state4 and inp = '0')
		else state3 when (currentState = state2 and inp = '0') or (currentState = state3 and inp = '0')
		else state4;
	-- memory register 
	-- COMPLETE
	process(clock, reset) is
	begin
		if reset='1' then
			currentState <= state1;
		elsif (rising_edge(clock)) then 
			currentState <= nextState;
		end if;
	end process;

	-- output-logic
	-- COMPLETE 
	outp(0) <= '0' when (currentState = state1 or currentState = state3) else '1';
	outp(1) <= '0' when (currentState = state1 or currentState = state2) else '1';
end architecture;