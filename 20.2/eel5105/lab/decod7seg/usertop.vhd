library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
	HEX0: out std_logic_vector(6 downto 0)
);
end usertop;

architecture decod7seg of usertop is
    component decod is
        port(decod_in: in std_logic_vector(3 downto 0);
            out_7seg: out std_logic_vector(6 downto 0));
        end component;

    signal input: std_logic_vector(3 downto 0);
begin

    input <= SW(3 downto 0);

    SEG1: decod port map(input, HEX0); 

end decod7seg;
