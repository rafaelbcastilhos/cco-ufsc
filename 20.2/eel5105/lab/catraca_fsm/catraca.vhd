library ieee;
use ieee.std_logic_1164.all;

entity FSM1 is port (
   clock, reset, a, b: in std_logic;
   x: out std_logic );
end FSM1;

architecture fsm1arq of FSM1 is
   type STATES is (Travado, Destrav);
   signal EAtual, PEstado: STATES;
begin
	process(clock, reset)
	begin
	    if (reset = '1') then
			EAtual <= Travado;
        elsif (clock'event AND clock = '1') then 
         	EAtual <= PEstado;
	    end if;
	end process;

    process(EAtual, a, b)
	begin
		case EAtual is
            when Travado => x <= '1';
                if((a = '1') and (b = '1')) then
                    PEstado <= Destrav;
                else
                    PEstado <= Travado;
            end if;
            when Destrav => x <= '0';
                if((a='1') and (b='1')) then
                    PEstado <= Destrav;
                else
                    Pestado <= Travado;
    	    end if;
		end case;
	end process;
end fsm1arq;
