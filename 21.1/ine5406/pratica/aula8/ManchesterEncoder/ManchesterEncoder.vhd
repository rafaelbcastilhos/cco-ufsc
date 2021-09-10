library ieee;
use ieee.std_logic_1164.all;
-- pg364

entity ManchesterEncoder is
	port(
		-- control inputs
		clock, reset: in std_logic;
		-- data inputs
		v, d: in std_logic;
		-- control outputs
		-- data outputs
		y: out std_logic
	);
end entity;

architecture studenttry of ManchesterEncoder is
	type State is (idle, s0a, s0b, s1a, s1b);
	signal currentState, nextState: State;
begin
	-- next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	-- COMPLETE
	nextState <= idle when (currentState = idle and v = '0') or (currentState = s0b and v = '0')
		or (currentState = s1b and v = '0') else s0a when (currentState = idle and v = '1' and d = '0')
		or (currentState = s0b and v = '1' and d = '0') or (currentState = s1b and v = '1' and d = '0')
		else s1a when (currentState = idle and v = '1' and d = '1') or (currentState = s0b and v = '1' and d = '1')
		or (currentState = s1b and v = '1' and d = '1') else s0b when (currentState = s0a)
		else s1b when (currentState = s1a) else idle;
	-- end-next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
	-- COMPLETE
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
   process(clock, reset) is
	begin
		if reset='1' then
			currentState <= idle;
		elsif (rising_edge(clock)) then 
			currentState <= nextState;
		end if;
	end process;
	
	-- output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
    -- COMPLETE
    -- end-output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
	y <= '1' when (currentState = s1a or currentState = s0b) else '0';
end architecture;





	