library ieee;
use ieee.std_logic_1164.all;

entity left is port (
    w: in std_logic_vector(7 downto 0);
    f: out std_logic_vector(7 downto 0)
    );
end left;

architecture plusl of left is
begin
    f <= w(6 downto 0) & "0";
end plusl ;