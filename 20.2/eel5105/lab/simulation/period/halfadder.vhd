library ieee;
use ieee.std_logic_1164.all;

entity halfadder is port ( 
  A,B: in std_logic;
  Sum,Cout: out std_logic);
end halfadder;

architecture hadder of halfadder is
begin
    Sum <= A xor B;
    Cout <= A and B;
end hadder;
