library IEEE;
use IEEE.Std_Logic_1164.all;

entity modb is
port (B: in std_logic;
    C1: in std_logic;
    C0: in std_logic;
    Bout: out std_logic
    );
end modb;

architecture modsumsub of modb is
begin
    Bout <= ((not C0) and B) or (C1 and (not B));
end modsumsub;