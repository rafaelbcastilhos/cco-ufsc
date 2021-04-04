library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
        SW: in std_logic_vector(17 downto 0);
        CLK_1Hz: in std_logic;
        LEDR: out std_logic_vector(17 downto 0)
    );
end usertop;

architecture reg8 of usertop is
    signal CLK: std_logic;
    signal E, O_SUM8, O_RIGHT, O_LEFT, O_MUX, O_REG: std_logic_vector(7 downto 0);
    signal SL: std_logic_vector(1 downto 0);

    component sum8 is
        port (w0, w1:  in std_logic_vector(7 downto 0);
              f:  out std_logic_vector(7 downto 0)
        );
    end component;

    component mux4to1 is
        port (w0: in std_logic_vector(7 downto 0);
            w1: in std_logic_vector(7 downto 0);
            w2: in std_logic_vector(7 downto 0);
            w3: in std_logic_vector(7 downto 0);
            s: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(7 downto 0)
        );
    end component;

    component right is
        port (w: in std_logic_vector(7 downto 0);
            f: out std_logic_vector(7 downto 0)
        );
    end component;

    component left is
        port (w: in std_logic_vector(7 downto 0);
            f: out std_logic_vector(7 downto 0)
        );
    end component;

    component reg is
        port (w: in std_logic_vector(7 downto 0);
            clock: in std_logic;
            f: out std_logic_vector(7 downto 0) 
        );
    end component;
begin
    E <= SW(7 downto 0);
    SL <= SW(17 downto 16);
    CLK <= CLK_1Hz;

    SUM8_1: sum8 port map(E, E, O_SUM8);

    RIGHT_1: right port map(E, O_RIGHT);
    LEFT_1: left port map(E, O_LEFT);
    
    MUX_1: mux4to1 port map(O_SUM8, E, O_RIGHT, O_LEFT, SL, O_MUX);
    REG_1: reg port map(O_MUX, CLK, O_REG);

    LEDR(7 downto 0) <= O_REG;
end reg8;