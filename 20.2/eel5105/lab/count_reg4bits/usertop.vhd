library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic_vector(17 downto 0);
        CLK_1Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture count4 of usertop is
    signal CLK, EN, CL: std_logic;
    signal O_REG: std_logic_vector(3 downto 0);
    signal SL: std_logic_vector(1 downto 0);

    component reg is
        port (
            enable: in std_logic;
            clear: in std_logic;
            clock: in std_logic;
            f: out std_logic_vector(3 downto 0) 
            );
    end component;
begin
    EN <= SW(0);
    CL <= SW(1);
    CLK <= CLK_1Hz;

    REG_1: reg port map(EN, CL, CLK, O_REG);

    LEDR(3 downto 0) <= O_REG;
end count4;