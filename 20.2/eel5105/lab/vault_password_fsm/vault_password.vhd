library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity FSM1 is port (
   clock: in std_logic;
   reset: in std_logic;
   TRY: in std_logic_vector(2 downto 0);
   O: out std_logic
);
end FSM1;

architecture fsm1arq of FSM1 is
   type STATES is (Inicio, Espera1, Correto1, Espera2, Correto2, FimF, FimA);
   signal EAtual, PEstado: STATES;
begin
	process(clock, reset)
	begin
	    if (reset = '0') then
			EAtual <= Inicio;
        elsif (clock'event AND clock = '1') then 
         	EAtual <= PEstado;
	    end if;
	end process;

    process(EAtual, TRY)
	begin
		case EAtual is
            when Inicio => 
                O <= '0';
                if(TRY(2 downto 0) = "111") then
                    PEstado <= Inicio;
                elsif (TRY(2 downto 0) = "011") then
                    PEstado <= Espera1;
                else
                    PEstado <= FimF;
            end if;
            when Espera1 => O <= '0';
                if(TRY(2) = '0') then
                    PEstado <= Espera1;
                elsif (TRY(2) = '1') then
                    PEstado <= Correto1;
                else    
                    PEstado <= Espera1;
            end if;
            when Correto1 => O <= '0';
                if(TRY(2 downto 0) = "110") then
                    PEstado <= Espera2;
                elsif (TRY(2 downto 0) = "111") then
                    PEstado <= Correto1;
                else
                    PEstado <= FimF;
            end if;
            when Espera2 => O <= '0';
                if(TRY(0) = '0') then
                    PEstado <= Espera2;
                else
                    PEstado <= Correto2;
            end if;
            when Correto2 => O <= '0';
                if(TRY(2 downto 0) = "111") then
                    PEstado <= Correto2;
                elsif (TRY(2 downto 0) = "101") then
                    PEstado <= FimA;
                else
                    PEstado <= FimF;
            end if;
            when FimF => Pestado <= FimF;
                O <= '0';
            when FimA => Pestado <= FimA;
                O <= '1';
		end case;
	end process;
end fsm1arq;
