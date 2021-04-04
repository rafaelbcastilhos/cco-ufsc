library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity sum8 is
port (w0, w1: in std_logic_vector(7 downto 0);
      f: out std_logic_vector(7 downto 0)
    );
end sum8;

architecture mysum8 of sum8 is
begin
    f <= w0 + w1;
end mysum8;