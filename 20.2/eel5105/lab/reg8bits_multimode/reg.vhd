library ieee;
use ieee.std_logic_1164.all;

entity reg is port (
    w: in std_logic_vector(7 downto 0);
    clock: in std_logic;
    f: out std_logic_vector(7 downto 0) 
    );
end reg;

architecture reg8 of reg is
begin
    process(clock)
    begin
        if (clock'event and clock = '1') then
            f <= w;
        end if;
    end process;
end reg8;