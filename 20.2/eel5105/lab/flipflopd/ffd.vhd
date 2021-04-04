library ieee;
use ieee.std_logic_1164.all;

entity ffd is port 
    (
        ENTRADA: in std_logic;
        CLOCK: in std_logic;
        S: out std_logic 
    );
end ffd;

architecture flipflopd of ffd is
begin
    process(CLOCK)
    begin
        if (CLOCK'event and CLOCK = '1') then
            S <= ENTRADA;
        end if;
    end process;
end flipflopd;