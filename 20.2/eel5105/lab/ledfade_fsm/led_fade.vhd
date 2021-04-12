library ieee;
use ieee.std_logic_1164.all;

entity FSM1 is port (
   clock: in std_logic;
   reset: in std_logic;
   x: out std_logic_vector
);
end FSM1;

architecture fsm1arq of FSM1 is
   type STATES is (Offline, Online, led2, led1);
   signal EAtual, PEstado: STATES;
begin
	process(clock, reset)
	begin
	    if (reset = '1') then
			EAtual <= Online;
        elsif (clock'event AND clock = '1') then 
         	EAtual <= PEstado;
	    end if;
	end process;

    process(EAtual)
	begin
		case EAtual is
            when Online => Pestado <= led2;
                x <= "110";
            when led2 => Pestado <= led1;
                x <= "100";
            when led1 => Pestado <= Offline;
                x <= "000";
            when Offline => Pestado <= Online;
                x <= "111";
		end case;
	end process;
end fsm1arq;
