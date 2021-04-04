library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity reg is port (
    enable: in std_logic;
    clear: in std_logic;
    clock: in std_logic;
    f: out std_logic_vector(3 downto 0) 
    );
end reg;

architecture reg4 of reg is
    signal cnt: std_logic_vector(3 downto 0) := "0000";
begin
    process(clock)
    begin
        if (clock'event and clock = '1' and enable = '0') then
            cnt <= cnt + "0001";
        end if;
        if (clear = '1') then
            cnt <= "0000";
        end if;
        if (cnt = "1001") then
            cnt <= "1111";
        end if;
    end process;
    f <= cnt;
end reg4;