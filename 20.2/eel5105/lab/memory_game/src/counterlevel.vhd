library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counterlevel is port (
	IN_COUNTER_LEVEL: in std_logic_vector(3 downto 0);
	R, E, CLK_1Hz: in std_logic;
	OUT_END_FPGA: out std_logic
);
end counterlevel;

architecture counterl of counterlevel is
    signal counter: std_logic_vector(3 downto 0);
	begin
		process(CLK_1Hz, E, R)
		begin
			if (R = '1') then
				OUT_END_FPGA <= '0';
				counter <= "0000";
			elsif (CLK_1Hz'event AND CLK_1Hz = '1') then 
				if E = '1' then 
				counter <= IN_COUNTER_LEVEL;
				counter <= counter + 1;
					OUT_END_FPGA <= '1';
					if (counter = "1111") then
						counter <= "0000";
					end if;
				end if;
			end if;
		end process;
end counterl;