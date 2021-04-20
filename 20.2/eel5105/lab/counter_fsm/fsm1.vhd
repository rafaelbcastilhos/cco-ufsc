library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FSM1 is port (
    CLKI: in std_logic;
    RST: in std_logic;
    CLKO: out std_logic;
    CNTO: out std_logic_vector(2 downto 0)
);
end FSM1;

architecture fsm1arq of FSM1 is
   type STATES is (State0, State1, State2, State3, State4);
   signal SNow, SNext: STATES;
   signal cnt: std_logic_vector(2 downto 0) := "000";
begin
	process(CLKI, RST)
	begin
	    if (RST = '1') then
			SNow <= State0;
	        CLKO <= '0';
        elsif (CLKI'event AND CLKI = '1') then 
         	SNow <= SNext;
            cnt <= cnt + "001"; 
	        CLKO <= '0';
        elsif (cnt = "100") then 
         	SNow <= SNext;
            cnt <= "000";
	        CLKO <= '1';
	    end if;
	end process;

    process(SNow)
	begin
		case SNow is
            when State0 => SNext <= State1;
                CNTO <= cnt;

            when State1 => SNext <= State2;
                CNTO <= cnt;

            when State2 => SNext <= State3;
                CNTO <= cnt;

            when State3 => SNext <= State4;
                CNTO <= cnt;

            when State4 => SNext <= State0;
                CNTO <= cnt;

		end case;
	end process;
end fsm1arq;