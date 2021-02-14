library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
    LEDR: out std_logic_vector(17 downto 0)
);
end usertop;

architecture silly of usertop is
    signal AUX: std_logic_vector(3 downto 0);
begin 
    LEDR(7 downto 0) <= SW(7 downto 4) & AUX;
    AUX <= not SW(3 downto 0);
end silly;