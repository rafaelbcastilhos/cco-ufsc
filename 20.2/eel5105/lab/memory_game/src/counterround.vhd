library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counterround is port (
	IN_COUNTER_ROUND: in std_logic_vector(3 downto 0);
	IN_SET_SETUP_ROUND: in std_logic_vector(3 downto 0);
	SET, E, CLK_500Hz: in std_logic;
	OUT_END_ROUND: out std_logic;
	OUT_COUNTER_ROUND: out std_logic_vector(3 downto 0)
);
end counterround;

architecture counterr of counterround is
    signal counter, setup: std_logic_vector(3 downto 0);
	begin
		process(CLK_500Hz, E, SET)
		begin
			if (SET = '1') then
				setup <= IN_SET_SETUP_ROUND;
				setup <= setup - 1;
				OUT_END_ROUND <= '0';
				OUT_COUNTER_ROUND <= setup;
			elsif (CLK_500Hz'event AND CLK_500Hz = '1') then 
				if E = '1' then
					counter <= IN_COUNTER_ROUND;
					counter <= counter - 1;
					OUT_END_ROUND <= '1';
					-- if (IN_COUNTER_ROUND = "0000") then
					-- 	IN_COUNTER_ROUND <= "0000";
					-- end if;
					OUT_COUNTER_ROUND <= counter;
				end if;
			end if;
		end process;
end counterr;