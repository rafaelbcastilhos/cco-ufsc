library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic_vector(17 downto 0);
        CLK_1Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture reg4 of usertop is
    signal E, CLK, Q0, Q1, Q2, Q3: std_logic;

    component ffd is
        port(
            ENTRADA: in std_logic;
            CLOCK: in std_logic;
            S: out std_logic);
        end component;
begin
    E <= SW(0);
    CLK <= CLK_1Hz;

    FFD1: ffd port map(E, CLK, Q0);
    FFD2: ffd port map(Q0, CLK, Q1);
    FFD3: ffd port map(Q1, CLK, Q2);
    FFD4: ffd port map(Q2, CLK, Q3);

    LEDR(3) <= Q3;
    LEDR(2) <= Q2;
    LEDR(1) <= Q1;
    LEDR(0) <= Q0;

end reg4;