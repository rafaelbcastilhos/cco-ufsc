library IEEE;
use IEEE.Std_Logic_1164.all;

entity usertop is
port (SW: in std_logic_vector(17 downto 0);
	HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0)
);
end usertop;

architecture kgtolb of usertop is
    component soma8 is
        port(A: in std_logic_vector(7 downto 0);
            B: in std_logic_vector(7 downto 0);
            S: out std_logic_vector(7 downto 0));
        end component;

    component div4 is
        port(A: in std_logic_vector(7 downto 0);
            S: out std_logic_vector(7 downto 0));
        end component;

    component binbcd is
        port(bin_in: in std_logic_vector(7 downto 0);
            bcd_out: out std_logic_vector(11 downto 0));
        end component;

    component bcd7seg is
        port(bcd_in: in std_logic_vector(3 downto 0);
            out_7seg: out std_logic_vector(6 downto 0));
        end component;

    signal kg, sum1, sum2, div: std_logic_vector(7 downto 0);
    signal lb: std_logic_vector(11 downto 0);
begin

    kg <= SW(7 downto 0);

    -- multiplica por 2
    S1: soma8 port map(kg, kg, sum1);
    
    -- divide por 4
    D: div4 port map(kg, div);
    S2: soma8 port map(sum1, div, sum2);

    -- converte para bcd
    BIN: binbcd port map(sum2, lb); 

    -- exibe o primeiro segmento
    SEG1: bcd7seg port map(lb(3 downto 0), HEX0); 

    -- exibe o segundo segmento
    SEG2: bcd7seg port map(lb(7 downto 4), HEX1);

    -- exibe o terceiro segmento
    SEG3: bcd7seg port map(lb(11 downto 8), HEX2);

end kgtolb;