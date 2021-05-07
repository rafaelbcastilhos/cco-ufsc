library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity counterround is port (
	IN_COUNTER_ROUND: in std_logic_vector(3 downto 0);
	IN_SET_SETUP_ROUND: in std_logic_vector(3 downto 0);
	SET, E, CLK_500Hz: in std_logic;
	OUT_END_ROUND: out std_logic;
	OUT_COUNTER_ROUND: out std_logic_vector(3 downto 0)
);
end counterround;

architecture counterr of counterround is
    signal counter: std_logic_vector(3 downto 0) := "0000";
	begin
		process(CLK_500Hz, SET, E, counter)
		begin
			if (SET = '1') then
				counter <= IN_SET_SETUP_ROUND - 1;
				OUT_END_ROUND <= '0';
			elsif (CLK_500Hz'event AND CLK_500Hz = '1') then 
				if (E = '1') then
					counter <= counter - 1;
					if(counter = IN_COUNTER_ROUND) then
						counter <= "0000";
						OUT_END_ROUND <= '1';
					else 
						OUT_END_ROUND <= '0';
					end if;
				end if;
			end if;
		end process;
		OUT_COUNTER_ROUND <= counter;
end counterr;