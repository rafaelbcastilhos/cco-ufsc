library ieee;
use ieee.std_logic_1164.all;

entity right is port (
    w: in std_logic_vector(7 downto 0);
    f: out std_logic_vector(7 downto 0)
    );
end right;

architecture plusr of right is
begin
    f <= "0" & w(7 downto 1);
end plusr ;