library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity countertime is port (
	IN_COUNTER_TIME: in std_logic_vector(3 downto 0);
	R, E, CLK_1Hz: in std_logic;
	OUT_END_TIME: out std_logic;
	OUT_COUNTER_TIME: out std_logic_vector(3 downto 0)
);
end countertime;

architecture countert of countertime is
    signal counter: std_logic_vector(3 downto 0);
	begin
		process(CLK_1Hz, E, R)
		begin
			if (R = '1') then
				OUT_END_TIME <= '0';
				counter <= "1010";
			elsif (CLK_1Hz'event AND CLK_1Hz = '1') then 
				counter <= IN_COUNTER_TIME;
				if E = '1' then 
					counter <= counter + 1;
					if (counter = "1111") then
						counter <= "1010";
						OUT_END_TIME <= '1';
					end if;
				end if;
			end if;
		end process;
	OUT_COUNTER_TIME <= counter;
end countert;